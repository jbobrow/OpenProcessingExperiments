
void setup()
{
  size(800,800);
  noLoop();
}

void draw()
{
  background(0);
  noFill();

stroke(255);
 rectMode(CENTER);
 for(int i=0; i<800; i+=50)  //center boxes
 {
    rect(mouseX,mouseY,i,i);
   
 }

pushMatrix();
translate(400,0);//attempt to center axis
rotate(radians(45));//rotate axis
for(int i=0; i<800; i+=50)  //rotated center boxes
 {
    rect(mouseX,mouseY,i,i);
 }


popMatrix();



 //  stroke(255,0,0);
 for(int i=0; i<800; i+=50)  //center cirlces
 {
  ellipse(mouseX,mouseY,i,i);
 }
 
 
 
 // stroke(255,148,8);

 for(int i=0; i<800; i+=50)  //half edge cirlces
 {

  ellipse(mouseX,mouseY,i,i);
  ellipse(mouseX,mouseY,i,i);
  ellipse(mouseX,mouseY,i,i);
 
  ellipse(mouseX,mouseY,i,i);
  ellipse(mouseX,mouseY,i,i);
  ellipse(mouseX,mouseY,i,i);
  ellipse(mouseX,mouseY,i,i);
 
  ellipse(mouseX,mouseY,i,i);
  ellipse(mouseX,mouseY,i,i);
  }
 
 
  line(mouseX,mouseY,800,800); // lines
  line(mouseX,mouseY,0,800);
  line(mouseX,mouseY,400,800);
  line(mouseX,mouseY,800,400);


//stroke(247,250,111);
 for(int i=0; i<800; i+=50)  //middle side circles
 {

ellipse(mouseX,mouseY,i,i);

ellipse(mouseX,mouseY,i,i);

ellipse(mouseX,mouseY,i,i);

ellipse(mouseX,mouseY,i,i);

 }
 
}
