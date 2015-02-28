
PImage underwater;
PImage [] mario;
PImage [] luigi;
float a= 1;
int frame = 3;
int frame2= 0;
int frame3= 2;
int frame4= 2;
int frame5= 1;
int frame6= 4;
float x = 0;
float y = 0;
float x2= 250;
float y2= 250;
float x3= 300;
float y3= 200;
float x4= 0;
float y4= 0;
float x5;
float y5;
float x6= 50;
float y6= 200;
float driftX = 250;
float driftY = 250;
int counter=0;
int counter2=0;
int counter3=0;
int counter4=0;
int counter5=0;
float destinX, destinY;
int oneX;
int oneY;
int changeX=5;
int changeY=5;
float rot = 0;
float desiredRot = 0;
 
void setup() {
  size (500, 500);
  mario = new PImage[4];
  luigi= new PImage[3];
  for(int i = 0; i<mario.length; i++) {
    mario[i] = loadImage("Mario Swim"+ (i+1) +".png");
  }
  for(int j = 0; j<luigi.length; j++) {
    luigi[j] = loadImage("Luigi Swim"+ (j+1) +".png");
  }
  underwater = loadImage("underwater.jpg");
}
 
 
void draw() {
   
  if(frame > 2) frame= 0;
  if(frame2 > 2) frame2= 0;
  if(frame3 > 2) frame3= 0;
  if(frame4 > 2)frame4= 0;
  if(frame5 > 2)frame5= 0;
  if(frame6 >2)frame6= 0;
   
  image(underwater, 0,0, 500, 500);
  
  
  
 //This is mario 1
  pushMatrix();
  translate(x, y);
  
  if(counter%10 ==0){
  destinX =int(random(0, 500));
  }
  if(counter%60 ==0){
  destinY =int(random(0, 500));
  }
 x += (destinX-x)*0.01;
  y += (destinY-y)*0.01;
 
    if (mousePressed){
    int i= -2;
    frame=3;
    destinY= destinY-(10*i);
  }
  image(mario[frame], -50, -50, 100, 100);

  
  popMatrix();
  
  
  //this is mario 2
  pushMatrix();
  if(frame3 >= 3){
    frame3=0;
  }
    translate(x3, y3); 
    image(mario[frame3], -50, -50, 100, 100);
    if(counter2%50==0){
    frame3++;
      
    driftX+= random(2, 2);
      if(driftX<=0)
      {
        driftX=0;
      }
      if (driftX >=450){
        driftX=450;
      }
      driftY+= random(2, 2);
      if(driftY<=50)
      {
        driftY=100;
      }
      if (driftY >=500){
        driftY=500;
      }
  }
  
  popMatrix();
  
  //this is mario 3
  pushMatrix();
  
   translate(x4, y4); 
    image(mario[frame4], mouseX, mouseY, 100, 100);
    if(counter3%20==0){
    frame4++;
    }
  
  popMatrix();
  
  //this is mario 4
  pushMatrix();
  
   translate(x5, y5); 
    image(mario[frame5], -50, -50, 100, 100);
    if(counter4%5==0){
    frame5++;
    }
  x5 += changeX;
  y5 += changeY;
  if(x5 >= 480 || x5 <= 0) {
    changeX *= -1;
  }
  if(y5 >= 480 || y5 <= 0) {
    changeY *= -1;
  }
  
  popMatrix();
  
  
  //this is mario 5
  pushMatrix();
  
 translate(x6,y6);
 //rot += (desiredRot-rot)*0.1;
  desiredRot= .5* PI;
 for (float desiredRot = 0; desiredRot < 100000; desiredRot++){
 rotate(rot);

 }
  image(mario[frame6], -50, -50, 100, 100);
  if(counter5%5==0){
    frame6++;
  }
  rot++;
  popMatrix();
  
  //this is luigi
  pushMatrix();
  translate(x2,y2);
  scale(a,a);
  image(luigi[frame2], -50, -50, 100, 100);
  
  if(counter%10==0){
    frame++;
  }
 
 
  if(key == CODED) {
    if(keyPressed){
    if(keyCode == RIGHT) {
      x2 += 5;
      frame2++;
    }
    else if(keyCode==LEFT) {
      x2 -= 5;
      frame2++;
    }
    else if(keyCode == UP) {
      y2 -= 5;
      frame2++;
    }
    else if (keyCode == DOWN) {
      y2 += 5;
      frame2++;
    }
  }
  
  }
  popMatrix();
  counter ++;
  counter2 ++;
  counter3 ++;
  counter4 ++;
  counter5 ++;
}


