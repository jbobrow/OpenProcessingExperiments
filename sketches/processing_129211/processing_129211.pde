
float counter=0; 
void setup()
{
size(500,500);
background(0);
}
void draw()
{
 translate(width/2,height/2);

  background(0);
  pushMatrix();
  translate(cos(counter)*100,sin(counter)*100); 
  fill(255,0,0);
  rect(0,0,40,40);
  popMatrix();
  println(counter);
  counter +=second();


  pushMatrix();
  translate(cos(counter)*100,sin(counter)*100); 
  ellipse(0,0,40,40);
  popMatrix();
  println(counter);
  counter +=minute(); 

 pushMatrix();
  translate(cos(counter)*100,sin(counter)*100); 
  ellipse(0,0,40,40);
  popMatrix();
  println(counter);
  counter +=hour(); 
}
