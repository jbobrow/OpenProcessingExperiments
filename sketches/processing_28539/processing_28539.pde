
float sizex = 75;
float sizey = 100;
float tsize = 0;
int xmove = 0;
int ymove = 0;
PImage logs;
PImage [] flames;
int frame = 0;
int x = 250;
int y = 250;
float fend = 250;
float fendy = 250;
int counter = 1%2;

//bee
PImage bee;
int bx = 250;
int by = 250;
float rot = 0;
float desiredRot = 0;

//2nd flame
int frame2 = 1;
int x2 = 200;
int y2 = 200;
float fend2 = 150;
float fendy2 = 150;
int counter2 = 1%2;

//3rd flame
int frame3 = 1;
int x3 = 300;
int y3 = 300;
float fend3 = 300;
float fendy3 = 300;
int counter3 = 1%2;


//4th flame
int frame4 = 1;
int x4 = 350;
int y4 = 350;
float fend4 = 200;
float fendy4 = 200;
int counter4 = 1%2;

//5th flame
int frame5 = 1;
int x5 = 370;
int y5 = 370;
float fend5 = 180;
float fendy5 = 180;
int counter5 = 1%2;


 
void setup() {
  size (500, 500);
  //minim = new Minim(this);
  //stomp = minim.loadSample("BD.mp3", 2048);
  flames = new PImage[4];
  for(int i = 0; i<flames.length; i++) {
    flames[i] = loadImage("flame"+ (i+1) +".png");
  }
  logs = loadImage("logs.jpg");
  bee = loadImage("bee.png");
  
  
}
 
 
void draw() {

  //1st flame
  if(frame > 3) frame = 0;
  
  fend += random (-100,100);
  if(fend<-20)fend = -10;
  if(x < 0) x = 1;
  if(fend>520)fend = 10;
  if(x > 520) x = 499;
  x += (fend-x)*0.01;
  
  fendy += random (-100,100);
  if(fendy<-20)fendy = -10;
  if (y < 0) y = 1;
  if(fendy>520)fendy = 10;
  if(y > 520) y = 499;
  y += (fendy-y)*0.01;
 
 //2nd flames
  
  if(frame2 > 3) frame2 = 0;
  
  fend2 += random (-120,120);
  if(fend2<-20)fend2 = -10;
  if(x2 < 0) x2 = 1;
  if(fend2>520)fend2 = 10;
  if(x2 > 520) x2 = 499;
  x2 += (fend2-x2)*0.01;
  
  fendy2 += random (-120,120);
  if(fendy2<-20)fendy2 = -10;
  if (y2 < 0) y2 = 1;
  if(fendy2>520)fendy2 = 10;
  if(y2 > 520) y2 = 499;
  y2 += (fendy2-y2)*0.01;
 
 //3rd flames
  
  if(frame3 > 3) frame3 = 0;
  
  fend3 += random (-150,150);
  if(fend3<-20)fend3 = -10;
  if(x3 < 0) x3 = 1;
  if(fend3>520)fend3 = 10;
  if(x3 > 520) x3 = 499;
  x3 += (fend3-x3)*0.01;
  
  fendy3 += random (-150,150);
  if(fendy3<-20)fendy3 = -10;
  if (y3 < 0) y3 = 1;
  if(fendy3>520)fendy3 = 10;
  if(y3 > 520) y3 = 499;
  y3 += (fendy3-y3)*0.01;
 
 //4th flames
  
  if(frame4 > 3) frame4 = 0;
  
  fend4 += random (-200,200);
  if(fend4<-20)fend4 = -10;
  if(x4 < 0) x4 = 1;
  if(fend4>520)fend4 = 10;
  if(x4 > 520) x4 = 499;
  x4 += (fend4-x4)*0.01;
  
  fendy4 += random (-200,200);
  if(fendy4<-20)fendy4 = -10;
  if (y4 < 0) y4 = 1;
  if(fendy4>520)fendy4 = 10;
  if(y4 > 520) y4 = 499;
  y4 += (fendy4-y4)*0.01;
  
 //5th flames
  
  if(frame5 > 3) frame5 = 0;
  
  fend5 += random (-175,175);
  if(fend5<-20)fend5 = -10;
  if(x5 < 0) x5 = 1;
  if(fend5>520)fend5 = 10;
  if(x5 > 520) x5 = 499;
  x5 += (fend5-x5)*0.01;
  
  fendy5 += random (-175,175);
  if(fendy5<-20)fendy5 = -10;
  if (y5 < 0) y5 = 1;
  if(fendy5>520)fendy5 = 10;
  if(y5 > 520) y5 = 499;
  y5 += (fendy5-y5)*0.01;
 
  rot += (desiredRot-rot)*0.1;
  
  image(logs, 0,0, 500, 500);
  
  //bee
  pushMatrix();
  translate(bx, by);
  rotate(rot);
  image(bee, -38, -30, 75, 100);
  popMatrix();

   
  pushMatrix();
  
  translate(x, y-40);
  image(flames[frame], -38, -30, sizex, sizey);
  popMatrix();
  
  if (counter > 4){
    frame ++;
    counter = 0;
  }
  counter ++;
  
  //2flame 
  pushMatrix();
  
  translate(x2, y2-40);
  image(flames[frame2], -38, -30, sizex*.5, sizey*.5);
  popMatrix();
  
  if (counter2 > 4){
    frame2 ++;
    counter2 = 0;
  }
  counter2 ++;

  //3flame

  pushMatrix();
  
  translate(x3, y3-40);
  image(flames[frame3], -38, -30, sizex*.7, sizey*.7);
  popMatrix();
  
  if (counter3 > 4){
    frame3 ++;
    counter3 = 0;
  }
  counter3 ++;

  //4flame

  pushMatrix();
  
  translate(x4, y4-40);
  image(flames[frame4], -38, -30, sizex*.9, sizey*.9);
  popMatrix();
  
  if (counter4 > 4){
    frame4 ++;
    counter4 = 0;
  }
  counter4 ++;

  //5flame

  pushMatrix();
  
  translate(x5, y5-40);
  image(flames[frame5], -38, -30, sizex*.75, sizey*.75);
  popMatrix();
  
  if (counter5 > 4){
    frame5 ++;
    counter5 = 0;
  }
  counter5 ++;

  
  if (mousePressed){
    sizex += (tsize - sizex)*0.1;
    sizey += (tsize - sizey)*0.1;
  }
  else{
    if (sizex < 75){
      sizex += (tsize + sizex)*0.1;
    }
    if (sizey < 100){
      sizey += (tsize + sizey)*0.1;
    }
  }
    
}

 //bee
void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      bx += 5;
      desiredRot = .5*PI;
    }
    else if(keyCode==LEFT) {
      bx-= 5;
      desiredRot = -.5*PI;
    }
    else if(keyCode == UP) {
      by-= 5;
      desiredRot = 0;
    }
    else if (keyCode == DOWN) {
      by+= 5;
      desiredRot = PI;
    }
  }
}


