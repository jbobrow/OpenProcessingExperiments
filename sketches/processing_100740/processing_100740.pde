
int start=0;
int calib;
int x=width/2;   //Start position:
int y=height/2;  //    the center
int rl=10;       //Size of player:
int rw=10;       //    10px x 10px
int rx;          // Rate of change
int ry;          // in both directions
int px;          // Additional speed 
int py;          // due to keyPress
//int ax;         // Delete "//" prior to 'ax' to activate. No need in current version. It is not used in the rest of the code.
int ay;          // due to added Acceleration
int stick;
int dirstate;    // state of the direction for stick condtions (only in x)
int dirx=1;      // direction of x; left or right, as determined by dirstate
int diry=1;      // direction of y
int wallx=1;     // stick state (only in x)
//int wally=1;   // Delete "//" prior to 'wally' to activate. No need in current version. It is not used in the rest of the code.
int reset=82;
int pot=reset;
int score;
int side =0;
int goal=2;
ArrayList leftDeny;
ArrayList rightDeny;
ArrayList leftDenyClone;
ArrayList rightDenyClone;

void setup() {
  size(800, 533); 
  frameRate(30);
  noStroke();
  leftDeny = new ArrayList();
  rightDeny = new ArrayList();
  leftDenyClone = new ArrayList();
  rightDenyClone = new ArrayList();
}

void draw() {
  println("potential/score" +  " " +pot + " " + score + " " + "activate/goal" + " " + side + " " + goal);
  println(leftDeny + " " +rightDeny);
  PFont font;
  font= loadFont("Neou-Thin-48.vlw");
  textFont(font, 48);
  PFont sfont;
  sfont= loadFont("startScreen2.vlw");


  if (start==0) {
    background(156);
    /*
    fill(255, 0, 0);
    textFont(sfont, 48);
    text("E", width-351, 75);
    text("    O", width-352, 75);
    text("            E", width-405, 75);
    fill(255);
    text("  m  ver  s", width-365, 75);
    */
    textFont(sfont, 24);
    text("You are a square, named Sev Enskware Meaters.", 25, 24);
    text("You are a special square.", 25, 48);
    text("You can stick to walls.", 25, 72);     
    textFont(sfont, 12);
    text("(not the floor or ceiling, dumby, you can only bounce off those)", 50, 96);
    textFont(sfont, 24);
    text("You can launch your self from the walls by clicking", 25, 120);
    text(" the mouse, which can also change your direction.", 25, 144);
    textFont(sfont, 12);
    text("(careful not to get the Plague)", 50, 168);   
    textFont(sfont, 24);    
    text("You die if you launch of a deadly red rectangle.", 25, 192);
    textFont(sfont, 12);
    text("(a silly excuse for a shape)", 50, 216);
    textFont(sfont, 24);    
    text("You can nudge yourself up or down using the respective .", 25, 240);
    text("arrow keys", 40, 264);  
    textFont(sfont, 12);    
    text("(like if your red rectangle senses start tingling)", 50, 288);
    textFont(sfont, 24);  
    text("You get points for the least amount of time sticking ", 25, 312);
    text("to a wall.", 25, 336);
    textFont(sfont, 12);    
    text("(Perks of Being a Wallbox?)", 50, 360); 
    textFont(sfont, 24);
    text("You get a small boost in velocity for every successful ", 25, 384); 
    text("launch, and drastic loss if you dont. ", 25, 408); 
    textFont(sfont, 12); 
    text("(like trying to launch before you get to a wall, EagerMcSquare) ", 50, 432); 
    textFont(sfont, 24);
    text("You can start the game by launching now.", 150, 500);
    textFont(sfont, 12); 
    text("Created by Iltimas Doha", width-350, 90);
  }

  if (start==1) {
    background(156);
    //println(calib);


    text(pot, width/2, height/2-20);
    text(score, width/2, height/2+20);
    drawRectRight();
    //MOVEMENT ALGORITHM
    x+=(rx+px)*dirx*wallx;    //rate added with additional speed from keyPress with directional modification and stop and start modification (stick)
    y+=(ry+py+ay)*diry*wallx; //rate added with additional speed from keyPress and acceleration with directional modification and stop and start modification(stick)
    rx=10;                    //initial rate
    ry=1;                     //in x & y
    //MOVEMENT ALGORITHM//
    fill(255);
    rect(x, y, rw, rl);       //PLAYER
    /*
      int pos = orientation.gamma - calib;
     //println(pos);
     
     if (pos<-15){
     ay+=+1;
     }
     if(pos>15){
     ay+=-1;
     } else {
     ay=0;
     }
     */
    //STICK CONDITIONS
    if (x+rw>=width) {
      x=width-rw;
      side= 2;
      if (dirstate==0) {
        wallx=0;
        stick=1;
      } 
      else {
        wallx=1;
        stick=0;
        side = 0;
      }
    }
    if (x<=0) {
      x=0;
      side= 1;
      if (dirstate==1) {
        wallx=0;
        stick=1;
      } 
      else {
        wallx=1;
        stick=0;
        side = 0;
      }
    }
    //STICK CONDITIONS//
    //BOUNCE CONDITIONS
    if (y+rl>=height) {
      y=height-rl;
      diry=-1;
    }
    if (y<=0) {
      y=0;
      diry=1;
    } 
    //BOUNCE CONDITIONS//
    //STATE OF DIRECTION(X)
    switch(dirstate) {
    case 0:
      dirx=1;     //Right
      break;
    case 1:
      dirx=-1;    //Left
      break;
    }
    if (dirstate>=2) {
      dirstate=0; //Allows to switch back to right while going left
    }
    //STATE OF DIRECTION(X)//
    pot--;
  }

  if (goal>2) {
    goal =1;
  }
  if (pot<=0) {
    pot=0;
  }
  if (py<=0) {
    py=0;
  }
  if (px<=0) {
    px=0;
  }

  if (start==2) {
    println(leftDeny + " " +rightDeny+" "+y);
    background(0);
    pot=0;
    text("GAME OVER", width/2-50, height/2-20);
    text(score, width/2-50, height/2+20);
  }
  
  if (start==3) {
    calib=0;
    x=0;   //Start position:
    y=0;  //    the center
    rl=10;       //Size of player:
    rw=10;       //    10px x 10px
    rx=0;          // Rate of change
    ry=0;          // in both directions
    px=0;          // Additional speed 
    py=0;          // due to keyPress
    //int ax;         // Delete "//" prior to 'ax' to activate. No need in current version. It is not used in the rest of the code.
    ay=0;          // due to added Acceleration
    stick=0;
    dirstate=0;    // state of the direction for stick condtions (only in x)
    dirx=1;      // direction of x; left or right, as determined by dirstate
    diry=1;      // direction of y
    wallx=1;     // stick state (only in x)
    //int wally=1;   // Delete "//" prior to 'wally' to activate. No need in current version. It is not used in the rest of the code.
    reset=107;
    pot=reset;
    score=0;
    side =0;
    goal=2;
    if (leftDeny.size()>0) {
      leftDeny.remove(0);
    }
    if (rightDeny.size()>0) {
      rightDeny.remove(0);
    }
    if (leftDenyClone.size()>0) {
      leftDenyClone.remove(0);
    }
    if (rightDenyClone.size()>0) {
      rightDenyClone.remove(0);
    }
    else {
      start=0;
    }
  }
}

void checkNum(int checky) {
  if (side==1) {
    for (int ileft=0;ileft<leftDeny.size();ileft++) {
      if ((Integer)leftDeny.get(ileft)-rl<checky && checky<(Integer)leftDeny.get(ileft)+rl) {
        start=2;
      }
    }
  }
  if (side==2) {
    for (int iright=0;iright<rightDeny.size();iright++) {
      if ((Integer)rightDeny.get(iright)-rl<checky && checky<(Integer)rightDeny.get(iright)+rl) {
        start=2;
      }
    }
  }
}

void drawRectRight() {
  fill(255, 0, 0);
  for (int d=0; d<rightDenyClone.size(); d++) {
    rect(width-5, (Integer)rightDenyClone.get(d), 5, 10);
  }  

  for (int f=0; f<leftDenyClone.size(); f++) {
    rect(0, (Integer)leftDenyClone.get(f), 5, 10);
  }
}


void mouseReleased() {
  if (start==0 || start==2) {
    start++;
  } 
  else {

    dirstate++;    //Changes direction

    if (stick==1) {
      if (goal==side) {
        checkNum(y);
        if (side==1) {
          leftDeny.add(y);
          leftDenyClone.add(y);
        } 
        else {
          rightDeny.add(y);
          rightDenyClone.add(y);
        }

        score+=pot;
        goal++;
        pot=reset;
        px++;          //Increases speed
        py++;          //in both directions
        background(0, 255, 0);
      } 
      else {
        background(255, 0, 0);
      }
    } 
    else {
      background(255, 0, 0);
      py-=5;
      px-=5;
    }
  }
}
void keyPressed() {
  if (key==CODED) {
    if (keyCode==DOWN) {
      y+=15*py;
    } 
    else
      if (keyCode==UP)
      {
        y-=15*py;
      }
      else
      {
        ay=0;
      }
  }
}



