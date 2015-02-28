
PImage image1;
PImage image2;
PImage image3;
PImage image4;
PImage image5;
PImage image6;
PImage image7;
PImage image8;

Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;

boolean on=false;
boolean done=false;

float timer=0.0;
float speeder=0.0;
float sizer=0.2;
float colourB=0.0;
float colourH=0.0; 


void setup()
{   size(600,600);
    background(0,0,100);
    frameRate(60);
    
    image1=loadImage("pin.png");
    image2=loadImage("SpeedStrip.png");
    image3=loadImage("SizeStrip.png");
    image4=loadImage("ColorStrip.png");
    image5=loadImage("Start.png");
    image6=loadImage("Reset.png");
    image7=loadImage("Stop.png");
    image8=loadImage("logo.png");
    
    maxim=new Maxim(this);
    player1=maxim.loadFile("click.wav");
    player1.setLooping(false);
    player2=maxim.loadFile("fan.wav");
    player2.setLooping(true);
    player2.volume(2);

    colorMode(HSB,360,100,100);
}
void draw()
{
  
  
  background(0,0,100);
  smooth();
  imageMode(CENTER);
  

  image(image2,300,560,image2.width,image2.height);
  image(image3,35,280,image3.width,image3.height);
  image(image4,565,280,image4.width,image4.height);
  image(image5,200,450,250,250);
  image(image6,400,450,250,250);
  image(image7,275,450,250,250);
  image(image8,300,60,400,80);
  
if(on)
 { 
  
  
  float ratio= (float)mouseX / (float)width;
  
  if(mouseX>80&&mouseX<520&&mouseY<590&&mouseY>530)
 { 
   speeder=map(mouseX,0,width,0,50.0);
   player2.play();
   player2.speed(speeder/25);
   player2.setLooping(true);

 }
 
  
 if(mouseX>10&&mouseX<60&&mouseY>60&&mouseY<500)
 {
   sizer=map(mouseY,0,width,1,0);
 }
 
 if(mouseX>540&&mouseX<590&&mouseY>38&&mouseY<521)
 {
   rect(480,300,50,50);
   colourB=map(mouseX,0,width,0,100);
   colourH=map(mouseY,0,width,360,0);
 }
 
  timer=timer+0.01;
  
  
  pushMatrix();
  translate(width/2,200);
  rotate(radians(90));
  fill(colourH,100,colourB);  
  rotate(timer*speeder);
  arc(0,0,375*sizer,30,0,PI/2);
  popMatrix();

  pushMatrix();
  translate(width/2,200);
  rotate(radians(210));
  fill(colourH,100,colourB);  
  rotate(timer*speeder);
  arc(0,0,375*sizer,30,0,PI/2);
  popMatrix();
  
  pushMatrix();
  translate(width/2,200);
  rotate(radians(330));
  fill(colourH,100,colourB);
  rotate(timer*speeder);
  arc(0,0,375*sizer,30,0,PI/2);
  popMatrix();
  
  image(image1,321,226,150,150);
 
  
  }
}


void mouseClicked()
{ 
  if(mouseX>175&&mouseX<225&&mouseY>430&&mouseY<470)
  { 
    on=true;
    player1.play();
    
  }
  
  if(mouseX>270&&mouseX<320&&mouseY>430&&mouseY<470)
  {
    player1.play();
    player2.stop();
    on = false;
    done=true;
  }
  
  if(mouseX>375&&mouseX<425&&mouseY>430&&mouseY<470)
  {  
    on=true; 
    player1.play();
    player2.stop();
    speeder=0.0;
    sizer=0.2;
    colourB=0.0;
    colourH=0.0;  
  }
}




