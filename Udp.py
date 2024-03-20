import socket
import numpy as np

# Define the IP address and port of the MATLAB receiver
matlab_ip = '127.0.0.1'  # Use the actual IP address of the MATLAB receiver
matlab_port = 12345  # Use the actual port number that MATLAB is listening on

# Create a UDP socket
udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Data to be sent (example: numpy array)
data = np.array([1, 2, 3, 4, 5])

# Convert the numpy array to bytes for sending
data_bytes = data.tobytes()

# Send the UDP message to MATLAB
udp_socket.sendto(data_bytes, (matlab_ip, matlab_port))

# Close the socket
udp_socket.close()
