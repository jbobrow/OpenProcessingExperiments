
/*@pjs preload="hato1.png";*/
PImage img;

size(400, 400); 
background(237, 129, 167); 
img = loadImage("hato1.png"); 

tint(0, 0, 0);  
image(img,150, 150); 

strokeWeight(1);   
ellipse(400, 0, 50, 50);  

strokeWeight(1);   
ellipse(200, 400, 50, 50);  

strokeWeight(1);   
ellipse(0, 0, 50, 50);  

stroke(1); 
strokeWeight(7); 
line(20, 20, 200, 200); 

tint(0, 153, 0);
image(img, 150, 0);  

tint(0, 169, 235);
image(img, 270, 220);     

stroke(1); 
strokeWeight(7); 
line(200, 200, 200, 375); 

stroke(1); 
strokeWeight(7); 
line(380, 18, 200, 200); 

tint(254, 238, 0);
image(img, 40, 220); 











