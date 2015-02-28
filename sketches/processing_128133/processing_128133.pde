
void setup(){
  size(400,400);
  frameRate(25);
}

float time = .01;
float set = 0;
int event = 0;

void draw() {
  if (set <= 100)
  background(#FFFFFF);
  else if (set <=150)
  {
  //background(#F6FA83);
  fill(#F6FA83,25);
  rect(0,0,400,400);
  }
  else if (set <= 200)
  {
   fill(#CA2504,15);
  rect(0,0,400,400); 
  //background(#CA2504);
  }
  else if (set <= 250)
{
  fill(#C00000,15);
  rect(0,0,400,400); 
  //background(#C00000);
}
  else
  {
 //background(0);
 fill(#000000,10);
 rect(0,0,400,400);
  }
  
  noStroke();
  
  if (set <=399){
  fill(#FAF30A);
  ellipse(150+set*0.5,150+set,120,120);
  set++;
  }
  
  if (set >= 300 && event == 0){
  fill(#FFFFFF);
  ellipse(random(50,350), random(50,350),5,5);
  ellipse(random(50,350), random(50,350),5,5);
  ellipse(random(50,350), random(50,350),5,5);
  }
  
  for (float i=0; i<=399; i++)
  {
   
   if (set > 250)
   stroke(#051264);
   else
   stroke(#F5A6ED);
   line(i,300+50*noise(i/100,time),i,400); 
  }
  time = time + .02;
  println(event);
  event++;
  event = event%5;
  println(event);
  
}
