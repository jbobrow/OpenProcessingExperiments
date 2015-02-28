
void setup(){
 size(250,250);
 background(255);
 smooth();
 frameRate(10);
}

void draw(){
 for(
int c=20; c<250; c+=30)
{
 noStroke();
  fill(#FF0320,10);
  ellipse(10,c,10,10);
  fill(#FF038A,10);
  ellipse(30,c,10,10);
  fill(#D403FF,10);
  ellipse(50,c,10,10);
  fill(#7703FF,10);
  ellipse(70,c,10,10);
  fill(#1603FF,10);
  ellipse(90,c,10,10);
   fill(#03B1FF,10);
  ellipse(110,c,10,10);
   fill(#03FFCE,10);
  ellipse(130,c,10,10);
 fill(#03FF4C,10);
  ellipse(150,c,10,10);
  fill(#A1FF03,10);
  ellipse(170,c,10,10);
 fill(#FFE603,10); 
  ellipse(190,c,10,10);
  fill(#FF9F03,10); 
  ellipse(210,c,10,10);
  fill(#FF5703,10); 
  ellipse(230,c,10,10);
}
}

                        
