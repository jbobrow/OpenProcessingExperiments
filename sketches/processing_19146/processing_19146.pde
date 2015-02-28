
PFont bob;
String louise = "0"; 

void setup(){
  size (250,250);
  smooth();
  background(0);
  bob = createFont("Garamond",50);
}

void draw(){
  stroke(0);
  textFont(bob,250);
  text("0", 45, 215);
}

 
void mousePressed(){
  textMode(CENTER);
  textFont(bob,100);
  fill(random(255),random(250),random(250),random(255));
  text(louise,random(250),random(250));
}

