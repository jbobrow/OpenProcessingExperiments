
/*@pjs preload="star1.png";*/
size(400,400);

//size(400, 400);
noStroke();
colorMode(HSB, 90, 80, 20);

fill(0, 100, 100);
rect(50, 50, 300, 300);  

fill(60, 100, 100);
rect(400, 50, 300, 300);    

fill(20, 100, 100);
rect(150, 150, 100, 100);   
 
fill(20, 100, 100);
rect(500, 150, 100, 100);

PImage img;    
 
//size(400, 400);       
img = loadImage("star1.png"); 
image(img,160,160,200,230);

stroke(50,60,50);
strokeWeight(60);    
line(300, 80, 100, 80); 




