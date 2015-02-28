

                
          size(790,700); //16:9
background(45);
smooth();
 
//elipse
fill(252,130,130);
strokeWeight(2);
stroke(255,255,255);
ellipse(random(width), random(height), 140, 140);
 
 
strokeWeight(0);
stroke(78,78,78);
line(random(width), random(height), random(width), random(height));
 
strokeWeight(0);
point(random(width), random(height));
strokeWeight(10);
 
arc(random(width), random(height), 100, 100, radians(0), radians(random(360,180)));
 
noFill();
quad(random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));
 
fill(random(105),random(300),random(200));
rect(random(width), random(height), random(width), random(height));
 
fill(random(200),random(205),random(380));
triangle(random(width), random(height), random(width), random(height), random(width), random(height));
ellipse (random (width),random(height), 250,250);
ellipse (random (width),random(height), 355,355);

    
strokeWeight(5); 
stroke(random(255), random(255), random(255));  
line(random(width), random(height), random(width), random(height) ); 

stroke(random(255), random(255), random(255));
point ( random(width), random(height)); 

stroke(random(255), random(255), random(255)); 
arc ( width/2, height/2, 100,100, radians(0), radians ( random(360)) ); 

stroke(random(255), random(255), random(255));
noFill(); 
quad(random(width), random(height),random(width), random(height),random(width), random(height),random(width), random(height)); 
 
stroke(random(255), random(285), random(230));
rect(60, 60, 100, 30);
ellipse (random (width),random(height), 250,250);
ellipse (random (width),random(height), 355,355);

ellipse (random (width),random(height), 250,250);
ellipse (random (width),random(height), 355,355);

ellipse (random (width),random(height), 250,250);
ellipse (random (width),random(height), 355,355);


ellipse (random (width),random(height), 250,250);
ellipse (random (width),random(height), 355,355);

arc(random(width), random(height), 120, 120, radians(10), radians(random(180,180)));

stroke(random(255), random(255), random(255));
point ( random(width), random(height)); 
 
saveFrame("composição aimples.jpg");
      
