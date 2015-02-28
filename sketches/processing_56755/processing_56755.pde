
class Drowner {
  float xpos;
  float ypos;

  float angle;
  float going;
  int suit=int(random(1, 11));
  float xspeed;
  int suitColor;
  float lane;
  float realx;
  boolean close;
  float hypotenuse;
  float a, b;
  float scale;
  boolean drown=false;
  float slow=1;
  float blush=0;
  float pull=0;

  Drowner(float t_xpos, float t_lane, float t_xspeed, float t_angle) {
    xpos=t_xpos;
    lane=t_lane;
    angle=t_angle;
    xspeed= map(t_xspeed, 20, 100, 0, 3);


    if (lane>0&&lane<1) {
      ypos=92-28;
    }
    else if (lane>=1&&lane<2) {
      ypos=2*92-28;
    }
    else if (lane>=2&&lane<3) {
      ypos=3*92-28;
    }
    else if (lane>=3&&lane<4) {
      ypos=4*92-28;
    }
    else if (lane>=4&&lane<5) {
      ypos=5*92-28;
    }

    if (suit == 0) { 
      suitColor = color (49, 34, 27); //green
    } 
    else if (suit == 1) { 
      suitColor = color (193, 148, 107); //purple
    } 
    else if (suit == 2) { 
      suitColor = color (171, 119, 82); //yellow
    } 
    else if (suit == 3) { 
      suitColor = color (168, 116, 69); //red
    } 
    else if (suit == 4) { 
      suitColor = color (80, 47, 32); //blue
    }
    else if (suit == 5) { 
      suitColor = color (142, 91, 60); //blue
    }
    else if (suit == 6) { 
      suitColor = color (216, 159, 106); //blue
    }
    else if (suit == 7) { 
      suitColor = color (207, 173, 128); //blue
    }
    else if (suit == 8) { 
      suitColor = color (222, 188, 151); //blue
    }
    else if (suit == 9) { 
      suitColor = color (251, 212, 171); //blue
    }
    else if (suit == 10) { 
      suitColor = color (254, 230, 184); //blue
    }
  }

  //draw to screen
  void display() {
    //color+shrink
    pushMatrix();
    fill(100);
    translate(realx, ypos+pull);


    fill(suitColor);
    ellipseMode(CENTER);
    ellipse(0, 0, 30, 30);


    if (drown==true) {
      fill(255, 0, 0, blush);
      ellipseMode(CENTER);
      ellipse(0, 0, 30, 30);
    }
    popMatrix();
    if (mousePressed==true&&drown==true&&close==true) {
      pull+=5;
    }


    if (close==true) {
      float a=(realx-width/2);
      float b=(height-ypos);

      strokeWeight(10);
      stroke(220);
      hypotenuse=sqrt(a*a+b*b);
      scale=((30/hypotenuse));

      line(width/2, height, realx-a*scale, ypos+b*scale+pull);

      //string   



      //buoy
      pushMatrix();
      stroke(255);
      strokeWeight(15);
      noFill();

      translate(realx, ypos+pull);  
      ellipse(0, 0, 60, 60);
      strokeWeight(12);
      line(15, 15, 25, 25);
      line(-15, 15, -25, 25);
      line(15, -15, 25, -25);
      line(-15, -15, -25, -25);
      popMatrix();
      noStroke();
    }
  }

  //vehicle
  void movement() {
    angle+= 0.009*xspeed*slow;
    going = cos(angle+xpos);
    realx= 1000+e_x+(going*960);
  }

  //touching or not
  void touching() {
    float d = dist(mouseX, mouseY, realx, ypos+pull);
    if (d<=30)
    {
      close=true;
    }

    if (d>30)
    {
      close=false;
    }
  }

  void drowning() {
    if ((drownTime-gameTime)<=0)
    {
      drown=true;
      slow=0.2;
      blush+=1.2;
    }

    if ((ypos+pull)>500) {
      saved=true;
    }
  }

  void pan() {
    if (gameOver==true) {
      if ( (1000+(going*960))>1000) {
        panRight=true;
        if (e_x<-1000)
        {
          panRight=false;
          mode=3;
        }
      }

      if ((1000+(going*960))<=1000) {

        panLeft=true;
        if (e_x>0)
        {
          panLeft=false;
          mode=3;
        }
      }
    }
  }
}


