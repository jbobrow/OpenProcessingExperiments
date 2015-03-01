
/*@pjs preload="rokubungi.png";*/
PImage img;   
 
size(400, 400);    
background(0);    
img = loadImage("rokubungi.png");    
 colorMode(RGB,256);
 background(50,150,150);
tint(50,150,150);     
image(img,-50,20,500,500 );  
stroke(0);
strokeWeight(7);
line(220,200,220,215);
line(180,200,220,200);
line(180,200,180,250);
line(180,250,220,250);
line(220,250,220,235);
line(220,235,200,235);




