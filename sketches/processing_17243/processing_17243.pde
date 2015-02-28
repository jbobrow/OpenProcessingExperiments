
class Dragonball {
  //variables
  float speedX;
  float speedY;
  float c_alpha;
  float [] xpos= new float [60];
  float [] ypos= new float [60];
  
  Dragonball (float xpos_, float ypos_, float speedX_, float speedY_, float c_alpha_) {
    speedX=speedX_;
    speedY=speedY_;
    c_alpha=c_alpha_;
    //initialize arrays 
    for (int i=0; i<xpos.length; i++) {
      xpos [i]=xpos_;
      ypos [i]=ypos_;
    }
    
  }

  void move () {
    //new location
    xpos [xpos.length-1]+=speedX;
    ypos [ypos.length-1]+=speedY-random(speedY/3);
    //shift array value
    for (int i=0; i<xpos.length-1; i++) {
      xpos[i]=xpos[i+1];
      ypos[i]=ypos[i+1];
    }
  }
  
  void randMove () {
    xpos [xpos.length-1]-=random(speedX*0.9);  //add randomization of movement
    ypos [ypos.length-1]-=random(speedY*0.9);
  }
    
  
  void bounce () {
    //bounce
    if (xpos[xpos.length-1]<0 | xpos[xpos.length-1]> width) {
      speedX= (-1)*speedX;
    }
    if (ypos[ypos.length-1]<0 | ypos[ypos.length-1]>height) {
      speedY=(-1)*speedY;
    }
  }
  
  void display () {
    ellipseMode(CENTER);
    colorMode(HSB);    
    strokeWeight(1);
//    noFill();
    //draw circles
    for (int i=0; i<xpos.length; i++) {
      stroke ((c_alpha+i*3)%255, 255, 255, 0+i*4);
      fill ((c_alpha+i*2)%255, (i*20)%255, 100+random(50), 0+i);
      ellipse (xpos[i], ypos[i], i/random(0.9,1.1), i/random(0.9,1.1));
    }
  }
  
}
  
  

