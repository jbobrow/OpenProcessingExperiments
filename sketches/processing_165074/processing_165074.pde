
/*@pjs preload="star.png";*/

 
size(400, 400);    
background(#4369F7);  

stroke(#5607E3);   
strokeWeight(5);  
line(20, 20, 20, 380);  

stroke(#5607E3);   
strokeWeight(5);  
line(20, 20, 380, 20);

stroke(#5607E3);   
strokeWeight(5);  
line(20, 380, 380, 380);

stroke(#5607E3);   
strokeWeight(5);  
line(380, 20, 380, 380);

stroke(175,67,247);   
strokeWeight(5);  
line(50, 20, 50, 380);

stroke(214,95,15);   
strokeWeight(5);  
line(35, 20, 35, 380);

stroke(62,173,38);   
strokeWeight(5);  
line(20, 35, 380, 35);

stroke(201,183,14);   
strokeWeight(5);  
line(20, 50, 380, 50);

stroke(175,67,247);   
fill(0);
rect(310,300,50,50);

stroke(175,67,247);   
fill(#4702C1);
rect(300,320,50,50);


PImage img;    
 
img = loadImage("star.png");
image(img,45,15,200,200);      

    


