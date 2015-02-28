
PImage backImg;
boolean brake=false;
boolean boost=false;
boolean horn=false;
float speed=150.0;
float boostpos=80;
int btime;
PImage[] images;
int vidcurrentimg=0;
Maxim maxim;
AudioPlayer player,phorn;
int htime;
void setup()
{
  background(255);
  backImg=loadImage("finalized1.png");
  images=loadImages("track/track ", ".jpg");
  size(1024,576);
  textSize(20);
  maxim = new Maxim(this);
  player = maxim.loadFile("f1car.wav");
  phorn=maxim.loadFile("horn.wav");
  phorn.setLooping(false);
  player.setLooping(true);
  
  
}
void draw()
{
  player.play();
  image(images[vidcurrentimg],0,0);
  vidcurrentimg++;
  if(vidcurrentimg>=83)
    vidcurrentimg=0;
  image(backImg,0,0);
  if(boost==false && boostpos>0)
  {
    stroke(193,193,193);
    fill(193,193,193,128);
    ellipse(810,540,65,60);
    fill(64,64,64);
    text("Boost", 785, 545);
  }
  else if(boost==true)
  {
    noStroke();
    fill(118,230,28,128);
    ellipse(810,540,65,60);
    fill(64,64,64);
    text("Boost", 785, 545);
  }
  if(brake==false)
  {
    stroke(193,193,193);
    fill(193,193,193,128);
    ellipse(220,540,65,60);
    fill(64,64,64);
    text("Brake", 195, 545);
  }
  else
  {
    noStroke();
    fill(118,230,28,128);
    ellipse(220,540,65,60);
    fill(64,64,64);
    text("Brake", 195, 545);
  }
  if(horn==false)
  {
    stroke(193,193,193);
    fill(193,193,193,128);
    ellipse(512,510,68,68);
    fill(64,64,64);
    textSize(25);
    text("Horn", 485, 518);
  }
  else
  {
    noStroke();
    fill(118,230,28,128);
    ellipse(512,510,68,68);
    fill(64,64,64);
    text("Horn", 785, 545);
  }
  fill(138,134,252,230);
  noStroke();
  rect(853,571,125,5);
  stroke(0);
  arc(978,571,250,250,radians(180),radians(292));
  
  strokeWeight(2);
  stroke(0);
  beginShape(LINES);
  int j=0;
  for(float i=0;i<=110;i+=16.6666,j++)
  {
    vertex(978-125*cos(radians(i)),576-(125*sin(radians(i))+5));
    if(j%2==0)
      vertex(978-115*cos(radians(i)),576-(115*sin(radians(i))+5));
    else
      vertex(978-120*cos(radians(i)),576-(120*sin(radians(i))+5));
  }
  endShape();
  float spd=map(speed,0,330,0,110);
  int suix=978-105*cos(radians(spd));
  int suiy=576-(105*sin(radians(spd))+5);
  line(suix,suiy,976,571);
  noStroke();
  fill(64,64,64);
  arc(978,571,50,50,radians(75),radians(292));
  //rect(953,571,25,5);
  
  
  /*Boost Green vala*/
  stroke(235,26,26);
  noFill();
  arc(978,571,258,258,radians(180),radians(292));
  stroke(61,179,61);
  strokeWeight(3);
  float bstval=map(boostpos,0,100,180,292);
  noFill();
  arc(978,571,258,258,radians(180),radians(bstval));
  if(boost==true)
  {
    btime=millis();
    if(millis()-btime<=50)
    {
      stroke(235,26,26);
      noFill();
      arc(978,571,258,258,radians(180),radians(292));
      stroke(61,179,61);
      strokeWeight(3);
      float bstval=map(boostpos,0,100,180,292);
      noFill();
      arc(978,571,258,258,radians(180),radians(bstval));
      boostpos-=5;
      btime=millis();
    }
  }
  else if(boostpos<=100)
  {
    btime=millis();
    if(millis()-btime<=50)
    {
      stroke(235,26,26);
      noFill();
      arc(978,571,258,258,radians(180),radians(292));
      stroke(61,179,61);
      strokeWeight(3);
      float bstval=map(boostpos,0,100,180,292);
      noFill();
      arc(978,571,258,258,radians(180),radians(bstval));
      boostpos+=5;
      btime=millis();
    }
  }
  if(boost==true && boostpos==0)
  {
    boost=false;
  }
  if(horn==true && (millis() - htime) <=500)
   {
     horn=false;
        
   }
  
 
}
void mousePressed()
{
  if(mouseX>778 && mouseX<842 && mouseY>510 && mouseY<570 && boost==false)
  {
    boost=true;
   }
   else if(mouseX>478 && mouseX<546 && mouseY>476 && mouseY<544)
  { 
    phorn.stop(); 
    phorn.play();
    horn=true;
    htime=millis();
    
    
   }
}
PImage[] loadImages(String stub, String extension)
{
  PImage [] images = new PImage[0];
  for(int i =44; i <= 126; i++)
  {
    PImage img;
    if(i>=10 && i<100)
    {
      img = loadImage(stub+"00"+i+extension);
    }
    else if(i>=100 && i<1000)
    {
      img = loadImage(stub+"0"+i+extension);
      
    }
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}


