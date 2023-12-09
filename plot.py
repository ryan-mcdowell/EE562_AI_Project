import re
import matplotlib.pyplot as plt

# Read the data from the file
file_path = 'loss_log.txt'

with open(file_path, 'r') as file:
    data = file.read()

# Extract epoch and values for each column
epochs = []
D_A_values, G_A_values, cycle_A_values, idt_A_values = [], [], [], []
D_B_values, G_B_values, cycle_B_values, idt_B_values = [], [], [], []

lines = data.strip().split('\n')
for line in lines:
    match = re.search(r'\(epoch: (\d+),.*\) D_A: ([-+]?\d*\.\d+|\d+) G_A: ([-+]?\d*\.\d+|\d+) cycle_A: ([-+]?\d*\.\d+|\d+) idt_A: ([-+]?\d*\.\d+|\d+) D_B: ([-+]?\d*\.\d+|\d+) G_B: ([-+]?\d*\.\d+|\d+) cycle_B: ([-+]?\d*\.\d+|\d+) idt_B: ([-+]?\d*\.\d+|\d+)', line)
    if match:
        epoch = int(match.group(1))
        D_A_values.append(float(match.group(2)))
        G_A_values.append(float(match.group(3)))
        cycle_A_values.append(float(match.group(4)))
        idt_A_values.append(float(match.group(5)))
        D_B_values.append(float(match.group(6)))
        G_B_values.append(float(match.group(7)))
        cycle_B_values.append(float(match.group(8)))
        idt_B_values.append(float(match.group(9)))
        epochs.append(epoch)

# Plot each column against epoch
plt.plot(epochs, D_A_values, label='D_A')
plt.title('D_A values over epochs')
plt.xlabel('Epoch')
plt.ylabel('D_A')
plt.legend()
plt.show()

plt.plot(epochs, G_A_values, label='G_A')
plt.title('G_A values over epochs')
plt.xlabel('Epoch')
plt.ylabel('G_A')
plt.legend()
plt.show()

plt.plot(epochs, cycle_A_values, label='cycle_A')
plt.title('cycle_A values over epochs')
plt.xlabel('Epoch')
plt.ylabel('cycle_A')
plt.legend()
plt.show()

plt.plot(epochs, idt_A_values, label='idt_A')
plt.title('idt_A values over epochs')
plt.xlabel('Epoch')
plt.ylabel('idt_A')
plt.legend()
plt.show()

plt.plot(epochs, D_B_values, label='D_B')
plt.title('D_B values over epochs')
plt.xlabel('Epoch')
plt.ylabel('D_B')
plt.legend()
plt.show()

plt.plot(epochs, G_B_values, label='G_B')
plt.title('G_B values over epochs')
plt.xlabel('Epoch')
plt.ylabel('G_B')
plt.legend()
plt.show()

plt.plot(epochs, cycle_B_values, label='cycle_B')
plt.title('cycle_B values over epochs')
plt.xlabel('Epoch')
plt.ylabel('cycle_B')
plt.legend()
plt.show()

plt.plot(epochs, idt_B_values, label='idt_B')
plt.title('idt_B values over epochs')
plt.xlabel('Epoch')
plt.ylabel('idt_B')
plt.legend()
plt.show()
