
class Drop {
  float x,y,initx,inity,dotWidth,x_speed,y_speed,linex,liney,angle;
  String name;
  int maxalpha=100;
  boolean write=false;
  boolean onscreen=true;
  boolean to_fade=true;
  boolean sparklefade=false;
  int initR,initG,initB,R,G,B,check,droptype;
  color col,initcol;
  Drop(float d_spd, float d_size){
   dotWidth=d_size;
   setmode();
   setcolor();
   angle=random(radians(360));
  }
  
  void update(){
   move();
   if ((y>height) || (y<0) || (x<0) || (x>width)) onscreen=false; else onscreen=true;  // check to see if drop is on the screen
   
   /* if (sparklefade){                              // fades non-uniformly
      check=int(random(25));
      if (check==1) col=color(initR*(1-(y/height)),initG*(1-(y/height)),initB*(1-(y/height)));
    } */
  }
  
  void move(){        
    if (speed_mode==0){      // normal movement
      x+=x_speed;
      y+=y_speed;
      linex+=x_speed;
      liney+=y_speed;
    }
    if (speed_mode==1){      // chaotic
      x+=random(4*x_speed)-2*x_speed;
      y+=random(4*y_speed)-2*y_speed;
    }
  }
  
  void setcolor(){
    int rand=int(random(100));
    if (rand<cutoff){
      droptype=0;
      initR=int(random(155))+100;
      initG=0;
      initB=0;
    }
    if (rand>=cutoff){
      droptype=1;
      initR=0;
      initG=0;
      initB=int(random(155))+100;
    }
    R=initR;
    G=initG;
    B=initB;
    col=color(R,G,B);
  }
  
  
  void setmode(){              // Settings for each mode
    if (run_mode==0) {
      if (fixed){
        initx=random(width);
        inity=0;
      }
      else {
        initx=mouseX;
        inity=mouseY;
      }
//      initx=random(width);
//      inity=0;
      x=initx;
      y=inity;
      linex=x+random(dotWidth*2)-dotWidth;
      liney=y+random(dotWidth*2)-dotWidth;
      x_speed=0;
      y_speed=random(speedbase)+(speedbase/2);
    }
    if (run_mode==1) {
      if (fixed){
        initx=width/2;
        inity=height/2;
      }
      else {
        initx=mouseX;
        inity=mouseY;
      }
      x=initx;
      y=inity;
      linex=x+random(dotWidth*2)-dotWidth;
      liney=y+random(dotWidth*2)-dotWidth;
      x_speed=random(speedbase*2)-speedbase;
      y_speed=random(speedbase*2)-speedbase;
    }
  }
  
  void fade(){      // control fading and update drop color
  if (run_mode==0) {
      if (fade_mode==0) col=color(initR,initG,initB,255*(y/height));
      if (fade_mode==1) col=color(initR,initG,initB,255*(1-(y/height)));
    }
    if (run_mode==1) {
      if (fade_mode==0) col=color(initR,initG,initB,maxalpha*(1-(dist(x,y,initx,inity)/(width/2))));
      if (fade_mode==1) col=color(initR,initG,initB,maxalpha*(dist(x,y,initx,inity)/(width/2)));
    }
  }
  
  void draw(){                 //within Dot class
    
    //Draw Dot
    if (to_fade) fade(); // fades out at bottom
    if (shape_mode==0){
      fill(col);
      noStroke();
      ellipseMode(CENTER);
      ellipse(x,y,dotWidth,dotWidth);
    }
    else if (shape_mode==1){
      fill(col);
      noStroke();
      rectMode(CENTER);
      rect(x,y,dotWidth,dotWidth);
    }
    else if (shape_mode==2){
      stroke(col);
      strokeWeight(2);
      noFill();
      line(linex,liney,x,y);
      //line(x+random(dotWidth*2)-dotWidth,y+random(dotWidth*2)-dotWidth,x,y);
      //noStroke();
      //fill(col);
    }
    else if (shape_mode==3){
      stroke(col);
      strokeWeight(2);
      noFill();
      pushMatrix();
      translate(x,y);
      //rotate(-angle);
      arc(0,0,dotWidth*2,dotWidth,TWO_PI-PI/2, TWO_PI);
      arc(dotWidth*2,0,dotWidth*2,dotWidth,PI,TWO_PI-PI/2);
      //rotate(angle);
      popMatrix();
      //line(x+random(dotWidth*2)-dotWidth,y+random(dotWidth*2)-dotWidth,x,y);
      //noStroke();
      //fill(col);
    }
    if (write) {
      fill(255);
      textSize(12);
      text(name,x,y);
    }
  }
  
} //end class

