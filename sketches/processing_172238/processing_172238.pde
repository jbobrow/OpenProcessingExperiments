
float counter;

void setup(){
size(4800,600);
background(255);
counter=0.0;
}

void draw()
{
pushMatrix();
fill(255,40);
translate(width/2,height/2);
counter++;
rotate(counter*TWO_PI/360);
  for(int i = 25; i <1250; i=i+25)
  {
  ellipse(50,i,50,i);
 
 }
popMatrix();
}


