
void setup(){
size(500,500);
}

void draw(){
background(255);
smooth();
//body
fill(mouseX,0,mouseY);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,50,25);

//roga
noFill();
arc(mouseX,mouseY-10,38,5,0,TWO_PI-PI/2);
fill(200,100,0);
ellipse(mouseX-10,mouseY-30,2,2);
fill(200,100,0);
ellipse(mouseX+10,mouseY-30,2,2);

//eyes
fill(100,200,0);
ellipse(mouseX-10,mouseY,2,2);
fill(100,200,0);
ellipse(mouseX+10,mouseY,2,2);
}

void mousePressed() {
  println("Take me to your leader!");
}
