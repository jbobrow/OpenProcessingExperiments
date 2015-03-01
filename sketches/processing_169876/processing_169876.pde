
void setup(){
  size(500, 500);
  smooth();
  frameRate (1);
}

void draw(){
    float my_angle_sec = second();
    float my_angle_min = minute();
    float my_angle_hour = hour();
    
    //second
    pushMatrix();
    translate(width/2, height/2);
    rotate(map(my_angle_sec, 0, 59, 0, 2*PI));
    noStroke();
    fill(0);
    rect(210,0, 20,2);
    popMatrix();
    
    //minute
    pushMatrix();
    translate(width/2, height/2);
    rotate(map(my_angle_min, 0, 59, 0, 2*PI));
    noStroke();
    fill(0);
    ellipse(140,0, 20,20);
    popMatrix();
    
    //hour
    pushMatrix();
    translate(width/2, height/2);
    rotate(map(my_angle_hour, 0, 23, 0, 2*PI));
    noStroke();
    fill(0);
    ellipse(73,0, 40,40);
    popMatrix();
}
