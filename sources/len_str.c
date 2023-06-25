/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   len_str.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dtelnov <dtelnov@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/04 04:48:18 by dtelnov           #+#    #+#             */
/*   Updated: 2023/05/05 01:19:33 by dtelnov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_strlen(char *s)
{
	int	len;

	len = 0;
	while (s[len])
		++len;
	return (len);
}

int	ft_strarglen(char *s)
{
	int		len;

	if (!s)
		return (6);
	len = 0;
	while (s[len])
		++len;
	return (len);
}
