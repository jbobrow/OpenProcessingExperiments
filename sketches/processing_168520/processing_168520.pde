
void setup()
  {
    size(300,300);
    smooth();
    frameRate(2);
  }
  
  void draw()
  {
    background(0);
    float as = map(second(),0,60,0,TWO_PI); // angle of second hand, from 12
    float am = map(minute()+second()/60.0,0,60,0,TWO_PI); // angle of minute hand, from 12
    float ah = map(hour()+minute()/60.0,0,24,0,TWO_PI*2); // angle of hour hand, from 12
    float mLen = height*.4; // length of hands (m,s,h)
    float sLen = height*.4;
    float hLen =  height*.25;
  
    pushMatrix();
      translate(width/2,height/2); //Translates to the center of the screen
      fill(255);
      ellipse(0,0,width*.9, height*.9);
      fill(0);
      
      // draw hours markers
      strokeWeight(5);
      for (int i = 0; i < 12; ++i) {
        pushMatrix();
          rotate(radians(i*30));
          line(width*.38,0,width*.42,0);
        popMatrix();
      }
      strokeWeight(1);
            
            
      // draw seconds markers
      strokeWeight(2);
      for (int i = 0; i < 60; ++i) {
        pushMatrix();
          rotate(radians(i*6));
          line(width*.38,0,width*.42,0);
        popMatrix();
      }
      strokeWeight(1);
  
      // draw second hand
      pushMatrix();
        rotate(as);
        stroke(255,0,0);
        line(0,10,0,-sLen); // draw as if it's at noon, rotation takes care of the rest
        stroke(0);
      popMatrix();
  
      // draw minute hand
      pushMatrix();
        rotate(am);
        triangle(-5,10,0,-mLen,5,10); // draw as if it's at noon, rotation takes care of the rest
      popMatrix();
  
      // draw hour hand
      pushMatrix();
        rotate(ah);
        triangle(-5,10,0,-hLen,5,10); // draw as if it's at noon, rotation takes care of the rest
      popMatrix();
  
    popMatrix();
  }


