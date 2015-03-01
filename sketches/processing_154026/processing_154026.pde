

boolean bg_change = true;
int   circleCount = 200;
float angle_incr = 2*PI / circleCount;
int savedTime;
int totalTime1 = 3000;
int totalTime2 = 30000;
  
  void setup() {
    size(600,600);
    smooth();
    noStroke();
    frameRate(15);
    savedTime = millis();
  }
  
  void draw() {
    background(255);
    if(!bg_change){
      background(random(60,250), random(60, 255), random(60, 255));
     }
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime2) {
      exit();
    }
    float elapsedSeconds = millis()*.002;
    float angle_incr = radians(2 + frameCount/15.0);
    float cx = width/6;
    float cy = height/7;
    float outer_rad = width*.35; 
    float sm_diameter = 10;
    
    for (int i = 4; i <= circleCount; ++i) {
      float ratio = i/(float)circleCount;
      float spiral_rad = ratio * outer_rad;
      float angle = i*angle_incr;
      float x = cx + cos(angle) * spiral_rad;
      float y = cy + sin(angle) * spiral_rad;
    
      // draw tiny circle at x,y
      color c1 = color(random(60, 250),random(60, 250),random(60, 250), map(i, circleCount/3, circleCount, 300, 0));
      fill(c1);
      
      //ellipse TL
      pushMatrix();
       if (!bg_change){
      ellipse( x, y, sm_diameter, sm_diameter/1);
       }
      popMatrix();
      
      //ellipse 2 center
      pushMatrix();
       int passedTime1 = millis() - savedTime;
       if (passedTime1 > totalTime1) {
      ellipse(x+200, y+200, sm_diameter, sm_diameter/2);
       }
      popMatrix();
      
      //ellipse 3 BR
      pushMatrix();
        if (!bg_change){
      ellipse(x+400, y+400, sm_diameter, sm_diameter/1);
       }
      popMatrix();
      
      //ellipse4
      pushMatrix();
        if (!bg_change){
      ellipse(x, y+400, sm_diameter, sm_diameter+2);
       }
      popMatrix();
      
      
      //ellipse 5
      pushMatrix();
        if (!bg_change){
               ellipse(x+400, y, sm_diameter, sm_diameter+2);
       }
       
      popMatrix();
    }
  }    
  
void mousePressed(){
  bg_change = !bg_change;
}



