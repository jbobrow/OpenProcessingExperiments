
float m;
float h;
float s;
float winkel_Sec;
float Smooth_Sec;

void setup(){
  size(500, 500);
  smooth();
  frameRate (30);
  winkel_Sec = map(second(),0,60,0,TWO_PI);
}

void draw(){
  Smooth_Sec = map (millis(), 0, (1000 * 60), 0, TWO_PI) + winkel_Sec;
  s = map(second(), 0, 60, 0, TWO_PI);
  m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI); 
  h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2);
  
  
  
  background(100);
  fill(50);
  noStroke();
  ellipse((width/2)+5,(height/2)+5,400,400);
    //second
    pushMatrix();
    translate(width/2, height/2);
    rotate(Smooth_Sec);
    noStroke();
    fill(255);
    ellipse(0,0, 400,400);
    fill(100);
    ellipse(0,0, 360,360);
    fill(0);
    ellipse(0,-190, 10,10);
    popMatrix();
    
    //minute
    pushMatrix();
    translate(width/2, height/2);
    rotate(m);
    noStroke();
    fill(255);
    ellipse(0,0, 340,340);
    fill(0);
    ellipse(0,-155, 20,20);
    popMatrix();
    
    //hour
    pushMatrix();
    translate(width/2, height/2);
    rotate(h);
    noStroke();
    fill(100);
    ellipse(0,0, 280,280);
    fill(255);
    ellipse(0,0, 260,260);
    fill(255);
    ellipse(0,0, 145,145);
    fill(100);
    ellipse(0,0, 140,140);
    fill(80,150,255,255);
    ellipse(0,0, 120,120);
    fill(0);
    ellipse(0,-100, 40,40);
    popMatrix();
}
