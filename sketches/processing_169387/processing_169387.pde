
void setup()
  {
    size(500,500);
    smooth();
    frameRate(2);
  }
  
  
  void draw()
  {
    background(255);
    float as = map(second(),0,60,0,TWO_PI); // angle of second hand, from 12
    float am = map(minute()+second()/60.0,0,60,0,TWO_PI); // angle of minute hand, from 12
    float ah = map(hour()+minute()/60.0,0,24,0,TWO_PI*2); // angle of hour hand, from 12
    float mLen = height*.37; // length of hands (m,s,h)
    float sLen = height*.4;
    float hLen =  height*.25;
    
   
    
    if (ah < 18 && ah > 7 ){
      background(0);
    };
    
    pushMatrix();
      translate(width/2,height/2); // Much simpler if we translate to the center of the screen
      fill(255);
      strokeWeight(5);
      ellipse(0,0,width*.9, height*.9);
      fill(0);
      
      // draw hour markers
      strokeWeight(5);
      for (int i = 0; i < 12; ++i) {
        pushMatrix();
          rotate(radians(i*30));
          line(width*.38,0,width*.42,0);
        popMatrix();
      }
      // draw second markers
      strokeWeight(3);
      for (int i = 0; i < 60; ++i) {
        pushMatrix();
          rotate(radians(i*6));
          line(width*.40,0,width*.42,0);
        popMatrix();
      }
      strokeWeight(1);
  
      // draw second hand
      pushMatrix();
        rotate(as);
        noStroke();
        fill(255,0,0);
        ellipse(175,0,15,15); // draw as if it's at noon, rotation takes care of the rest
        stroke(0);
        fill(0);
        strokeWeight(1);
      popMatrix();
      
      pushMatrix();
        ellipse(0,0,15,15);
      popMatrix();
      
  
      // draw minute hand
      pushMatrix();
        rotate(am);
        noStroke();
        fill(0);
        triangle(15,-150,-15,-150,0,-180); // draw as if it's at noon, rotation takes care of the rest
        stroke(0);
        fill(0);
      popMatrix();
  
      // draw hour hand
      pushMatrix();
        rotate(ah);
        stroke(0);
        strokeWeight(5);
        fill(255);
        triangle(20,-90,-20,-90,0,-130); // draw as if it's at noon, rotation takes care of the rest
        stroke(0);
        fill(0);
      popMatrix();
  
    popMatrix();
    
      int D=day();
      String Date = str(D);
      noFill();
      strokeWeight(2);
      stroke(0);
      rect(width/2+70,height/2-28,60,50);
      textSize(40);
      fill(0);
      text(Date,width/2+75,height/2+12.5);
     
  }
  


