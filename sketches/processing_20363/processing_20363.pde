
// All Examples Written by Casey Reas and Ben Fry  
// 
size(600, 200);  
background(102);  
  
// Load the font. Fonts are located within the   
// main Processing directory/folder and they  
// must be placed within the data directory  
// of your sketch for them to load  
PFont fontA = loadFont("Arial");  
  
// Set the font and its size (in units of pixels)  
textFont(fontA, 16);  
  
int x = 30;  
  
// Use fill() to change the value or color of the text  
fill(0);  
text("Seeking Processing tutor for regular hours and an interesting project",width*.1,height*.1);
text ("Please contact dennisgdaniels@gmail.com",width*.1,height*.2);
PFont fontB = loadFont("Arial");  


textFont(fontB,64);
text ("$",width*.4,height*.7);              
