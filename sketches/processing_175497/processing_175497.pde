
int x=150;
int y=150;
int vx = 0;
int vy = 0;

int maLaser = 1;
int laserX = 0;
int laserY = 0;

PImage ufo;


void setup() {
 size(600,600);
 ufo = loadImage("ufo.png"); 
}

void draw() {
  background(0);
  //ellipse(x,y,50,50);
  
  x = x + vx;
  y = y + vy;
  
  image(ufo,x,y);
  
  fill(255);
  textSize(32);
  text("lasery: "+maLaser, 20,40);
  
  if(maLaser == 0) {
    fill(0,255,0);
    rect(laserX, laserY, 5,50);
    rect(laserX+90, laserY, 5, 50);
    
    laserY = laserY - 15;
    if(laserY < 0) {
     maLaser = 1; 
    }
  }
}

void keyPressed() {
  print(key);
  if(key == 'a') {
    vx = -3;
  }else if(key == 'd') {
    vx = 3; 
  } else if(key == 'w') {
    vy = -3;
  } else if(key =='s') {
    vy = 3;
  } else if(key == 'l') {
    if(maLaser == 1) {
      laserX = x;
      laserY = y;
      maLaser = 0;
    }
  }
}

void keyReleased() {
  if(key == 'a') {
    vx = 0;
  }else if(key == 'd') {
    vx = 0; 
  } else if(key == 'w') {
    vy = 0;
  } else if(key =='s') {
    vy = 0;
  }
}




