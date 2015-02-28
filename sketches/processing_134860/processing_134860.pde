
void setup(){
size(400,400);
noStroke();
smooth();
}
void draw(){
background(0);
fill(160,150);
  fill(234,234,234,200);
  rect(mouseX*1.5,height/2,mouseX/2,mouseX/2);
  fill(mouseX,mouseY,150);
  ellipse(200,mouseY,50,50);
  fill(234,234,234,200);
  ellipse(mouseX/2,mouseY/2,20,20);

}


