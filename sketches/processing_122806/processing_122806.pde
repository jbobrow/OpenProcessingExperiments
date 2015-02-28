
void setup(){
size(500,500);
background(255,255,255);
}

void draw(){
background(255,255,255);
  
  fill(0,200,200);
ellipseMode(CENTER);
ellipse(mouseX+30,mouseY+80,50,20);

fill(0,200,200);
ellipseMode(CENTER);
ellipse(mouseX-30,mouseY+80,50,20);
  
  stroke(0);
fill(0,200,150);
ellipseMode(CENTER);
ellipse(mouseX-80,mouseY+20,30,30);

stroke(0);
fill(0,200,150);
ellipseMode(CENTER);
ellipse(mouseX+80,mouseY+20,30,30);

stroke(0);
fill(0,200,255);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,150,150);

stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(mouseX-40,mouseY-30,60,60);

stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(mouseX+40,mouseY-30,60,60);



stroke(0);
fill(0);
rectMode(CENTER);
rect(mouseX,mouseY+30,100,40);

stroke(0);
fill(255);
rect(mouseX-30,mouseY+20,15,15);

stroke(0);
fill(255);
rect(mouseX-10,mouseY+20,15,15);

stroke(0);
fill(255);
rect(mouseX+10,mouseY+20,15,15);

stroke(0);
fill(255);
rect(mouseX+30,mouseY+20,15,15);



println("#yolo");
}
