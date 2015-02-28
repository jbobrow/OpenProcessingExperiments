
void setup()
{
  size(800,800);
  noLoop();
}

void draw()
{
  background(0);
  noFill();
//  fill(255,10);
 
 
 
/* strokeWeight(1);
 stroke(255);
 for(int i=0; i<800; i+=50) 
 {
 ellipse(400,400,100,i);
 ellipse(400,400,i,100);
 }
  
 */ 
  
  // strokeWeight(1);
   stroke(255);
 for(int i=0; i<800; i+=50) 
 {
  ellipse(400,400,i,i);
 }
 
 
 
  stroke(255);
  noFill();
  for(int i=0; i<800; i+=50) 
 {
 /* ellipse(400,400,800,800);
  ellipse(0,0,800,800);
  ellipse(0,400,800,800);
  ellipse(400,0,800,800);
 
  ellipse(800,800,800,800);
  ellipse(0,0,800,800);
  ellipse(0,800,800,800);
  ellipse(800,0,800,800);
 
  ellipse(400,800,800,800);
  ellipse(800,400,800,800);
  */
 
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
 
 
  line(0,0,800,800);
  line(800,0,0,800);
  line(400,0,400,800);
  line(0,400,800,400);



 for(int i=0; i<800; i+=50) 
 {

/*ellipse(200,400,400,400);

ellipse(600,400,400,400);

ellipse(400,200,400,400);

ellipse(400,600,400,400);*/


ellipse(200,400,i,i);

ellipse(600,400,i,i);

ellipse(400,200,i,i);

ellipse(400,600,i,i);

 }























}
