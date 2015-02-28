
/*Jose Mendez
CMSC 117
Keith O'Hara
sources: example codes from: wwww.openprocessing.org
*/

//Global variables.
int Length=20; 
Bubble[] bubble=new Bubble[Length];
float[] posX=new float[Length]; 
float[] posY=new float[Length]; 
float[] r=new float[Length]; 
color c = color(108, 175, 255);
String[] lines;
import ddf.minim.*;
AudioSample song;
Minim minim;
boolean displayText = false;

void setup(){ 
  size(600, 600); 
  background(0); 
  minim = new Minim(this);
  println(minim);
  //song = minim.loadSample("bubbles.caf");
  //song.play();
  textFont(loadFont("Chalkduster-48.vlw"));
  lines= loadStrings("spanish.txt");
  colorMode(RGB,255);
  smooth();
  textSize(50);
  fill(255);
  
 for(int i=0;i<lines.length;i++)
  {
    posX[i] = random(25,width-25); 
    posY[i] = random(25,height-25); 
    r[i]=30; 
    String[] pieces= split(lines[i], ',');
    String word1="";
    String word2= "";
    String word3= "";
    String word4= "";

//dividing the String into 4 different pieces
    if(pieces.length==4)
    {
      word1=pieces[0];
      word2= pieces[1];
      word3= pieces[2];
      word4= pieces[3];
    }
    bubble[i] = new Bubble(posX[i],posY[i],r[i],r[i],word1,word2,word3,word4);
    }
  }
  

void draw()
{  
  background(0,20); 
  for(int i=0;i<Length;i++){
    bubble[i].update(); 
    for(int j=0; j<i; j++)
    {
      bubble[i].exciting(0.05,bubble[j] );
    }
  }
  textSize(10);
  text("Press key 'p' to frezze the words. Click at the top bubble.", 165,10);
  text("Press space bar, then click at the same bubble.",138,20);
}

//creating the class method in order to arrage the data.
class Bubble
{  
  float xpos,ypos,sqx,sqy;  
  float directionX, speedX, speedY, directionY;
  float spring, vx, vy;
  String eng, esp, pro;
  AudioSample song2;
 
  Bubble (float x, float y,float hx,float hy, 
  String w1, String w2, String w3, String w4) 
  { 
    xpos=x; 
    ypos=y; 
    sqx=hx; 
    sqy=hy;
    directionX= 1;
    speedX=2; 
    directionY=-1;
    speedY= 1.5; 
    spring= 0.05;
    esp = w1;
    eng = w2;
    pro = w3;
    vx=0;
    vy=0;
    song2= minim.loadSample(w4);
  }
  
  void update() 
  { 
    stroke(ypos);
    rect(0,0,width,height);
    ellipseMode(RADIUS);
    smooth(); 
    noFill(); 
    textAlign(CENTER);
    float sw= textWidth(esp);
    textSize(9);
    text(esp, xpos,ypos);
    text(eng, xpos+20, ypos+20);
    text(pro,xpos-10, ypos+25);
    
    for(int i=1;i<20;i++)
    {
      stroke(red(c), green(c), blue(c), 255/i); 
      
      //creating the three different ellipsed, which are the set of bubbles.
      ellipse(xpos,ypos,sqx+i,sqy+i); 
      ellipse(xpos+20,ypos+20,sqx,sqy);
      ellipse(xpos-10,ypos+25,sqx,sqy);
    }
    
    //creating the bouncing effect
    xpos+= speedX*directionX;

    if((xpos>width-sqx) || (xpos<sqx))
    {
      directionX=-directionX;
    }

    ypos+=speedY*directionY;

    if((ypos>height-sqy) || (ypos<sqy))
    {

      directionY=-directionY;
    } 
  }
  
  void exciting(float spring, Bubble others)
  {
    float dx= others.xpos-xpos;
    float dy= others.ypos-ypos;
    float distance= sqrt(dx * dx + dy * dy);
    float miniDistance =others.sqx/2+ sqx/2;

    if(distance< miniDistance)
    {
      float angle=atan2(dy,dx);
      float targetX = xpos + cos(angle)*miniDistance;
      float targetY = ypos + sin(angle)*miniDistance; 
      float ax = (targetX - others.xpos)*spring; 
      float ay = (targetY - others.ypos)*spring; 
      speedX -= ax/2; 
      speedY -= ay/2; 
      others.speedX += ax; 
      others.speedY += ay;
    }
  }
}
/*whenever the mouse is pressed on the top buuble of every set, the spanish pronunciation
will be played. But first the 'p' key needs to be pressed in order that the texts inside the
buubles show up. Then click any key on the same bubble so that the program keeps running. 
*/

void mousePressed()
{
  for (int i=0; i<Length; i++)
  {
    float distX= bubble[i].xpos-mouseX;
    float distY= bubble[i].ypos-mouseY;
    float d= sqrt(sq(distX) + sq(distY));
    if(d< bubble[i].sqx)
    {
      bubble[i].song2.trigger();
      if(key=='p')
      {
        displayText=true;
        textSize(35);
        text(bubble[i].esp,300,50);
        text(bubble[i].eng ,300,100);
        text(bubble[i].pro,300,150);
        noLoop();
      }
      else
      {
        loop();
      }
    }
  }
}
    
      


    













