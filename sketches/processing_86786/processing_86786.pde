
hero peter;
boolean moveright, moveleft;
//timer for punch
int pct, pst, ptt;
PImage backgroundImage;
float xspeed;
float xLerpSpeed;
float image_x;

float jHeight, jumpcounter, jumpy, timeInc;
boolean jump;

void setup() {
  size(640, 480);
  smooth();
  peter=new hero();
  peter.init("dinoRider00");
  moveleft=moveright=false;
  pct=0;
  pst=0;
  ptt=250;
  image_x=0;
  xspeed=3;
  xLerpSpeed=0;
  backgroundImage=loadImage("bg3.png");
  jumpcounter=0;
  jHeight=75.0;
  timeInc=0.08;
  jump=false;
}

void draw() {
  //background(0);
  //move right
  if (image_x<=-640 && image_x>-1280) {
    //draw another game background image to cover up 
    image(backgroundImage, image_x+1280, 0);
  }
  else if (image_x<=-1280) {
    image_x=0;
  }
  //move left
  if (image_x>0 && image_x<=1280) {
    image(backgroundImage, image_x-1280, 0);
  }
  else if (image_x>1280) {
    image_x=0;
  }
  image(backgroundImage, image_x, 0);

  if (moveright && !moveleft)
  {
    if ( !peter.current_pose.equals("jump")) {
      if ( !peter.current_pose.equals("walk") || peter.facing!=1) {
        peter.facing=1;
        peter.current_pose="walk";
        peter.st=millis()-peter.tt;
        peter.playhead=21;  
        xLerpSpeed=0;
      }
    }
  }

  if (moveleft && !moveright)
  {
    if ( !peter.current_pose.equals("jump")) {
      if ( !peter.current_pose.equals("walk") || peter.facing!=-1) {
        peter.facing=-1;
        peter.current_pose="walk";
        peter.st=millis()-peter.tt;
        peter.playhead=21; 
        xLerpSpeed=0;
      }
    }
  }

  if (!moveleft && !moveright)
  {
    if (peter.current_pose.equals("walk")) {
      peter.current_pose="stand";
      xLerpSpeed=0;
    }
  }

  if (peter.current_pose.equals("punch")) {
    pct=millis();
    if (pct-pst>ptt) {
      peter.current_pose="stand";
      xLerpSpeed=0;
    }
  }

  if (peter.current_pose.equals("jump")) {
    jumpcounter+=timeInc;
    if (jumpcounter>PI) {
      jumpy=peter.y-jHeight*sin(PI);
      peter.current_pose="stand";
    }
    else {
      jumpy=peter.y-jHeight*sin(jumpcounter);
    }
    //move peter or bakground horizontally
    if (moveleft || moveright) {
      image_x-=xspeed*peter.facing;
    }
  }
  
  peter.update();
}

void keyPressed() {
  if (keyCode==37 || key=='a') {
    moveleft=true;
  }
  if (keyCode==39 || key=='d') {
    moveright=true;
  }
  if (keyCode==32) {
    if (!jump) {
      jump=true;
      if (!peter.current_pose.equals("jump")) {
        peter.current_pose="jump";
        jumpcounter=0;
      }
    }
  }
}

void keyReleased() {
  if (keyCode==37 || key=='a') {
    moveleft=false;
  }
  if (keyCode==39 || key=='d') {
    moveright=false;
  }
  if (keyCode==32) {
    jump=false;
  }
}

class hero {
  //we set up a protocol: 
  //0:stand, 1-7:walk, 8:anger, 9:punch
  PImage[] sprites;
  String current_pose;
  int facing;
  float x, y;
  int playhead;
  //set up a timer to control the speed of animation
  int ct, st, tt;

  void init(String prefix) {
    sprites=new PImage[51];
    for (int i=0;i<51;i++) {
      int m=i+1;
      if (m<10) {
        sprites[i]=loadImage(prefix+"0"+m+".png");
      }
      else {
        sprites[i]=loadImage(prefix+m+".png");
      }
    }
    current_pose="stand";
    x=width/2;
    y=height/2+210;
    playhead=2;
    ct=0;
    st=0;
    tt=30;
    facing=1;
  }

  void update() {
    if (current_pose.equals("stand")) {
      ct=millis();
      if (ct-st>tt) {
        playhead+=1;
        if (playhead>=15) {
          playhead=0;
        }
        st=millis();
      }
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      //draw shadow
      fill(0,0,0,80);
      noStroke();
      ellipse(-40,3,80,15);
      //draw dino
      image(sprites[playhead], -sprites[playhead].width/2, -sprites[playhead].height+10);
      popMatrix();
      //ellipse(x,y,3,3);
    }
    if (current_pose.equals("walk")) {
      ct=millis();
      if (ct-st>tt) {
        playhead+=1;
        if (playhead>38) {
          playhead=21;
        }
        st=millis();
      }
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      //draw shadow
      fill(0,0,0,80);
      noStroke();
      ellipse(-40,3,80,15);
      //draw dino
      image(sprites[playhead], -sprites[playhead].width/2, -sprites[playhead].height+10);
      popMatrix();

      //move peter or bakground horizontally
      image_x-=xspeed*peter.facing;
    }
    if (current_pose.equals("punch")) {
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      //draw shadow
      fill(0,0,0,80);
      noStroke();
      ellipse(-40,3,80,15);
      //draw dino
      image(sprites[9], -sprites[9].width/2, -sprites[9].height+10);
      popMatrix();
    }
    if (current_pose.equals("jump")) {
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      //draw shadow
      fill(0,0,0,80);
      noStroke();
      ellipse(-30,3,60,15);
      //draw dino
      translate(0, jumpy-y);
      image(sprites[40], -sprites[40].width/2, -sprites[40].height+10);
      popMatrix();
    }
  }
}



