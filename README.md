# Minitalk
The purpose of this project is to code a small data exchange program using UNIX signals.


2.1 - Requirements
You must create a communication program in the form of a client and a server.

The server must be started first. After its launch, it has to print its PID.
The client takes two parameters: 1) The server PID 2) The string to send.
The client must send the string passed as a parameter to the server. Once the string has been received, the server must print it.
The server has to display the string pretty quickly. Quickly means that if you think it takes too long, then it is probably too long.
Your server should be able to receive strings from several clients in a row without needing to restart.
The communication between your client and your server has to be done only using UNIX signals.
You can only use these two signals: SIGUSR1 and SIGUSR2.
2.2 - Note #1 - Display a string, not char by char
To be noted that as per the subject, it cannot be displayed char-by-char on the server-side, it must be displayed the whole message received instead:

Once the string has been received, the server must print it.

Therefore, it must be known in advance the length of the message so the server can allocate memory in the heap as required only once (best approach). Or alternatively, don't send the lenght and keep modifying the allocation in memory - joining a char to already received string - till receiving the last char (not so good approach since will have to repeat allocation for every new char received). The following functions from libft could be used:

ft_strlen(), to know the length of the message to be sent from client to server
ft_calloc(), in order to save the chars being received till the string is completed received on server side, so it can be then displayed
2.3 - Note #2 - Communication between server and client (two way channel)
The server has to display the string pretty quickly. Quickly means that if you think it takes too long, then it is probably too long.
Researching about the theme, two options arise:

using a delay function like sleep() or usleep() avoiding the communication of signals back and forward between server/client, which would impose a delay per char, since we would be sending in blind way (no feedback loop) chars from client to server. Depending on the delay set signals could queue.

the other option would be to implement a feedback loop so whenever client sends a char to server, it waits till server sends back a ACK signal informing client that the next bit can be sent. This later solution should be a lot quicker since there would be no delay function. This solution is aligned with the bonus: The server acknowledges every message received by sending back a signal to the client.

As noted on the subject, there should not be sent signals blindly, making the two-way communication the best implementation.

Linux system does NOT queue signals when you already have pending signals of this type! Bonus time?
