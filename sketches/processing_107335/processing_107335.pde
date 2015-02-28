
//PFont copa;
//PFont play;
int j=0;
import ddf.minim.*;
int m=1;
int coloresplay=0;
int coloresplay2=0;

Minim minim;

AudioPlayer groove;
AudioPlayer life;
AudioPlayer clap;
AudioPlayer check;
AudioPlayer never;

PShape play;
PShape stop;
PShape copa;
PShape texto;
PShape alas1;
PShape alas2;
PShape alas3;
PShape alas4;

void setup()
{

  play = loadShape("boton play.svg");
 stop = loadShape("boton stop.svg");
 copa = loadShape("copa.svg");

alas1 = loadShape("alas1.svg");
 alas2 = loadShape("alas2.svg");
alas3 = loadShape("alas3.svg");
alas4= loadShape("alas4.svg");
  minim = new Minim(this);
 
  background(0);  
  size(400,600);
  

  
  
  groove = minim.loadFile("Groovie.mp3");
  life = minim.loadFile("life.mp3");
  never =minim.loadFile("never.mp3");
  check= minim.loadFile("check.mp3");
  clap= minim.loadFile("clap.mp3");
   
}



void draw()
{
  fill(200);
  text("Teclea H,J,K o L",300,20);
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  float c= mouseX;
  float b= mouseY;
  float m= mouseX/45;



 
  if (10<mouseX && mouseX<120 && mouseY<100 && mouseY>50 )
  {
    stroke(255,0,200);
    rect(10,45,100,50);
  }
  
   if (10<mouseX && mouseX<120 && mouseY<190 & mouseY>90) {
     stroke(255,0,200);
    rect(10,95,100,50);
   
  }
 
  
 

  smooth();
  fill(100, coloresplay, 90);
  shape(play, 10, 50, 100, 40);
 shape(stop, 10, 100, 100, 40);
 shape(copa, width/2-45, height/2-65, 100, 40);
 

  if (keyPressed) {
    if (key == 'L' || key == 'l') {
      fill(255, random(100), random(100, 256));
textAlign(CENTER);
      text("Groovie", width/2,290);
    }
    
        if (key == 'k' || key == 'K') {
      fill(255, random(100), random(100, 256));
textAlign(CENTER);
      text("Groovie", width/2, 290);
    }
    if (key == 'j' || key == 'J') {
      fill(255, random(100), random(100, 256));
textAlign(CENTER);
      text("CLAP¡", width/2, 290);
    }
    if (key == 'h' || key == 'H') {
      fill(255, random(100), random(100, 256));
textAlign(CENTER);
      text("check", width/2, 290);
    }
  }






  pushMatrix();
  translate(width/2, height/2-50);
  rotate(radians(frameCount % 360 * 2));
    for(int j = 0; j < 360; j++) {
       
      if(groove.mix.get(j)*200 > 50) {
        stroke(255,0,100);
      }
      else {
        stroke(100,0,100);
      }
       
      line(cos(j)*50, sin(j)*50, cos(j)*abs(groove.left.get(j))*100 + cos(j)*50, sin(j)*abs(groove.right.get(j))*100 + sin(j)*50);
    }
    for(int k = 360; k > 0; k--) {
       
       
      if(groove.mix.get(k)*200 > 25) {
        stroke(0,100,255);
      }
      else {
        stroke(0,100,100);
      }
       
       
      line(cos(k)*50, sin(k)*50, cos(k)*abs(groove.right.get(k))*100 + cos(k)*50, sin(k)*abs(groove.left.get(k))*100 + sin(k)*50);  
    }
   
  popMatrix();
}



void mouseClicked() {


  if (10<mouseX && mouseX<120 && mouseY<100 && mouseY>50 )
  {
   m=0;
    groove.play();
   
    
    
  }
   if (10<mouseX && mouseX<120 && mouseY<190 & mouseY>90)  {
    groove.pause();
   
  }
  
}

void stop()
{
  groove.close();
  // always stop Minim before exiting.
  minim.stop();
 
  super.stop();
}


void keyPressed(){
  
  
  if (key=='l' || key == 'L')
  {
  shape(alas1, 0,200, 400,400);
   life.play();
  life.rewind();
  }
  if (key=='k' || key == 'K')
  {
  shape(alas2, 0,200, 400,400);
  never.play();
  never.rewind();
  }
  if (key=='j' || key == 'J')
  {
   shape(alas3, 0,200, 400,400);
  clap.play();
  clap.rewind();
  }
  if (key=='h' || key == 'H')
  {
    shape(alas4,0,200, 400,400);
  check.play();
  check.rewind();
  }
}


