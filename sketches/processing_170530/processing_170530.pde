
float bendAmount = 60;
 
void setup(){
  size(640, 640);
  noStroke();
  fill(120, 0, 255, 5);
}
 
void draw(){
  background(0);
  for(int i = 0; i < 360; i+=2){
    float x = width/2+sin(radians(i)) * 100;
    float y = height/2+cos(radians(i)) * 100;
    float d = map(dist(mouseX, mouseY, x, y), -100, 100, -bendAmount/2+3, bendAmount/2);
    /* This brings the performance of the sketch down, however gives the glow effect. */
    for(int j = 40; j > 0; j-=4){
      pushMatrix();
      translate(x, y);
      //this is how it blur(draw many many ellipse)
      rotate(radians(90)-atan2(mouseX-x, mouseY-y));
      ellipse(-bendAmount, 0, abs(j-d), abs(j-d));
      popMatrix();
    }
  }
}


