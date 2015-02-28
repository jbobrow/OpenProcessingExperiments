
//Lathem Wojno
//Creatures
//8/5/2013

void setup() {
  size(500,700);
  smooth();
}

// MadCreature
void draw() {
  if (mousePressed) {
  background(0);
  //body
  rect(mouseX,mouseY,100,200);
  fill(225,6,6);
  
  //eyes
  ellipse(mouseX+30,mouseY+50,30,50);
  ellipse(mouseX+70,mouseY+50,30,50);
  
  //mouth
  rect(mouseX+15,mouseY+150,70,30);
  
  //eyebrows
  line(mouseX+35,mouseY+15,mouseX+45,mouseY+25);
  line(mouseX+65,mouseY+15,mouseX+55,mouseY+25);
  } else {
  //ScaredCreature
   background(225);
  //body
  rect(mouseX,mouseY,100,200);
  fill(6,6,225);
  
  //eyes
  ellipse(mouseX+30,mouseY+50,30,50);
  ellipse(mouseX+70,mouseY+50,30,50);
  
  //mouth
  rect(mouseX+15,mouseY+100,70,80);
  
  //eyebrows
  line(mouseX+30,mouseY+15,mouseX+15,mouseY+25);
  line(mouseX+70,mouseY+15,mouseX+85,mouseY+25);
   
  }
}
