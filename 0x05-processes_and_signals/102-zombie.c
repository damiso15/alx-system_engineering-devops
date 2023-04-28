#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

/**
 * infinite_while - a function that creates an infinite while loop
 *
 * Return: 0 as success
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}


/**
 * main - the main function
 *
 * Return: 0 as success
 */
int main(void)
{
	pid_t pid;
	int num;

	for (num = 0; num < 5; num++)
	{
		pid = fork();
		if (pid > 0)
		{
			printf("Zombie process created, PID: %d\n", pid);
		}
		else
		{
			exit(0);
		}
	}

	infinite_while();

	return (0);
}
