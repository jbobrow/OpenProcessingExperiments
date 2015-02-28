
float angle = 0.0;
int dim;
float timer = 0.0;
float x=200.0;
float y=200.0;
float z=200.0;
float incz = TWO_PI/25.0;
void setup()
{
  size(500,500);
    dim = width/2;
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
}

void draw()
{
  background(0);
   for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  } 
   for (int i = 1; i < 100; i=i+4) {
  rect(450, 400, i, 200+sin(z)*40.0);
  z = z + incz;
}
   
  timer+= 0.0167;
  if(timer<=2.99){
    textSize(20);
    text("Those were some spooky circumstances", 30, 400); 
  }
  if(timer>=3.00 && timer<=5.99){
    textSize(20);
    text("Something spooky was there with me", 30, 400); 
  }
  if(timer>=6.00 && timer <=8.99){
        textSize(20);
    text("I didn't eat my sandwich, a ghost did", 30, 400); 
  }
    if(timer>=9.00){
        textSize(20);
    text("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO", 30, 400); 
  }
 if(timer>= 3 && timer<=6){
 
  angle+=0.1;
  rectMode(CENTER);
  pushMatrix();
  translate(250,100);
  rotate(angle);
  rect(0,0,50,50);
  popMatrix();
 }
 if(timer>=6 && timer<=9){

   scale(timer/10,timer/10);
   rect(100,100, 100,100);
 }

}
void drawGradient(float x, float y) {
  int radius = dim/2;
  float h = random(0, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
}


