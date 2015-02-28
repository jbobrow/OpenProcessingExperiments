
void setup(){
size(500,500);


}
void draw(){
  background(mouseX,mouseX,mouseY);
  fill(mouseX,mouseY,mouseX,200);
  arc(250,250,300, 300, PI,TWO_PI);
  
  rect(210,250,90,200);
   
  line(100,250,400, 250);
  fill(mouseY,mouseY,mouseY);
  ellipse(mouseY,mouseY,50,50);
  fill(mouseX-pmouseX,mouseY);
  ellipse(mouseX,mouseX, 50,50);
  fill(mouseX-pmouseY,mouseY);
  ellipse(mouseY,mouseX, 50,50);

/*fill(mouseX,mouseY,mouseX,200);
stroke(mouseY-pmouseY);
strokeWeight(abs(mouseX-pmouseX));
ellipse(mouseX,mouseY, 50,50);*/
}

void mousePressed(){
  fill(mouseX,mouseY,206);
  ellipse(mouseX,mouseY,100,100);
}

