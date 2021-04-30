# Discrete-Time-Convolution
## LTI Systems
A system which produces an output signal from any input signal subject to constraints linearity and time invarience. Such a system called Linear Time Invariant(LTI) System .
Let's say x[n] is an input signal and y[n] is the output signal of the system. If the input is Impulse function, then the corresponding output is called Impulse response. 
The Impulse Response of a system is represented h[n]. If h[n] is known, it is possible to find the output of the system for any input signal using convolution.

## Convolution
In a Linear Time Invariant(LTI) systems convolution is a very important proceses. Below equation shows the Convolution Sum.
![convolutionSum](https://latex.codecogs.com/gif.latex?y%5Bn%5D%20%3D%20x%5Bn%5D*h%5Bn%5D%20%3D%20%5Csum_%7Bm%3D-%5Cinfty%7D%5E%7B%5Cinfty%7Dx%5Bm%5Dh%5Bn-m%5D)

## Algorithm
Lets say input sequence is x[n] = [ <ins>1</ins>  2  3  4  5 ]. Underline represents n=0. In other words x[0] = 1. 
The impulse response of the system is h[n] = [ <ins>1</ins> 1  2]. Than we use convolution sum in Matlab.

Flip the h[n], so we got h[-m] = [ 2 1 1 ] </br>
Add zero to h[-m] and x[m] while the lengths get equal and last element of h[-m] must under the first nonzero element of x[m]. So,
x[m]  = [  0  0  1  2  3  4  5  ]  </br>
h[-m] = [  2  1  1  0  0  0  0  ] </br>
Now, multiply all of element these element by element and sum the result. Than shift the h[-m] 1 unit to the right.
x[m] x h[-m] = 1
After shifting, </br>
x[m]  = [  0  0  1  2  3  4  5  ]  </br>
h[-m] = [  0  2  1  1  0  0  0  ] </br>
sum(x[m] x h[-m]= = 1 + 2 = 3 </br>
</br>
x[m]  = [  0  0  1  2  3  4  5  ]  </br>
h[-m] = [  0  0  2  1  1  0  0  ] </br>
sum(x[m] x h[-m]= = 2 + 2 + 3 = 7 </br>

It continues untill the multiplication is zero. At the we get y[n] = [ <ins>1</ins> 3 7 11 15 13 10 ]

[GUI](https://prnt.sc/12bngjh)
