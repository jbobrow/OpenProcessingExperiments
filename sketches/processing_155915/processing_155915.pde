
float xPos;
float change;
float random;


void setup(){
size(500,500);
background(0,0,0);
xPos = 0;
frameRate(30);
noStroke();

//fill(255,220,0);
}

void draw(){
  //background(random+mouseX,mouseY,random+mouseY);
  xPos+=0.1;
  random(-50,0);
  //triangle(30, 75, 58, 20, 86, 75);
triangle(mouseX+random,mouseY+random,28+mouseX+random,mouseY+random,mouseX+random,mouseY+random);
fill(random,mouseY+random,mouseX+random);
triangle(80+mouseY+random,mouseX+random,mouseY,mouseX+random,mouseY+random,mouseY+random);
fill(mouseY+random,mouseX+random,random);
triangle(mouseX+random,mouseX,mouseY,mouseY+random,mouseX+mouseY+random,mouseY+random);
fill(mouseY+random,mouseX+random,random);
triangle(mouseY+random,mouseX,mouseY,mouseX+random,mouseX+mouseY+random,mouseY+random);
fill(mouseY+random,mouseX+random,random);
triangle(mouseX+random,random,mouseY+random,20+mouseX,86+random,75+mouseX+random);
fill(random,mouseY+random,mouseX+random);
}



