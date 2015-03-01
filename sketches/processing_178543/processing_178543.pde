
//Star field
float m = 270;
float delta = 3;
Star[] Star;
int Max_Star=10000;
float na = 0;
Star2[] Star2;
int Max_Star2=8000;
Star3[] Star3;
int Max_Star3=8000;
float delte =100;
float r = 0;
float rotx = 0;
float roty = 0;
float rtx = 0.7;
float rty = 0.7;
PImage img;
int count = 0;
   float ro = 0;

//audioplayer
import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false;  
void setup()
{
  size(2560, 1440, P3D);
  background(255);
  img=loadImage("INTER.png");
  smooth();
  noCursor(); 
  noStroke();
  Star = new Star[Max_Star]; 
  for (int i=0; i< Max_Star; ++i)
  {
    Star[i] = new Star();
  }
  Star2 = new Star2[Max_Star2];

  for (int i=0; i< Max_Star2; ++i)
  {
    Star2[i] = new Star2();
  }
  Star3 = new Star3[Max_Star2];

  for (int i=0; i< Max_Star2; ++i)
  {
    Star3[i] = new Star3();
  }
  minim = new Minim(this);
  song = minim.loadFile("test1.mp3");
  song.loop();
  fft = new FFT( song.bufferSize(), song.sampleRate() );
} 
void draw() {
  background(0); 
  lights();

  count = 0;
  translate(width/2, height/2, 0);
  rotateX(rtx);
  rotateY(rty);  
  pushMatrix();    
  translate(0, 0, -800);

  noStroke();
  fill(#E5E5E5);

  pushMatrix();


  rotateZ(radians(ro));

  enduar(0, 0, 0);

  popMatrix();   
  ro-=0.5;
  popMatrix();  
  if (m >= 180)
  {
    m=135;
  }
  stroke(100);
  noStroke();
  pushMatrix();
  rotate(radians(180));
  translate(0, 0, 5000+na);    
  popMatrix();
  strokeWeight(10);
  line(0, 0, 375, 0, 0, 750); 
  pushMatrix(); 
  translate(0, 0, 5000+na); 
  rotateY(radians(delta));  
  fill(#000000);
  stroke(255, 100);
  strokeWeight(5);
  float r =0;
  strokeWeight(1);
  //stroke(255);
  noStroke();
  sphere(1000);
  popMatrix();
  delta+=25;  
  rotateX(rotx); 
  float nX= 0, nY = 0, nZ=1;  
  float    lX=1/(500*sin(radians(m)));
  float lY =1/(500*sin(radians(m)));
  float lZ = 1/m; 
  float lMag = sqrt(lX*lX + lY*lY + lZ*lZ);
  lX/=lMag;
  lY/=lMag;
  lZ/=lMag;
  m+=1;
  pushMatrix();
  stroke(255);
  translate(0, 0, 5000+na);
  rotateX(radians(1530));         
  for (int i=0; i< Max_Star; ++i) {
    Star[i].display();
    Star[i].move();
  }
  popMatrix();
  pushMatrix();
  translate(0, 0, 5000+na);
  rotateY(radians(1440));
  rotateX(rtx);
  rotateY(-(rty));
  for (int i=0; i< Max_Star2; ++i) {
    Star2[i].display();
    Star2[i].move();
  }
  popMatrix();
  pushMatrix();
  translate(0, 0, 5000+na);
  rotateX(radians(1350));
  for (int i=0; i< Max_Star3; ++i) {
    Star3[i].display();
    Star3[i].move();
  }
  popMatrix(); 
  translate(0, 0, 5000+na);    
  textSize(120);
  rotateY(radians(180));
  fill(255, 255, 255); 
  image(img, -(width)/4, -300);
  loadPixels();

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      float r1 = red(pixels[loc]);
      float g = green(pixels[loc]); 
      float b = blue(pixels[loc]);
      if (r1 == 255 && g == 255 & b == 255) {
        count++;
      }
    }
  }
  if (keyPressed) {
    na-=10;
  }  

  if (5000+na==-140) {
    pause = !pause;
    if (pause) song.pause();
    song = minim.loadFile("test2.mp3");
    song.play();
  }
  pushMatrix();
  translate(600, -500, 6000);
  rotateY(radians(180));
  textSize(300);
  fill(255);
  text("INTERSTELLAR OST PROMOTION", 0, 0, 0);
  translate(200, -500, 0);
  textSize(150);
  fill(200);
  text("Kim Taewoo", 0, 0, 0);
  popMatrix();
} 
void mouseDragged() {
  float rate = 1.6E-4;
  rotx*=0.9;  
  rotx += (pmouseY-mouseY) * rate;
  roty*=0.9;  
  roty +=(mouseX-pmouseX) * rate;
  rtx += rotx;
  rty += roty;
}

void enduar(float a, float y, float z) {
  translate(a, y, z);float cccc = 200;
fill(cccc);
if(5000+na<=-130){
   noFill();
  }
sphere(16);


pushMatrix();
rotateZ(radians(30));
translate(0, -80, 0); 
noStroke();

box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(60));
translate(0, -80, 0); 
noStroke();

box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(90));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(120));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(120));
translate(0, -40, 0); 
noStroke();
//;
box(5,80,5);
popMatrix();


pushMatrix();
rotateZ(radians(150));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(150));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(180));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(210));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(240));
translate(0, -80, 0);       
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(270));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(300));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(330));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

pushMatrix();
rotateZ(radians(360));
translate(0, -80, 0); 
noStroke();
//;
box(25,36,36);
popMatrix();

/*if(keyPressed){

float mapp= map(mouseX,0,width, 0,100);
float B=0; pushMatrix();
rotateZ(radians(360));
translate(0, -80,-20);

fill(255,100*sin(B),100*sin(B));

println(B);
sphere(2);
popMatrix();
B+=10;
}*/

}





class Star {
  float x, y, r;
  float s;
  color c;
  float direction=1;
  float theta;
  float R;
  
 


  Star()
  {
    theta=random(-250, 180);
    R = random(100,1000);
    r = random(1,3);
    x= R*cos(radians(theta));
    y= R*sin(radians(theta));
    c = color(random(100,255), random(50,200), random(0,100));
  }
 
  void move()
  {

    if(R<500) R+=random(0,2500);
//  if(r>0) r-=0.005;
    theta += 0.6;
    x = R*cos(radians(theta));
    y = R*tan(radians(theta));
  }
  void display()
  {   
    strokeWeight(r);
    point(x, y);  
  }
}



class Star2 {
  float x, y, r;
  float s;
  color c;
  float direction=1;
  float theta,phi;
  float R;
  
 


  Star2()
  {
    theta=random(-250, 180);
    R = random(100,1000);
    r = random(1,3);
    x= R*cos(radians(theta));
    y= R*sin(radians(theta));
  
    c = color(random(100,255), random(50,200), random(0,100));
  }
 
  void move()
  {

    if(R<500) R+=random(0,1500);//  if(r>0) r-=0.005;
   theta += 0.6;

    x = R*cos(radians(theta));
    y = R*sin(radians(theta));
  }
  void display()
  {   
    strokeWeight(r);
    point(x, y);  
  }
}



class Star3 {
  float x, y, r;
  float s;
  color c;
  float direction=1;
  float theta,phi;
  float R;
  
 


  Star3()
  {
    theta=random(-250, 180);
    R = random(100,1000);
    r = random(1,3);
    x= R*cos(radians(theta));
    y= R*sin(radians(theta));
  
    c = color(random(100,255), random(50,200), random(0,100));
  }
 
  void move()
  {

    if(R<500) R+=random(0,2500);
//  if(r>0) r-=0.005;
  theta += 0.6;
 
    x = R*cos(radians(theta));
    y = R*sin(radians(theta));
  }
  void display()
  { 
    fill(#E5E5E5);
    strokeWeight(r);
    point(x, y);  
  }
}



