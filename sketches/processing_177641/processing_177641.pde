
/*   MY PORTFOLIO
Created: Victor RASCANU
December 2014

Since it is about bringing all together, I'm going to create
a portfolio with all my works. Thus, for each there is a kind of icon,
which, if clicked, opens a page that shows that piece of work, how I
participated and the obtained grade (Pres "s" to return). Each icon is
a fragment of a whole image, depending on its position, as the rest of
the image is covered by the others. Also, when you click on some (not
all from memory reasons) of the icons representing audio assignments
the respective track will be played.
Keys Legend:
"s" or "S" - General picture (icons); Stops the audio (if present);
"1";"2";"3";"4";"5";"6";"7";"8";"9";"q";"w";"e";"r";"t";"y"- open small
images
Mouse pressed - opens the image coresponding to the area where you clicked
Backspace or Delete - returns to the initial page
*/
import ddf.minim.*;
Minim minim;
AudioSample myname;
AudioSample project;
AudioSample whitenoise;
float teta;
int x=-242;
int x1=0;
int y;

PImage start;
PImage sat;
PImage spaceship;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;
PImage img16;
PImage imgall;
PImage meteor;

void setup() {

  img1=loadImage("1.jpg");
  img2=loadImage("2.jpg");
  img3=loadImage("3.jpg");
  img4=loadImage("4.jpg");
  img5=loadImage("5.jpg");
  img6=loadImage("6.jpg");
  img7=loadImage("7.jpg");
  img8=loadImage("8.jpg");
  img9=loadImage("9.jpg");
  img10=loadImage("10.jpg");
  img11=loadImage("11.jpg");
  img12=loadImage("12.jpg");
  img13=loadImage("13.jpg");
  img14=loadImage("14.jpg");
  img15=loadImage("15.jpg");
  img16=loadImage("16.jpg");
  imgall=loadImage("all.jpg");

  start=loadImage("start.jpg");
  sat=loadImage("satelit.png");
  meteor=loadImage("meteor.png");
  spaceship=loadImage("spaceship.png");
  
  minim=new Minim(this);
  myname=minim.loadSample("myname.mp3");
  project=minim.loadSample("project.mp3");
  whitenoise=minim.loadSample("whitenoise.mp3");
  size(1200,720);
  
}

void draw() {
if (frameCount<1400&x<1000) {
   image(start,0,0);
  //satellite
  pushMatrix();
  translate(190,535);
  rotate(teta);
  scale(0.5);
  image(sat,140,140);
  //noTint();
  popMatrix();
  teta+=0.005;
  spaceship(x1,y);
//mouving title
fill(random(100,240));
textSize(54);
textAlign(CENTER);
String u=("My Portfolio");
text(u,x,170);
image(meteor,x-70,0);
x+=floor(random(3));
x1++;
if(x>=1000) {
  x+=-1;
  
}
}
println(frameCount);
}
void spaceship(int x1,int y) {
  //spaceship
pushMatrix();
translate(x1,170);
imageMode(CENTER);
scale(0.25);
image(spaceship,x1,0);
imageMode(CORNER);
popMatrix();

}
  
void keyPressed() {
 
if(key=='1') image(img1,0,0,300,180);
if(key=='2') image(img2,300,0,300,180);
if(key=='3') image(img3,600,0,300,180);
if(key=='4') image(img4,900,0,300,180);
if(key=='5') image(img5,0,180,300,180);
if(key=='6') image(img6,300,180,300,180);
if(key=='7') image(img7,600,180,300,180);
if(key=='8') image(img8,900,180,300,180);
if(key=='9') image(img9,0,360,300,180);
if(key=='q'||key=='Q') image(img10,300,360,300,180);
if(key=='w'||key=='W') image(img11,600,360,300,180);
if(key=='e'||key=='E') image(img12,900,360,300,180);
if(key=='r'||key=='R') image(img13,0,540,300,180);
if(key=='t'||key=='T') image(img14,300,540,300,180);
if(key=='y'||key=='Y') image(img15,600,540,300,180);
if(key=='u'||key=='U') image(img16,900,540,300,180);
if(key=='s'||key=='S') image(imgall,0,0,1200,720);
if(key=='s'||key=='S') project.stop(); 
if(key=='s'||key=='S') whitenoise.stop();
  
}

void mousePressed() {
  
if (mouseY<180) {
if (mouseX<300)image(img1,0,0,1200,720);
if(mouseX>300&mouseX<600) image(img2,0,0,1200,720);
if(mouseX>600&mouseX<900) image(img3,0,0,1200,720);
if(mouseX>900) image(img4,0,0,1200,720);
}
if(mouseY>180&mouseY<360) {
  if(mouseX<300) image(img5,0,0,1200,720);
  if(mouseX>300&mouseX<600) image(img6,0,0,1200,720);
  if(mouseX>600&mouseX<900) image(img7,0,0,1200,720);
  if(mouseX>900) image(img8,0,0,1200,720);
}
if (mouseY>360&mouseY<540) {
  if(mouseX<300) image(img9,0,0,1200,720);
  if(mouseX<300) myname.trigger();
  if(mouseX>300&mouseX<600) image(img10,0,0,1200,720);
  if(mouseX>600&mouseX<900) image(img11,0,0,1200,720);
  if(mouseX>900) image(img12,0,0,1200,720); 
  if(mouseX>900) whitenoise.trigger();
}
if (mouseY>540) {
  if(mouseX<300) image(img13,0,0,1200,720);
  if(mouseX>300&mouseX<600) image(img14,0,0,1200,720);
  if(mouseX>300&mouseX<600) project.trigger();
  if(mouseX>600&mouseX<900) image(img15,0,0,1200,720);
  if(mouseX>900) image(img16,0,0,1200,720); 
                  
}
}

void keyReleased() {
  if(key==BACKSPACE||key==DELETE) {
  frameCount=frameCount-frameCount; 
   x=-242;
   x1=0;
   teta=0;
  }
}

