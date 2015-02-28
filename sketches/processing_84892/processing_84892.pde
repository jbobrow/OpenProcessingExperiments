
void setup() {
  size(500,500);
  background(255);
  frameRate(30);
}
void draw() {

 
  rectMode(CENTER);
  stroke(200,200,0);
  fill(200,200,0);
  rect(mouseX,mouseY,50,50);
stroke(200,0,0);
fill(200,0,0);
ellipse(mouseX,mouseY-50,50,50);


strokeWeight(10);

line(mouseX-15,mouseY+25,pmouseX-15,pmouseY+50);
line(mouseX+15,mouseY+25,pmouseX+15,pmouseY+50);
line(mouseX-25,mouseY-25,pmouseX-40,pmouseY+20);
line(mouseX+25,mouseY-25,pmouseX+40,pmouseY+20);
strokeWeight(1);
fill(0,0,200);
ellipse(mouseX,mouseY-60,20,20);
fill(0,200,0);
arc(mouseX,mouseY-40,30,20,0,PI);
print(" this is just a dream ");

}
void keyPressed() {
  background(255);
}


