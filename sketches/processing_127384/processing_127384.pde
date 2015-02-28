
int counter = 0;

void setup(){
 size(640,480);
 background(255,255,255);

 strokeWeight(10);
 line(0,0,400,400);
 stroke(128,128,128);
 strokeWeight(5);
 line(0,10,400,410);
 fill(0,255,0);
 rect(320,240,128,128);
 ellipse(240,240,128,128);
 fill(0,255,255);
 triangle(240,240,320,240,240,320);
}
void draw()
{
  point (counter,counter);
  if (counter<255){
  counter = counter + 1;
  }
  else 
  { counter=0;
  }
   //background(counter);
   
}


