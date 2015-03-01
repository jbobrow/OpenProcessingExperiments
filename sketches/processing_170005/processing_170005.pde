
float my_sec;
float easing =0.03;

void setup(){
  size(500, 500);
  smooth();
  frameRate (30);
}

void draw(){
  float targetSec = second();
  float my_angle_sec = targetSec - my_sec;
  if (abs(my_angle_sec)>1){
    my_sec+=my_angle_sec * easing;
  }
    float my_angle_sec1 = my_sec;
    float my_angle_min = minute();
    float my_angle_hour = hour();
    
    //second
    pushMatrix();
    translate(width/2, height/2);
    rotate(map(my_angle_sec1, 0, 59, 0, 2*PI));
    noStroke();
    fill(255);
    ellipse(0,0, 400,400);
    fill(200);
    ellipse(0,0, 360,360);
    fill(0);
    ellipse(190,0, 10,10);
    popMatrix();
    
    //minute
    pushMatrix();
    translate(width/2, height/2);
    rotate(map(my_angle_min, 0, 59, 0, 2*PI));
    noStroke();
    fill(255);
    ellipse(0,0, 340,340);
    fill(0);
    ellipse(155,0, 20,20);
    popMatrix();
    
    //hour
    pushMatrix();
    translate(width/2, height/2);
    rotate(map(my_angle_hour, 0, 23, 0, 2*PI));
    noStroke();
    fill(200);
    ellipse(0,0, 280,280);
    fill(255);
    ellipse(0,0, 260,260);
    fill(200);
    ellipse(0,0, 145,145);
    fill(0);
    ellipse(100,0, 40,40);
    popMatrix();
}
