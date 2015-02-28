
float x;
float y;
float targetX;
float targetY;
float easing = .05;
int enemy;
float [] enex = new float [15];
float [] eney = new float [15]; 

 

void setup ()
{
    loadImage ("YOU-LOSE.jpg"); 
  size (800, 800);
  background (200, 120, 225); 
  smooth ();
  for (int i = 0; i < 10; i++){
  enex [i] = random (0, 800);
  eney [i] = random (-800, 800);
  
  }

  }
  
void draw() 
{
  background (200, 120, 225); 
  for (int i = 0; i < 10; i++) {
    enemy (enex [i], eney [i]);
    eney [i] += 15; 
    if (eney [i] > height) {
    eney[i] =0;
    }
  targetX = mouseX;
  float dx = targetX - x;
  if (abs(dx) > 1){
    x += dx * easing; 
                  }
  targetY = mouseY;
  float dy =targetY - y;
  if (abs(dy) > 1){
    y += dy * easing;
}
if (mouseX == enex[i] && mouseY == eney[i]) {
 loadImage ("YOU-LOSE.jpg"); 
}
fill (0, 255, 0);
ellipse (x, y, 25, 25);
fill (255, 0, 0);





}
}

void enemy (float x, float y){
  fill (255,0,0);
  rect (x, y, 55, 55);
}




