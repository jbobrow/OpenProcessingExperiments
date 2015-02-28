
PImage img;
PImage img2;
PImage backgroundImg;
int toggleTime=0; //0=Day 1=Night

void setup () 
{ 
  size (400,400);
  img = loadImage("Day.jpg");
  img2 = loadImage("Night.jpg");
  backgroundImg = img; //default background
  image(img,0,0,400,400);
  toggleTime=0;
}

void draw ()
{
  
  image(backgroundImg,0,0,400,400);  //Change To Background
  fill     (#B15BE3);  //purple
  ellipse  (185,300,170,190);  //body 
  ellipse  (185,155,150,160);  //head
  
  fill     (#FFE100);
  triangle (165,170,210,170,187,190);  //nose 
  
  fill     (#8630E3);
    ellipse  (185,325,100,120);  //belly
  triangle (260,250,270,310,330,330);  //right wing 
  triangle (110,250,100,300,50,330);   //left wing
  triangle (260,50,250,110,210,90);   //right ear
  triangle (120,110,120,50,160,90);   //left ear 
 
  fill     (#D1B82C); 
  ellipse  (150,130,60,60);  //eye
  ellipse  (220,130,60,60);  //eye
  
  fill     (#000000);
  ellipse  (150,130,20,20);  //pupil
  ellipse  (220,130,20,20);  //pupil
  
  fill (#B15BE3);  //purple
  
  if (toggleTime==1)
  {
    arc(150,130,60,60,-PI, 0);
    arc(220,130,60,60,-PI, 0);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(50,45,50,50);
    
  }
  
}

void keyPressed ()
{
  if (toggleTime==0)
  {
    backgroundImg = img2;  //Change To Night
    toggleTime=1;    
  }
  else 
  {
    backgroundImg = img;  //Change To Day
    toggleTime=0;    
  }
  
  
}



