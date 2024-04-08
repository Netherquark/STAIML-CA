import numpy as np

class MovingAverageTS:

    def __init__(self, window):
        self.window = window
        self.time_series_sequence = np.random.rand(100)
        
    def moving_average(self):
        weights = (np.repeat(1.0, self.window)) / self.window 
        return np.convolve(self.time_series_sequence, weights, 'valid')

window = 10

moving_average_inst = MovingAverageTS(window)
result = moving_average_inst.moving_average()
print("Moving averages are: \n", result)
