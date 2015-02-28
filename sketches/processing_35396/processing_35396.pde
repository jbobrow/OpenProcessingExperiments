
void setup(){
  size (500, 500);
  frameRate(7);
} 


//Create an epileptic seizure inducing face screaming in silence

int centX=500/2;
int centY=500/2;

void draw(){
  background(random(256),random(256),random(256),random(100));
  ellipse(centX, centY, random(200), random(100));
  ellipse(100, 100, 50, 50);
  ellipse(400, 100, 50, 50);
}
                
                
