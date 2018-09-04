## Discreet-Cosine-Transform-DCT-Singular-Value-Decomposition-SVD-based-Copy-Move-Forgery-Detection

Coded by Tejas Krishna Reddy
Around March 2018.

Anyone doing research based on copy move forgery systems need to implement and understand the process using DCT transformations first. This is your first stage of success. The code attached in the repository shows you the program to detect CMF images using DCT alone. If you need to implement CMFD using SVD, You just have to change that part of the program (hardly 1 line).

Things to understand in simple english:
1. When you apply DCT over any matrix, the high-frequency concentrations tend to be visible in the first few pixels and most of the other pixels tend to become 0. So, in simple language only the first 3-4 pixels have significant values and others are just zero. 

The image is divided into blocks of 8x8 pixels overlapping each other. In a 64x64 image, 57x57 blocks can be formed. Now each of these blocks need to be compared with each other to check if similarity exists. Checking 8x8=64 pixels with 57x57 other blocks is of high computational cost. But now after applying DCT, you just have 3-4 significant values that need to be compared. 

2. DCT is robust to brightness. In simple language, if you take a matrix and add a particular value to all the pixels equally. Later the DCT produced to the original and the forged matrix remains the same. 
Therefore, if there is an image in which a part of it is copied, added brightness (1 particular value, or a range of similar values) and then moved to an other part of the same image, CMFD using DCT can reveal the copy moved regions.

However, applying DCT is not the best possible solution. Do look out for the other documentations I have uploaded in my account, they are kind of advanced CMFD procedures, but I have tried my best to explain them in simple and understandable language. CMFD has a lot of scope to improve over the future.

Also Note, 
The code attached is mine, but the pdf attached isn't. It is a wonderfully documented pdf that I found online, and hence have uploaded it for further reference.
