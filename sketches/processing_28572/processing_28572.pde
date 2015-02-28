
boolean grab = false;
boolean lift = false;
boolean approach = false;
PImage sky;
PImage [] bird;
PImage [] bird1;
PImage [] bird2;
PImage [] bird3;
PImage [] birl;
PImage [] birl1;
PImage [] birl2;
PImage [] birl3;
PImage [] birr;
PImage [] birr1;
PImage [] birr2;
PImage [] birr3;
PImage [] biru;
PImage [] biru1;
PImage [] biru2;
PImage [] biru3;
PImage [] monk;
PImage monklift;
PImage monkfall;
int frame = 0;
int frameM = 1;
int count = 0;
int directionD = -1;
int directionL = 1;
int directionR = -1;
int directionU= -1;
int Dx = 250;
int Dy = 250;
float yl = random(40,400);
float xl = random(250,450);
int Ly = round(yl);
int Lx = round(xl);
int dirL = -1;
int dirR = -1;
float yr = random(40,400);
float xr = random(50,250);
int Ry = round(yr);
int Rx = round(xr);
float yz = random(40,400);
float xz = random(40,400);
int Zy = round(yz);
int Zx = round(xz);
int Uy = 75;
int Ux = 75;
float a = 100;
float b = 100;
int monkX = 250;
int monkY = 460;

int speed = 20;
int speel = 2;
int speer = -2;
int sizeu = 30;
float Urot = 0;
float rot = 0;
float desiredRot = 0;
int counter = 0;
float destinX, destinY;
/*boolean directionH = false; boolean directionV = false; boolean stall = false;
float movement;*/

void setup() {
  smooth();
  size (500, 500);
  bird = new PImage[4];
  bird1 = new PImage[4];
  bird2 = new PImage[4];
  bird3 = new PImage[4];
   birl = new PImage[4];
  birl1 = new PImage[4];
  birl2 = new PImage[4];
  birl3 = new PImage[4];
   birr = new PImage[4];
  birr1 = new PImage[4];
  birr2 = new PImage[4];
  birr3 = new PImage[4];
   biru = new PImage[4];
  biru1 = new PImage[4];
  biru2 = new PImage[4];
  biru3 = new PImage[4];
  monk = new PImage[3];
  for(int i = 0; i<bird.length; i++){
    bird[i] = loadImage("bigbird0"+ i +".png");
}
 for(int i = 0; i<birl.length; i++){
    birl[i] = loadImage("bigbirl0"+ i +".png");

}
 for(int i = 0; i<birr.length; i++){
    birr[i] = loadImage("bigbirr0"+ i +".png");

}
 for(int i = 0; i<biru.length; i++){
    biru[i] = loadImage("bigbiru0"+ i +".png");
}
for(int i = 0; i<monk.length; i++){
    monk[i] = loadImage("monk0"+ i +".png");
}
sky = loadImage("Cumulus_clouds_in_fair_weather.jpg");
monklift = loadImage("monklift.png");
monkfall = loadImage("monkfall.png");
}
void draw(){
  if (speed>0 && counter%80 == 0) frame++;
  if (counter%4==0) frame++;
  if (frame > 3) frame = 0;
  
    
  rot += (desiredRot-rot)*0.1;
 Urot-= 0.05;
  if (Urot>360) Urot=0;
  
  //movement = random(3000);
  image(sky,0,0,500,500);
  if (approach == false) {
    image (biru[frame],Zx,Zy,sizeu,sizeu);
    sizeu--;
    if (sizeu<=1) approach = true;
  } else if (approach == true) {
    image (bird[frame],Zx,Zy,sizeu,sizeu);
    sizeu++;
    if (sizeu>=100) approach = false;
  }
  if (counter%75 == 0) {
    destinX = int(random(40,400));
    destinY = int(random(40,400));
  }
  Zx+= (destinX-Zx) * 0.01;
  Zy+= (destinY-Zy) * 0.01;
  Dx+= ((monkX+25)-Dx) * 0.07;
  Lx+= (((monkX+25)-Lx) * 0.05)+10;
  Rx+= (((monkX+25)-Rx) * 0.05)-10;
  pushMatrix();
  translate(Dx, Dy);
  if (speed<0){
image(bird[frame], -50, -30, 100, 100);
  } else { 
    image(bird[0], -50,-30, 100, 100);
  }
  popMatrix();
  
  if (dist(monkX+25, monkY+25, Dx, Dy) < 30) grab = true;
  
  pushMatrix();
  translate (Lx,Ly);
  if (dirL <= 0) image (birl[frame], -50, -50, 100, 100);
  popMatrix();
  
  
  pushMatrix();
  translate (Rx,Ry);
   image (birr[frame], -50, -50, 100, 100);
  popMatrix();
  
  
    pushMatrix();
  translate(250, 250);
  rotate(Urot);
image(biru[frame], Ux, Uy, 100, 100);
  popMatrix();
  
  /*if (movement < 501) directionH = false;
  if (movement > 500 && movement < 1001) directionH = true;
  if (movement > 1000 && movement <1501) directionV = true;
  if (movement > 1500 && movement < 2001) directionV = false;
  if (movement > 1500) stall = false;
  if (stall == false) {
  image(bird[frame], x-50,y-50,100,100);
  } else if (directionH == false) {
    image(birl[frame],x-50,y-50,100,100);
    x-=20;
  } else if (directionH == true) {
    image(birr[frame],x,y,100,100);
    x+=20;
  } else if (directionV == true) {
    image(biru[frame],x-50,y-50,100,100);
    y-=20;
  }
  if (directionV == false) y+=20;*/
  if (mousePressed && mouseButton == LEFT) {
    counter+=2;
    speed = 7*directionD;
  } else {
    speed = 3*directionD;
  }
  if (Lx<=50){
    speel*=dirL;
    a*=dirL;
  }
  if (Lx>=450) {
    speel*=dirL;
    a*=dirL;
  }
  if (Rx<=50) {
    speer*=dirR;
    b*=dirR;
  }
  if (Rx>=450) {
    speer*=dirR;
    b*=dirR;
  }
  Dy+=speed;
  //Rx+=speer;
  //Lx+=speel;
  
  if (Dy<=140) {
    directionD*=-1;
    lift = false;
  }
  if (Dy>=height-40){
    directionD*=-1;
    lift = true;
  }
  counter++;
  if (grab == false) image(monk[frameM],monkX,monkY,50,50);
  if (grab == true) {
    if (lift == true) {
      monkX= Dx-25;
      monkY=Dy+15;
      image(monklift, monkX, monkY,50,50);
    } else if (lift == false) {
      monkY+=5;
        if (monkY >= 460){
          monkY = 460;
          grab =  false;
        }
      image(monkfall, monkX, monkY,50,50);
      }
    }
  }
  void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT && monkX<475) {
      monkX+=10;
      count++;
      if(count%2 == 0){
        frameM++;
      }
      if(frameM>1) frameM = 0;
    } else if (keyCode == LEFT && monkX>25){
       monkX-=10;
      count++;
      if(count%2 == 0) frameM++;
      if(frameM>1) frameM = 0;
    } else if (keyCode == UP){
      count++;
      if(count%2 == 0) frameM++;
      if(frameM>1) frameM = 0;
      if(count%10 == 0) lift = false;
    }
    
  }
  }
  void keyReleased() {
    frameM = 2;
  }

