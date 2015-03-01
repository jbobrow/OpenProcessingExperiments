
void setup() {
  size(640, 640);
  smooth(8);
}
void draw() {
  background(0);
  /*
    We want second and minute and hour to equal 360 when they reach there highest value. 
    So 6*60 = 360 and 15*24 = 360.
    We minus 90 because at radians(360) to the lines face to the right. We want them to face up or at angle 270.
    To do this we minus 90 from 360. 360-90 = 270. 
    The hour hand is different because on a clock face we only show 12 hours. If we minus 90 the line faces opposite 
    its desired direction. So we plus 90 to make it face its correct direction.
  */
  
  for(int i = 0; i < 360; i+=6) {
    float x = width/2 + cos(radians(i-90)) * 210;
    float y = height/2 + sin(radians(i-90)) * 210;
    /* Display a dot every 5 minuet mark*/
    if(((i/6)%5) == 0){ 
      /* To display the time */
      //text(i/6, x, y); 
      fill(255, 0, 0);
      ellipse(x, y, 5, 5);
    }
  }
  
  stroke(255);
  /* Hour hand */
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(15*hour()+90));
  line(0, 0, 100, 0);
  popMatrix();
  
  /* Minute hand */
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(6*minute()-90));
  line(0, 0, 200, 0);
  popMatrix();
  
  /* Second hand */
  pushMatrix();
  stroke(255, 0, 0);
  translate(width/2, height/2);
  rotate(radians(6*second()-90));
  line(0, 0, 150, 0);
  popMatrix();
  /* Second hand base */
  fill(255, 0, 0);
  ellipse(width/2, height/2, 10, 10);
}



