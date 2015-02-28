
float zoogX;
float zoogY;

float eyeR;
float eyeG;
float eyeB;


void setup() {
 size(200,200);
 zoogX = width/2;
 zoogY = height + 0;
 smooth();

}

void draw() {
 background(255);
 ellipseMode(CENTER);
 rectMode(CENTER); 
 
 
 //Draw Zoog´s body
 stroke(202, 150, 0);
 fill(150);
 rect(zoogX, zoogY, 20, 100);
 
 // Draw Zoog´s head
 stroke(0);
 fill(255);
 ellipse(zoogX, zoogY - 30, 60, 60);
 //        50     50 - 30 = 20
 
 //Draw Zoog´s eyes
 stroke(0);
 eyeR = random(255);
 eyeG = random(255);
 eyeB = random(255);
 fill(eyeR, eyeG, eyeB);
 ellipse(zoogX - 19 , zoogY - 30, 16, 32);
 ellipse(zoogX + 19, zoogY - 30, 16, 32);
 
 //Draw Zoog´s legs
 stroke(0);
 line(zoogX - 10, zoogY + 50, zoogX - 10 , zoogY + 60);
 line(zoogX + 10, zoogY + 50, zoogX + 10 , zoogY + 60);
 
 
 //Draw Zoog´s hands
 line(90,100, 25,100);
 line(110,100, 150,100);
 
 zoogY = zoogY - 1;
  
}

void mousePressed () {
 println ("llévame con tu líder"); 
}
