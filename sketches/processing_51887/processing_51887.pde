
//Disco
import krister.Ess.*;

AudioChannel myChannel; 

int wordLength=5;
boolean activated=false;
boolean active=false;
char[] expl=new char[wordLength];
float[] explX=new float[wordLength];
float[] explY=new float[wordLength];
color[] palette=new color[8];
color[] bckgrnds=new color[3];

PImage[] discoBall=new PImage[6];

int discoHeight=0;
int colorCount=0;
int trans;
int xMultiply=1;
String message="DISCO";
PFont myFont;
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text
float xEll=10;
float yEll=14;
int discoRotate=0;

void setup() {
  frameRate(30);
  
   for(int i=0; i<6; i++){
      discoBall[i]=loadImage("disco"+Integer.toString(i+1)+".PNG");
    }
  
  // start up Ess 
 Ess.start(this); 

 // load "Intro.mp3" into a new Channel 
 myChannel=new AudioChannel(); 
 myChannel.loadSound("rick.mp3"); 
  
  palette[0]=color(#F6E03F);
  palette[1]=color(249,199,75);
  palette[2]=color(190,15,110);
  palette[3]=color(104,0,95);
  palette[4]=color(#D46600);
  palette[5]=color(75,0,80);
  palette[6]=color(64,0,77);
  palette[7]=color(#821F29);
  
  bckgrnds[0]=color(255,0,0);
  bckgrnds[1]=color(255,96,0);
  bckgrnds[2]=color(250,52,52);
  
  size(500, 500);
  myFont = createFont("Bauhaus 93", 24);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  
  for(int i=0; i<expl.length; i++){
   expl[i]=message.charAt(i); 
  }
  
  noStroke();
  x = width / 2;
  y = height / 2;
  trans=100;
}

void draw() {

  // If the cursor is over the text, change the position
  if (abs(mouseX - width/2) < hr && abs(mouseY - height/2) < vr){
    active=true;
  }
  else{
    activated=false;
    discoHeight=0;
    active=false;
    myChannel.stop();
    trans=100;
    discoRotate=0;
    cursor();
  }
  
  if(active){
    noCursor();
    if(discoHeight<height/2){
      background(255);
      stroke(color(#F6E03F));
      strokeWeight(2);
      line(width/2, 0, width/2, discoHeight+50);
      image(discoBall[0], width/2-60, discoHeight);
      discoHeight+=5;
    }
    else{
      activated=true;
    }
  
  if(activated){
    noStroke();
    myChannel.play(Ess.FOREVER); 
    
    if(xMultiply>29)
      xMultiply=0;
    xEll=2;
    yEll=2;
    background(bckgrnds[int(random(0,2))]);
    for(int i=5; i<250; i+=18){
      if(colorCount<8)
      fill(palette[colorCount],trans);
      for(int k=5; k<250; k+=15){
        ellipse(k*2+xMultiply,i*2,xEll,yEll);
      }
      //trans-=5;
      if(i%2==0)
        colorCount++;
      xEll++;
      yEll+=2;
    }
    xMultiply++;
    colorCount=0;
    trans=100;
    stroke(color(#F6E03F));
    strokeWeight(2);
    line(width/2, 0, width/2, discoHeight+50);
    image(discoBall[discoRotate%6], width/2-60, discoHeight);
    discoRotate++;
  }
  }
  else{
      background(255);
      x=width/2;
      y=height/2;
      fill(0,0,0);
      text(message,width/2,height/2);
  }
}

