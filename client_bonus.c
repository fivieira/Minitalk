
#include "minitalk_bonus.h"

void	ft_atob(int pid, char c)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((c & (0x01 << bit)))
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		usleep(500);
		bit++;
	}
}

void confirm_MSG(int signal)
{
	if (signal == SIGUSR2)
	{
		ft_printf("Mensagem recebida com sucesso\n");
	}
	
}

int main(int argc, char *argv[])
{
	int	pid;
	int	i;

	i = 0;
	if(argc	== 3)
	{
		pid = ft_atoi(argv[1]);
		while (argv[2][i] != '\0')
		{
			ft_atob(pid, argv[2][i]);
			i++;
		}
		signal(SIGUSR2, confirm_MSG);
		ft_atob(pid, '\0');
	}
	else
	{
		ft_printf("Error\n");
		return (1);
	}
	return (0);
}