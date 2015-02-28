
ArrayList agileenemys = new ArrayList();

PImage aeimg;

class agileenemy {
  
  float x, y;
  float oldx, oldy;
  float xspeed, yspeed;
  float xrad=25;
  float yrad=25;
  
  int maxhp = 200;
  int hp = maxhp;
  
  int charge=0;
  
  agileenemy(float xx, float yy) {
    x=xx;
    y=yy;
  }
  
  void update() {
    
    oldx = x;
    oldy = y;
    
    if (charge<=0) {
      enemybullets.add(new enemybullet(x, y, 5*((p.x-(x-xrad))/dist(x-xrad,y,p.x,p.y)) , 5*((p.y-y)/dist(x-xrad,y,p.x,p.y)) ) );
      charge += 10;
    }
    if (charge>0) charge -= 1;
    
    xspeed -= 0.5*int(x-p.x)/dist(x,y,p.x,p.y-100);
    yspeed -= 0.5*int(y-(p.y-100))/dist(x,y,p.x,p.y-100);
    
    xspeed *= 0.95;
    yspeed *= 0.95;
    
    x += xspeed;
    y += yspeed;
    
    //collision with blocks
    for (int i=int(p.x/blocksize)-20; i<=int(p.x/blocksize)+20; i++) {
      for (int j=int(p.y/blocksize)-20; j<=int(p.y/blocksize)+20; j++) {
        if (i>=0 && j>=0 && i<blocks.length && j<blocks[5].length && blocks[i][j].solid) {
          
          if( x+xrad >= blocks[i][j].x && x-xrad <= blocks[i][j].x+blocksize && y+yrad >= blocks[i][j].y && y-yrad <= blocks[i][j].y+blocksize ) {
            x=oldx;
            y=oldy;
            xspeed *= -1;
            yspeed *= -1;
          }
          
        }
      }
    }
    
    //collision with other agileenemys
    for (int i=agileenemys.size()-1; i>=0; i--) {
      agileenemy e = (agileenemy) agileenemys.get(i);
      if (e != this) {
        while (x-xrad <= e.x+e.xrad && x+xrad >= e.x-e.xrad && y-yrad <= e.y+e.yrad && y+yrad >= e.y-e.yrad) {
          x+=(x-e.x)/dist(x,y,e.x,e.y);
          y+=(y-e.y)/dist(x,y,e.x,e.y);
        }
      }
    }
    
    //collision with enemyships
    for (int i=enemyships.size()-1; i>=0; i--) {
      enemyship e = (enemyship) enemyships.get(i);
        while ( dist(x,y,e.x,e.y) < (e.xrad+e.yrad)/2 ) {
          x+=(x-e.x)/dist(x,y,e.x,e.y);
          y+=(y-e.y)/dist(x,y,e.x,e.y);
        }
    }
    
    //collision with enemydrills
    for (int i=enemydrills.size()-1; i>=0; i--) {
      enemydrill e = (enemydrill) enemydrills.get(i);
      while (x-xrad <= e.x+e.xrad && x+xrad >= e.x-e.xrad && y-yrad <= e.y+e.yrad && y+yrad >= e.y-e.yrad) {
          x+=(x-e.x)/dist(x,y,e.x,e.y);
          y+=(y-e.y)/dist(x,y,e.x,e.y);
      }
    }
    
  }
  
  void display() {
    
    //fill(255);
    //ellipse(x-camx, y-camy, 2*xrad, 2*yrad);
    image(aeimg, x-camx-xrad, y-camy-yrad, 2*xrad+2, 2*yrad+2);
    
    //health bar
    fill(255,0,0);
    rect(x-(maxhp/4)-camx, y-yrad-20-camy, maxhp/2, 10);
    fill(0,255,0);
    rect(x-(maxhp/4)-camx, y-yrad-20-camy, hp/2, 10);
    
  }
  
}

