from ctypes import *
import os
from random import sample


def test_no_conversion(capfd):
    compare(capfd, b"")
    compare(capfd, b"\n")
    compare(capfd, b"\n\n")
    compare(capfd, b"wololo")
    compare(capfd, b"wololo\n")
    compare(capfd, b"wololo\nwololo")
    compare(capfd, b"wololo\nwololo\n")


def test_c(capfd):
    compare(capfd, b"l%cl", ord("o"))
    # compare(capfd, b"l%cl", 0)
    compare(capfd, b"%c%c%c%c", *map(ord, "Axel"))


def test_s(capfd):
    compare(capfd, b"%s", b"oui")
    # compare(capfd, b"%s", bytes([42] * 1000000))
    compare(capfd, b"\n%s\n", b"oui")
    compare(capfd, b"wo%so", b"lol")
    compare(capfd, b"wo%so", b"lol\0lol")
    compare(capfd, b"%s%s", b"yolo", b"wesh")
    compare(capfd, b"%s", 0)


def test_p(capfd):
    compare(capfd, b"%p", b"hmmm")
    compare(capfd, b"%p", addressof(c_char_p(b"wololo")))
    compare(capfd, b"%p", addressof(c_int(42)))
    compare(capfd, b"%p", 1234)
    compare(capfd, b"%p", 0)


def test_di(capfd):
    int_max = 1 << 31
    int_min = -int_max
    for n in [
        int_min,
        int_min + 1,
        *range(-128, 128),
        int_max,
        *sample(range(int_min, int_max + 1), 200),
    ]:
        compare(capfd, b"%d", n)
        compare(capfd, b"%i", n)


def test_u(capfd):
    for n in [*range(300), (1 << 32) - 1, *sample(range(1 << 32), 200)]:
        compare(capfd, b"%u", n)


def test_x(capfd):
    for n in [*range(300), (1 << 32) - 1, *sample(range(1 << 32), 200)]:
        compare(capfd, b"%x", n)


def compare(capfd, format, *args):
    sb = create_string_buffer(1000)
    printf_return = lib.sprintf(sb, format, *args)
    printf_output = sb.value.decode("utf-8")
    ft_printf_return = lib.ft_printf(format, *args)
    ft_printf_output = capfd.readouterr().out
    info = f"{printf_output=} | {ft_printf_output=} | {printf_return=} | {ft_printf_return=} | {format=} | {args=}"
    assert printf_output == ft_printf_output and printf_return == ft_printf_return, info


os.system("rm -f *.o")
for file in os.listdir("../srcs"):
    if file.endswith(".c"):
        os.system(f"gcc -c -fPIC ../srcs/{file}")
os.system("gcc -shared -o libftprintf.so *.o ../libft/libft.a")
lib = CDLL("./libftprintf.so")
lib.ft_printf(b"nice %d\n", 69)
