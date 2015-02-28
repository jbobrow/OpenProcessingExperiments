
void setup()
{
  size(800,800);
  noLoop();
}

void draw()
{
  background(0);
  noFill();




   stroke(255,0,0);
 for(int i=0; i<800; i+=50)  //center cirlces
 {
  ellipse(400,400,i,i);
 }
 
 
 
  stroke(255,148,8);

 for(int i=0; i<800; i+=50)  //half edge cirlces
 {

  ellipse(0,0,i,i);
  ellipse(0,400,i,i);
  ellipse(400,0,i,i);
 
  ellipse(800,800,i,i);
  ellipse(0,0,i,i);
  ellipse(0,800,i,i);
  ellipse(800,0,i,i);
 
  ellipse(400,800,i,i);
  ellipse(800,400,i,i);
  }
 
 
  line(0,0,800,800); // lines
  line(800,0,0,800);
  line(400,0,400,800);
  line(0,400,800,400);


stroke(247,250,111);
 for(int i=0; i<800; i+=50)  //middle side circles
 {

ellipse(200,400,i,i);

ellipse(600,400,i,i);

ellipse(400,200,i,i);

ellipse(400,600,i,i);

 }


}
