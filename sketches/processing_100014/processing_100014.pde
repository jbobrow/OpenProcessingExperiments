
int xpos = 12;
int ypos = 350;
float time = 0.00;
boolean game = true;
ArrayList<wall> walz;
 
void setup() {
  size(700,700);
  smooth();
  background(200);
  walz = new ArrayList<Wall>();
  initRoads(walz);
}
void initRoads(ArrayList<Wallr> w) {
  w.add( new Wall(2,2,width-2,2));
  w.add( new Wall(width-2,2,width-2,height-2));
  w.add( new Wall(2,height-2,width-2,height-2));
  w.add( new Wall(2,2,2,height-2));
  w.add( new Wall(width/8,height/8,width/8,height-height/8));
  w.add( new Wall(width/16,0,width/16,height/8));
  w.add( new Wall(width/16,height-height/16,width-width/8,height-height/16));
  w.add( new Wall(width/16,height/16,width/2,height/16));
  w.add( new Wall(width/16,height/4,width/8,height/4));
  w.add( new Wall(width/16,height-height/4,width/8,height-height/4));
  w.add( new Wall(width/16,height/4,width/2,height/4));
  w.add( new Wall(width-width/4,height/16,width-width/4,height));
  w.add( new Wall(width/2+width/8,0,width/2+width/8,height-height/8));
  w.add( new Wall(width/4,height/2,width/2,height/2));
  w.add( new Wall(width/4,height/4,width/2,height/2));
  w.add( new Wall(width/4,height/2+height/4,width/2,height/4+height/2));
  w.add( new Wall(width-width/16,height/2,width-width/8,height/2));
}
 
boolean isGameEnd() {
  if(xpos >= width-25 && ypos >= height/2-5 && ypos<=height/2+25) {
    game = false;
  } 
  return game;
} 
void draw() {
  background(200);
  strokeWeight(1);
  drawPlayer();
  drawFinish();
  for( Wall border : walz ) {
    border.drawWall();
  }
  time+=0.03;
  text(nf(time,1,2),width-50,height-20);
  if(xpos>350) {
      background(100);
      text("Into The Darkness", width/2,height/2);
      text(nf(time,1,2),width-50,height-20);
    }
  if(isGameEnd() == false) {
    background(125);
    text("Game Over",width/2,height/2);
    text(time,width/2,height/2+15);
    frameRate(0);
    noLoop();
  }
}
void drawPlayer() {
     fill(255,102,0);
     ellipse(xpos,ypos,10,10);
  }
void drawFinish() {
   fill(100,255,100);
   rect(width-25,height/2,20,20);
   
}
class Wall {
 
  PVector fstpt, sndpt;
 
  public Wall(int w, int x, int y, int z) {
    fstpt = new PVector(w,x);
    sndpt = new PVector(y,z);
  }
 
  public void drawWall() {
    stroke(0);
    strokeWeight(5);
    line(fstpt.x, fstpt.y, sndpt.x, sndpt.y);
  }
}
void keyPressed() {  
   if(collideLeft()==true) {
        if(keyCode==LEFT) {
            xpos=xpos;
            xpos+=3;
        }
    }
    if(collideRight()==true) {
        if(keyCode==RIGHT) {
            xpos=xpos;
            xpos-=3;
        }
    }
    if(collideTop()==true) {
        if(keyCode==UP) {
            ypos=ypos;
            ypos+=3;
        }
    }
    if(collideBott()==true) {
        if(keyCode==DOWN) {
            ypos=ypos;
            ypos-=3;
        }
    } 
    if(keyCode==LEFT) {
        xpos-=3;
    }
    if(keyCode==RIGHT) {
        xpos+=3;
    }
    if(keyCode==UP) {
        ypos-=3;
    }
    if(keyCode==DOWN) {
        ypos+=3;
    }
}
boolean collideLeft() {
    if(xpos<10) {
        return true;
    }
    return false;
}
boolean collideRight() {
    if(xpos>690) {
        return true;
    }
    return false;
}
boolean collideTop() {
    if(ypos<10) {
        return true;
    }
    return false;
}   
boolean collideBott() {
    if(ypos>690) {
        return true;
    }
    return false;
}
