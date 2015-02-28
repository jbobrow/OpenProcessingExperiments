

/*
variables for circles coordinates

*/
int x = 100;
float y = 150;
int r = 100;
float t = 350;

void setup() {
  size(500, 500);
  background(0, 0, 255);
  smooth();
  noStroke();
}

void draw() { 
  fill(0, 0, 255, 20);
  rect(0, 0, width, height);  // semi-transparent rectangular is drawn, so that circles leave trace of movement 
  
  textSize(15);
  fill(255);
  text("click on the sketch to start playing",width/4, 50); //focus on sketch explained
  textSize(20);
  text("Press A to move red circle and L to move yellow.", width/8, height-10); //controls explained
  
  /* 
  drawing circles
  */
  
    fill(255, 0, 0); 
    ellipse(x, y, 40, 40);
    fill(255, 255, 0); 
    ellipse(r, t, 40, 40);
 /*
 conditions when top circle wins
 */
 
  if (x>width) {
    fill(0);
    rect(0, 0, width, height);
    textSize(40);
    fill(255);
    text("red wins", width/2-100, height/2);
  }
  
   /*
 conditions when bottom circle wins
 */
  
  if (r>width) {
    fill(0);
    rect(0, 0, width, height);
    textSize(40);
    fill(255);
    text("yellow wins", width/2-140, height/2);

}
}
   /*
 game controls
 */
 
void keyPressed() {
  if (key == 'a') {
    
      x+=10;
      y=y+random(-3, 3);
    } 
 
    if (key == 'l') {
      r+=10;
      t=t+random(-3, 3);
    } 
}



