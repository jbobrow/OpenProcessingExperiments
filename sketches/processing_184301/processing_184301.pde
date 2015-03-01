
void setup(){
  size(700,400);
  background(175,222,232);
  noStroke();
  smooth();
}

void draw(){
  if(mouseY<200){
  background(175,222,232);
  //sun
  fill(242,233,107);
  ellipse(mouseX,mouseY,30,30);
  //cloud
fill(255,160);
ellipse(mouseX*2,mouseY*2,55,30);ellipse(mouseX*2+15,mouseY*2+25,75,35);ellipse(mouseX*2+100,mouseY*2-100,85,30);
  }
  if(mouseY>200){
  background(17,77,138);
  //moon
  fill(217,220,222);
  ellipse(mouseX+300,mouseY-250,20,20);
  //comet
  fill(225,240,28,170);
  ellipse(pmouseY+320,100,10,10);ellipse(pmouseY+315,100,10,10);ellipse(pmouseY+310,100,10,10); 
}
if(mouseY>200){
  //stars
  pushMatrix();
  fill(255,150);
  for(int i=0; i<390; i=i+25){
    for(int a=0; a<720; a=a+40){
    ellipse(a,i,2,2);
    }
  }
  popMatrix();
}
//land & trees
fill(148,227,169);
ellipse(350,400,900,350);
}
