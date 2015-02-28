
int textSize=3;
int sensitivity=10;
int STARTING_SPEED=10;
boolean keys[];
int cameraX;
int cameraY;
int cameraZ;
float cameraAccelerationY=.4;
float cameraSpeedY;
float cameraAngleX;
float cameraAngleY;
boolean flaggy;
PImage img;
Platform[] platforms;
java.awt.Robot robot;
int playerSpeed;
int speedLife;
int jumpSpeed;
int jumpLife;
int inviLife;

void setup() {
  size(640, 360, P3D);
  colorMode(HSB, 255);
  smooth(8);
  frameRate(30);
  int cameraX=0;
  int cameraY=0;
  int cameraZ=0;
  jumpSpeed=10;
  playerSpeed=STARTING_SPEED;
  speedLife=0;
  inviLife=0;
  img = loadImage("C:/Users/Brendan/Pictures/Wallpaper/Backtrack_5.jpg");
  keys=new boolean[5];
  platforms=new Platform[100];
  for (int i = 0; i < platforms.length; i++) {
    String t = "";
    if (i%5==4) {
      int rand = (int)(Math.random()*3);
      switch(rand) {
      case 0:
        t = "S";
        break;
      case 1:
        t = "J";
        break;
      case 2:
        t = "I";
        break;
      }
    }
    platforms[i]=new Platform((int)(Math.random()*10+1), i*200, t);
  }
  cameraSpeedY=0;
  try {
    robot = new java.awt.Robot();
  }
  catch(Exception e) {
  }
  cameraAngleX=(float)Math.PI/2;
  cameraAngleY=(float)Math.PI/2;
}
void draw() {
  println(keys[0]+" "+keys[1]+" "+keys[2]+" "+keys[3]+" "+keys[4]);
  println(frameRate);
  println(cameraZ/200.0);
  //Reduce powerups
  if (speedLife>0) {
    speedLife--;
  }
  else {
    playerSpeed=10;
  }
  if (jumpLife>0) {
    jumpLife--;
  }
  else {
    jumpSpeed=10;
  }
  if (inviLife>0) {
    inviLife--;
  }
  //Move platforms
  for (int i = 0; i < platforms.length;i++) {
    platforms[i].update();
  }
  //Movement from key input
  if (keys[0]==true) {
    cameraX+=playerSpeed*sin(cameraAngleX);
    cameraZ+=playerSpeed*cos(cameraAngleX);
  }
  if (keys[2]==true) {
    cameraX-=playerSpeed*sin(cameraAngleX);
    cameraZ-=playerSpeed*cos(cameraAngleX);
  }
  if (keys[1]==true) {
    cameraX+=playerSpeed*cos(cameraAngleX);
    cameraZ-=playerSpeed*sin(cameraAngleX);
  }
  if (keys[3]==true) {
    cameraX-=playerSpeed*cos(cameraAngleX);
    cameraZ+=playerSpeed*sin(cameraAngleX);
  }
  if (keys[4]==true&&cameraY==0) {
    cameraSpeedY=jumpSpeed;
  }
  cameraY-=cameraSpeedY;
  cameraSpeedY-=cameraAccelerationY;
  flaggy=false;
  if (cameraY>=0) {
    cameraSpeedY=0;
    cameraY=0;
    //Movement from platforms
    for (int i = 0; i < platforms.length; i++) {
      Platform plat=null;
      if (platforms[i].isOn(cameraX, cameraZ)) {
        plat=platforms[i];
        flaggy=true;
      }
      if (plat==null) {
        if (cameraX>0) {
        }
      }
      else {
        cameraX+=plat.s*(plat.right ? 1:-1);
        if (plat.t=="S") {
          playerSpeed=20;
          speedLife=150;
        }
        if (plat.t=="J") {
          jumpSpeed=20;
          jumpLife=150;
        }
        if (plat.t=="I") {
          inviLife=150;
        }
      }
    }
  }
  //Change camera angle
  float angleChangeY=((mouseY-height/2.0)/height);
  println(angleChangeY);
  cameraAngleY-=sensitivity*angleChangeY;
  if (cameraAngleY>Math.PI-.05) {
    cameraAngleY=(float)(Math.PI-.05);
  }
  if (cameraAngleY<.05) {
    cameraAngleY=.05;
  }
  float angleChangeX=((mouseX-width/2.0)/width);
  println(angleChangeX);
  cameraAngleX-= sensitivity*angleChangeX;
  int cameraCenterY = (int)(cameraY + 100*cos(cameraAngleY))-30;
  int cameraCenterX = (int)(cameraX + 100*sin(cameraAngleY)*sin(cameraAngleX));
  int cameraCenterZ = (int)(cameraZ + 100*sin(cameraAngleY)*cos(cameraAngleX));
  robot.mouseMove(displayWidth/2, displayHeight/2);
  //Start displaying stuff
  background(0);
  camera(cameraX, cameraY-30, cameraZ, cameraCenterX, cameraCenterY, cameraCenterZ, 0, 1, 0);
    pushMatrix();
  //Draw rainbow road
  rectMode(CORNERS);
  pushMatrix();
  translate(0, 75, 0);
  rotateX((float)Math.PI/2);
  for (int i = 0; i < 20000; i+=50) {
    fill(i/20000.0*255, 255, 255);
    noStroke();
    rect(-500, i, 500, i+50);
  }
  popMatrix();
  //Draw the platforms
  textSize(100);
  for (int i = 0; i < platforms.length;i++) {
    stroke(0);
    fill(255*platforms[i].c, 255, 255);
    popMatrix();
    pushMatrix();
    translate(platforms[i].x, 50, platforms[i].z);
    beginShape(QUADS);
    vertex((int)(-platforms[i].w/2), 0, (int)(-platforms[i].h/2));
    vertex((int)(platforms[i].w/2), 0, (int)(-platforms[i].h/2));
    vertex((int)(platforms[i].w/2), 0, (int)(platforms[i].h/2));
    vertex((int)(-platforms[i].w/2), 0, (int)(platforms[i].h/2));

    vertex((int)(-platforms[i].w/2), 0, (int)(-platforms[i].h/2));
    vertex((int)(-platforms[i].w/2), 0, (int)(platforms[i].h/2));
    vertex((int)(-platforms[i].w/2), 25, (int)(platforms[i].h/2));
    vertex((int)(-platforms[i].w/2), 25, (int)(-platforms[i].h/2));

    vertex((int)(-platforms[i].w/2), 0, (int)(-platforms[i].h/2));
    vertex((int)(platforms[i].w/2), 0, (int)(-platforms[i].h/2));
    vertex((int)(platforms[i].w/2), 25, (int)(-platforms[i].h/2));
    vertex((int)(-platforms[i].w/2), 25, (int)(-platforms[i].h/2));

    vertex((int)(platforms[i].w/2), 0, (int)(-platforms[i].h/2));
    vertex((int)(platforms[i].w/2), 0, (int)(platforms[i].h/2));
    vertex((int)(platforms[i].w/2), 25, (int)(platforms[i].h/2));
    vertex((int)(platforms[i].w/2), 25, (int)(-platforms[i].h/2));

    vertex((int)(platforms[i].w/2), 0, (int)(platforms[i].h/2));
    vertex((int)(-platforms[i].w/2), 0, (int)(platforms[i].h/2));
    vertex((int)(-platforms[i].w/2), 25, (int)(platforms[i].h/2));
    vertex((int)(platforms[i].w/2), 25, (int)(platforms[i].h/2));

    endShape();
    rotateY((float)Math.PI);
    fill((255*platforms[i].c+127)%255, 255, 255);
    if (platforms[i].t.equals("I")) {
      fill((int)(Math.random()*255), 255, 255);
    }
    text(platforms[i].t, -30, -10);
  }

  textSize(12);

  popMatrix();
  pushMatrix();
  translate(cameraCenterX, cameraCenterY, cameraCenterZ);
  rotateY(cameraAngleX);
  rotateX(cameraAngleY);
  rotateX((float)Math.PI/2);
  stroke(0);
  hint(DISABLE_DEPTH_TEST);
  noFill();
  stroke(255);
  rotateZ((float)Math.PI);
  line(0, -5, 0, 5);
  line(-5, 0, 5, 0);
  ellipse(0, 0, 10, 10);
  fill(255);
  stroke(0);
  textSize(textSize);
  text("FPS: "+frameRate, 100-textSize*10, -50);
  text("Sensitivity: "+sensitivity, 100-textSize*10, -50+textSize);
  text("Points: "+(cameraZ+50)/200, -100, -50);
  if (speedLife>0) {
    text("Speed powerup: "+(int)(.8+speedLife/frameRate), -100, -50+textSize*1);
    if (jumpLife>0) {
      text("Jump powerup: "+(int)(.8+jumpLife/frameRate), -100, -50+textSize*2);
      if (inviLife>0) {
        text("Invincibility powerup: "+(int)(.8+inviLife/frameRate), -100, -50+textSize*3);
      }
    }
    else if (inviLife>0) {
      text("Invincibility powerup: "+(int)(.8+inviLife/frameRate), -100, -50+textSize*2);
    }
  }
  else if (jumpLife>0) {
    text("Jump powerup: "+(int)(.8+jumpLife/frameRate), -100, -50+textSize);
    if (inviLife>0) {
      text("Invincibility powerup: "+(int)(.8+inviLife/frameRate), -100, -50+textSize*2);
    }
  }
  else if (inviLife>0) {
    text("Invincibility powerup: "+(int)(.8+inviLife/frameRate), -100, -50+textSize);
  }
  hint(ENABLE_DEPTH_TEST);
  popMatrix();
  if (flaggy||cameraZ<=0||cameraY<0||inviLife>0) {
    translate(cameraX, cameraY, cameraZ);
    fill(127, 255, 255);
  }
  //Restart game
  else {
    STARTING_SPEED=100;
    cameraAngleX=0;
    cameraAngleY=(float)Math.PI/2;
    cameraX=0;
    cameraY=0;
    cameraZ=0;
    playerSpeed=0;
    speedLife=0;
    jumpLife=0;
    jumpSpeed=10;
    inviLife=0;
  }
}
void keyPressed() {
  if (keyCode==ESC) {
    System.exit(0);
  }
  if (keyCode==UP&&sensitivity<30) {
    sensitivity++;
  }
  if (keyCode==DOWN&&sensitivity>0) {
    sensitivity--;
  }
  switch(Character.toLowerCase(key)) {
  case 'w':
    keys[0]=true;
    break;
  case 'a':
    keys[1]=true;
    break;
  case 's':
    keys[2]=true;
    break;
  case 'd':
    keys[3]=true;
    break;
  case ' ':
    keys[4]=true;
    break;
  }
}
public void keyReleased() {
  switch(Character.toLowerCase(key)) {
  case 'w':
  keys[0]=false;
    break;
  case 'a':
    keys[1]=false;
  case 's':
    keys[2]=false;
    break;
  case 'd':
    keys[3]=false;
    break;
  case ' ':
    keys[4]=false;
    break;
  }
}

boolean sketchFullScreen() {
  return true;
}

class Platform {
  public String t;
  public float c;
  public int x;
  public int z;
  public int h;
  public int w;
  public int s;
  public boolean right;
  public Platform(int S, int Z, String T) {
    t=T;
    c=(float)(Math.random());
    h=100;
    w=100;
    z=Z;
    s=S;
    x=(int)(Math.random()*1000-500);
    right=(0==(int)(Math.random()+.5));
  }
  public void update() {
    if (right&&x>500) {
      right=false;
    }
    if (!right&&x<-500) {
      right=true;
    }
    if (right) {
      x+=s;
    }
    if (!right) {
      x-=s;
    }
  }
  public boolean isOn(int testX, int testZ) {
    return (testX>=x-w/2&&testX<=x+w/2&&testZ>z-h/2&&testZ<z+h/2);
  }
}



