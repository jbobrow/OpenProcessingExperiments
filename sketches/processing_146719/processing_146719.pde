
 
//float watch;
PImage img;
 
void setup()
{
 size (400,400);
 frameRate (5);}

void draw()
{
  watch=random(1);
  img = loadImage("pika.jpg");
  //clear();
  if (mousePressed) 
   {image (img,15,10);}
  
  else
  {
  background(255);
  fill(200,0,0);
  ellipse(200,200,125,125);
  ellipse(200,200,300,300);
     fill(255);
  arc(200,200,300,300,0, PI*1);
  fill(0);
  rect(50,190,300,25);
  ellipse(200,200,125,125);
  fill(255);
  ellipse(200,200,100,100);
  fill(0);
  ellipse(200,200,50,50);
}  
}  


