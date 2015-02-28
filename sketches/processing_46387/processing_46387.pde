

float r = 200;
float g = 125;
float b = 130;

int xPos =400;
int yPos =200;

void setup() {
  size(600,400);
}

void draw() {
  
  background(r,g,b);  

//background changer
  if(mouseX > width/2) {
    r = r + 1; 
  } else {
    r = r - 1;
  }

 
  if (r > 255) {
    r = 255; 
  } else if (r < 0) {
    r = 0; 
  }
  
  //panda
  //center
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //legs
  line(mouseX-10,mouseY+40,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+40,pmouseX+10,pmouseY+60);
  
  //ears
  fill(220,125,125);
  ellipse(mouseX-20,mouseY-55,25,25);
  ellipse(mouseX+20,mouseY-55,25,25);
  
  //body
  fill(200,100,100);
  rect(mouseX,mouseY,30,90);
  
  //head
  ellipse(mouseX,mouseY-40, 45,45);
  
  //eyes
  fill(0);
  ellipse(mouseX-10,mouseY-35,20,20);
  ellipse(mouseX+10,mouseY-35,20,20);
  
  //pupils
  fill(225);
  ellipse(mouseX-12,mouseY-33,5,5);
  ellipse(mouseX+12,mouseY-33,5,5);
}




