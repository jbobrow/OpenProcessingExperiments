
int numdrills = 4;
PImage[] drills = new PImage[numdrills - 1];

 
void setup(){
  size(750,750);
  for (int i = 0; i <= numdrills-1; i++){
   drills[i] = loadImage ( i + ".png"); 
  }
  drill = new Drills (375 , 375 , 0);
  dirt = new Dirt (random(750),random(750));
  
}

void draw(){
  background(250,250,250);
  
  drill.move();
  drill.spin();
  drill.draw();
  
  dirt.collide();
  dirt.draw();
  
 
}

/////////////////////////////////////////////////Dirt Class
    
  class Dirt {
    float x;
    float y;
    boolean dead;
    
    Dirt (float DIRT_X, float DIRT_Y) {
      x = DIRT_X;
      y = DIRT_Y;
    }
    
    void draw(){
      imageMode(CENTER);
      if(dead == false){
      fill(126,88,31);
      rect(x,y,25,25);
      }
    }
    
    void collide(){
     if  (x >= drill.drill_x - 25 && x <= drill.drill_x +25 && y >= drill.drill_y - 60 && y <= drill.drill_y + 60){
       dead = true;
       
    }
    }
    
  
  }

/////////////////////////////////////////////////Drill class

class Drills {
  float drill_x;
  float drill_y;
  float drill_rotate;
  int drill_loaded;
  boolean drill_spin;
  
  Drills (float DRILL_X, float DRILL_Y, float DRILL_ROTATE) {
    drill_x = DRILL_X;
    drill_y = DRILL_Y;
    drill_rotate = DRILL_ROTATE;
  }
  
  void draw(){
    pushMatrix();
    imageMode(CENTER);
    translate(drill_x,drill_y);
    rotate(radians(drill_rotate));
    translate(-drill_x,-drill_y);
    image(drills[drill_loaded],drill_x,drill_y);
    popMatrix();
    }
  
  void spin(){
    if(key == 'd' || key == 'D'){
    drill_spin = true;
    }
    if(drill_spin == true){
      drill_loaded ++;
    }
    if (drill_loaded == 3){
      drill_loaded = 0;
    }

  if( key == ' '){
    drill_spin = false;
    }
  }
  
  void move(){
    
  
    if(drill_rotate < -90 || drill_rotate > 90){
    int drill_y_move = .05*abs(drill_rotate/2);
    int drill_x_move = .05*abs(drill_rotate/2);
    if(drill_y >= height-60){
      drill_y = height-59;
      }
    if(drill_y <= 60){
      drill_y = 59;
      }
  if(drill_x >= width-25 ){
    drill_x = width-24;
  }
    if (drill_x <= 25 ){
      drill_x = 26;
    }
  
    }
    else{
    int drill_y_move = .05*abs(drill_rotate);
    int drill_x_move = .05*abs(drill_rotate);
    if(drill_y >= height-60){
      drill_y = height-59;
      }
    if(drill_y <= 60){
      drill_y = 59;
      }
  if(drill_x >= width-25 ){
    drill_x = width-24;
  }
    if (drill_x <= 25 ){
      drill_x = 26;
    }
  }
  
  if(drill_rotate <= 25 && drill_rotate >= -25){
    int drill_y_move = 1+.05*abs(drill_rotate);
    int drill_x_move = 1+.05*abs(drill_rotate);
  }
    
    
  if(drill_spin == true){
    if(drill_rotate <= -90 && drill_rotate >= -180){
      drill_y -= drill_y_move;
    }
    if(drill_rotate >= -90 && drill_rotate <= 0){
      drill_y += drill_y_move;
    }
    if(drill_rotate >= 0 && drill_rotate <= 90){
      drill_y += drill_y_move;
    }
    if(drill_rotate >= 90 && drill_rotate <= 180){
      drill_y -= drill_y_move;
    }
    else{
      drill_y = drill_y;
    }
    
    if(drill_rotate < 0){
    drill_x += drill_x_move;
    }
    if(drill_rotate > 0){
    drill_x -= drill_x_move;
    }
    else{
      drill_x = drill_x;
    }
  }
  
  if (keyPressed == true){
    if (keyCode == RIGHT){
      drill_rotate -= 3;
      if (drill_rotate < -180){
        drill_rotate += 360;
      }
      /* if(drill_rotate >= 1){
      drill_rotate = 1;
    }
    */
    }
    if (keyCode == LEFT){
      drill_rotate += 3;
    }
    if (drill_rotate > 180){
        drill_rotate -= 360;
      }
     /* if(drill_rotate <= -1){
      drill_rotate = -1;
    }
    */
  }
  }
  
}



