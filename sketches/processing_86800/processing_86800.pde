
class abobo {
  //we set up a protocol for abobo: 
  //0:stand, 0-2:walk, 3:kick, 4:punch1, 5:punch2, 6:hurt, 7:fallen
  int facing;
  int playhead;
  float x, y, xspeed;
  boolean alive;
  boolean remove;
  int healthpoint;
  
  //variables to set up animation
  PImage[] sprites;
  String current_pose;
  int totalImage;          
  int walk_end, walk_start;
  int punch_sp;
  int hurt_sp;
  int fallen_sp;
  
  //set up timers
  int act, ast, att;    //timer to pause walking cycle
  int      pst, ptt;    //timer to pause the punch animation
  int      ist, itt;    //timer to pause action when hurt

  void init(String prefix) {
    
    totalImage=8;
    walk_start=0;
    walk_end=2;
    punch_sp=4;
    hurt_sp=6;
    fallen_sp=7;
    
    sprites=new PImage[totalImage];
    
    for (int i=0;i<8;i++) {
      sprites[i]=loadImage(prefix+i+".png");
    }
    
    //initiate values:
    float side=random(10); //random a side to come in, from left edge or right edge
    if (side<5) {
      x=-20;
      facing=1;
    }
    else {
      x=width+20;
      facing=-1;
    }
    
    y=height/2+100;
    
    current_pose="stand";
    playhead=0;
    
    xspeed=1.5;
    healthpoint=3;
    alive=true;
    remove=false;
    
    //timer for walk cycle
    act=0;
    ast=0;
    att=150;

    //timer for punch
    pst=0;
    ptt=300;

    //timer for injury
    ist=0;
    itt=350;
  }

  void update(float tx, float ty) {
    //logic: if abobo is alive and close enough to peter then punch peter, 
    //if not keep walking towards Peter
    if (alive && !current_pose.equals("hurt")) {
      if (dist(tx, ty, x, y)<60) {
        if (current_pose.equals("punch")) {
          act=millis();
          if (act-pst>ptt) {
            current_pose="stand";
            pst=act;
          }
        }
        if (current_pose.equals("stand")) {
          act=millis();
          if (act-pst>ptt) {
            current_pose="punch";
            pst=act;
          }
        }
        if (current_pose.equals("walk")) {
          current_pose="stand";
        }
      }
      else {
        if (!current_pose.equals("walk")) {
          current_pose="walk";
        }
        if (tx-x>0) {
          facing=1;
          x+=xspeed;
        }
        else {
          facing=-1;
          x-=xspeed;
        }
      }
    }

    if (current_pose.equals("stand")) {
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      image(sprites[0], -sprites[0].width/2, -sprites[0].height+10);
      popMatrix();
      //ellipse(x,y,3,3);
    }
    if (current_pose.equals("walk")) {
      act=millis();
      if (act-ast>att) {
        playhead+=1;
        if (playhead>2) {
          playhead=0;
        }
        ast=millis();
      }
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      image(sprites[playhead], -sprites[playhead].width/2, -sprites[playhead].height+10);
      popMatrix();
    }
    if (current_pose.equals("punch")) {
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      image(sprites[punch_sp], -sprites[punch_sp].width/2, -sprites[punch_sp].height+10);
      popMatrix();
    }
    if (current_pose.equals("hurt")) {
      act=millis();
      if (act-ist>itt) {
        current_pose="stand";
      }
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      image(sprites[hurt_sp], -sprites[hurt_sp].width/2, -sprites[hurt_sp].height+10);
      popMatrix();
    }
    if (current_pose.equals("fallen") && !remove) {
      y+=6;
      x+=2*facing*-1;
      if (y>height+sprites[7].height) {
        remove=true;
      }
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      image(sprites[fallen_sp], -sprites[fallen_sp].width/2, -sprites[fallen_sp].height+10);
      popMatrix();
    }
  }
  void injury() {
    if (!current_pose.equals("hurt") && !current_pose.equals("fallen")) {
      healthpoint-=1;
      println(healthpoint);
      if (healthpoint<=0) {
        current_pose="fallen";
        alive=false;
        y-=20;
      }
      else {
        current_pose="hurt";
        ist=millis();
      }
    }
  }
}


