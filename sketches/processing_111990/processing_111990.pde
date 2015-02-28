
float angle = 0.0;
float timer = 0.0;
float x=200.0;
float y=200.0;
float incx = TWO_PI/25.0;
void setup()
{
  size(500,500);
}

void draw()
{
  background(0);
   for (int i = 1; i < 100; i=i+4) {
  ellipse(i, 400, i, 200+sin(x)*80.0);
  x = x + incx;
}
   
  timer+= 0.0167;
  if(timer<=2.99){
    textSize(32);
    text("what is zombo?", 10, 30); 
  }
  else{
    textSize(32);
    text("Is that zombo?", 10, 250); 
  }
  
 if(timer>= 3){
 
  angle+=0.1;
  rectMode(CENTER);
  pushMatrix();
  translate(250,100);
  rotate(angle);
  rect(0,0,100,100);
  popMatrix();
 }
 if(timer>=5 && timer<=6){

   scale(timer/10,timer/10);
   rect(100,100, 100,100);
 }

}


