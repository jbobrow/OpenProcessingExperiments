
/*In this file zoog takes off into space & his eyes change colour as he rises!!*/

float zoogX;
float zoogY;

float eyeR;
float eyeG;
float eyeB;

void setup () {
    size(500,500);
    zoogX = width/2;
    zoogY = height + 100;
    smooth();
}
  
void draw() {
  
  background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  stroke(0);
  fill(150);
  rect(zoogX,zoogY, 20,100);
  
  stroke(0);
  fill(255);
  ellipse(zoogX,zoogY-30,60,60);
  
  
  //Zoog's eyes
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR, eyeG, eyeB);
  
  ellipse(zoogX-19,zoogY-30,16,32);
  ellipse(zoogX+19,zoogY-30,16,32);
  
  stroke(150);
  line(zoogX-10,zoogY+50,zoogX-10,height);
  line(zoogX+10,zoogY+50,zoogX+10,height);
  
  //zoog moves up!
  zoogY = zoogY - 1;
  
  //zoog shakes!
  zoogX = random(200);
  
  
  //ellipse(81,70,16,32);
 // ellipse(119,70,16,32);
 //line(81,150,80,160);
 //line(110,150, 120,160);
}

/*In the following code zoogs eyes would change colour when mousepressed occurs!!
void mousePressed () {
  fill(mouseX+pmouseX,mouseY+pmouseY, 100);
  ellipse(mouseX-20,mouseY-30,16,32);
  ellipse(mouseX+20,mouseY-30,16,32);
  
}*/

