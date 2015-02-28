
               
                size(790,700); //16:9
background(298);
smooth();

fill(255,177,177);
strokeWeight(4);
stroke(255,255,255);
ellipse(random(width), random(height), 100, 100);
 
strokeWeight(0);
stroke(61,61,61);
line(random(width), random(height), random(width), random(height));
 
strokeWeight(50);
point(random(width), random(height));
strokeWeight(20);
arc(random(width), random(height), 100, 100, radians(0), radians(random(360)));
 
noFill();
quad(random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));
 
fill(random(255),random(320),random(290));
rect(random(width), random(height), random(width), random(height));
 
fill(random(250),random(265),random(320));
triangle(random(width), random(height), random(width), random(height), random(width), random(height));

ellipse (random (width),random(height), 248,238);

ellipse (random (width),random(height), 356,123);
 
saveFrame("composição primitiva aimples.jpg");
