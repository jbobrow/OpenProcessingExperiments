
//prisca ohito, hw3 48-257 2.6.13, 
//copyright by prisca a ohito 2013;

float wd, ht;

void setup()
{
  size(400, 400);
  background(0);
  smooth();


  line(0, 0, width, height);
  println(frameCount);

}

void draw()
{
   //big ellipse
   ellipse(mouseX, mouseY, random(100), random(100));
   wd = wd;
   ht = ht;

  //small elllipse
   ellipse(pmouseX-50, pmouseY-50, random(10,200), random(10,200));
   wd = wd;
   ht = ht;
   float distx = mouseX - pmouseX * .5;
   float disty = mouseY - pmouseY * .5;
   fill(random(255),random(255), random(255), 20);
     noStroke();  
     
  //tiny ellipse
     ellipse(pmouseX-25, pmouseY-25, random(10,200), random(10,200));
   wd = wd;
   ht = ht;
   float distx2 = mouseX - pmouseX * .3;
   float disty2 = mouseY - pmouseY * .3;
   fill(random(255),random(255), random(255), 20);
     noStroke();  
     
  //tiniest ellipse
   ellipse(pmouseX-5, pmouseY-5, random(10,200), random(10,200));
   wd = wd;
   ht = ht;
   float distx3 = mouseX - pmouseX * .15;
   float disty3 = mouseY - pmouseY * .15;
   fill(random(255),random(255), random(255), 20);
     noStroke();  
}
