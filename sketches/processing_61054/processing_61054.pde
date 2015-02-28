
//Mid term - Sarah Lesnikoski

/* What I found in CODeDOC and the concept of bringing 3 points together 
relatable to painting was the way in which colors are points on a palette 
that must be crossed to reach a desired mixture. Press any key to
stop mixing. */


boolean bStop;
float y,z;
 
void setup() {
  size(600,600);
  background(200,200,200);
  noStroke();
  frameRate(7);
}
 
void draw() {
  y = cos(radians(z)) * height;
  z = sin(radians(y)) * 700;
  
  fill(143,112,255,30);   
  rect(75,525,y,z);
  fill(51,10,10,20);
  ellipse(600,0,z,z);
  fill(195,225,20,40);
  rect(0,125,z,y);
  fill(5,51,71,50);
  rect(450,150,z,z);
  fill(140,205,70,30);
  ellipse(150,150,y,y);
  
    
    fill(70,102,255,5);
    ellipse(300,300,300,300);
    fill(0,255,204,10);
    rect(0,402,300,50);
    fill(255,255,255,15);
    triangle(300,450,150,150,450,150); 
}

void keyPressed() {
  bStop = !bStop;
  if (bStop)
    noLoop();
  else
    loop();
}
   

 

 
 /* I used various sources to understand how to write this code. Mainly; 
    Learning Processing by Shiffman, and open/processing.org and lots of 
    playing with rgb color charts. */


