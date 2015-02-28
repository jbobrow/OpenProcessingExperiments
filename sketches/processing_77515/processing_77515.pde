
void setup()
{
  size (200,200);
  background(250,13,13);
}
void mickey(){
  fill(13,250,228);
  ellipse (30,30,30,30);
  ellipse (70,30,30,30);
  fill (255);
  ellipse (50,50,50,50);
  fill (250,13,223);
  ellipse (42,42,8,8);
  ellipse (58,42,8,8);
  fill(0);
  rect (45,60,10,10);
  rect (38,75,25,25);
  line (10,70,90,90);
}

void draw ()
{ 
   if (mousePressed){
  fill(13,250,228);
  ellipse (30,30,30,30);
  ellipse (70,30,30,30);
  fill (255);
  ellipse (50,50,50,50);
   fill (250,13,223);
  ellipse (42,42,8,8);
  ellipse (58,42,8,8);
  fill(0);
  rect (45,60,10,10);
  rect (38,75,25,25);
  line (10,70,90,90);
  
   }else{
     fill(0);
  ellipse (30,30,30,30);
  ellipse (70,30,30,30);
  fill (255);
  ellipse (50,50,50,50);
  fill(0);
  ellipse (42,42,8,8);
  ellipse (58,42,8,8);
  fill(0);
  rect (40,60,20,10);
  rect (38,75,25,25);
  line (10,70,90,90);
      
  
}}

