
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
float counter = 0;
import ddf.minim.*;
Minim minim; 
AudioPlayer player; 

void setup()
{
  size(600,700);
img1= loadImage("_DSC0580.JPG");
img2= loadImage("1.JPG");
img3= loadImage("2.JPG");
img4= loadImage("3.JPG");
img5= loadImage("4.JPG");

 minim = new Minim(this);
  player = minim.loadFile("breaking_glass.wav");
}

void draw()
{
  background(0);
  imageMode(CORNER); // an der Ecke beginnen
  image(img1,0,0);
  
  
    if (mousePressed == true)
    {
  translate(0, sin(counter)*70);
  fill(230,37,37);
  noStroke();
  ellipse(250,mouseY,70,70);
  fill(255);
  ellipse(250,mouseY,14,14);
  fill(255);
  ellipse(227,mouseY+5,14,14);
  fill(255);
  ellipse(254,mouseY+25,14,14);
  fill(255);
  ellipse(238,mouseY-22,14,14);
  fill(255);
  ellipse(265,mouseY-20,14,14);
  fill(255);
  ellipse(273,mouseY+4,14,14);
  counter +=0.1;
    }
    
    else
    {
      fill(230,37,37);
      noStroke();
      ellipse(250,mouseY,70,70);
      fill(255);
  ellipse(250,mouseY,14,14);
  fill(255);
  ellipse(227,mouseY+5,14,14);
  fill(255);
  ellipse(254,mouseY+25,14,14);
  fill(255);
  ellipse(238,mouseY-22,14,14);
  fill(255);
  ellipse(265,mouseY-20,14,14);
  fill(255);
  ellipse(273,mouseY+4,14,14);
    }
    
    
   if (keyPressed ==true)
 {   
   player.play();
//image1
 if (second()<=2)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==11)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==12)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==21)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==22)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==31)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==32)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==41)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==42)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==51)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }
  
  if (second()==52)
  {
  imageMode(CORNER);
  image(img1,0,0);
  }

//image2
   if (second()==3)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==4)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==13)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==14)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==23)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  if (second()==24)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==33)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==34)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==43)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==44)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==53)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
  if (second()==54)
  {
  imageMode(CORNER);
  image(img2,0,0);
  }
  
//image3
  if (second()==5)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
   if (second()==6)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==15)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==16)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==25)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==26)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==35)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==36)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==45)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==46)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==55)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  if (second()==56)
  {
    imageMode(CORNER);
    image(img3,0,0);
  }
  
  //image4
  if (second()==7)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
   if (second()==8)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
  if (second()==17)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
  if (second()==18)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
  if (second()==27)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
   if (second()==28)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
  if (second()==37)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
  if (second()==38)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
  if (second()==47)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
  if (second()==48)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
  if (second()==57)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
  if (second()==58)
  {
    imageMode(CORNER);
    image(img4,0,0);
  }
  
//image5

 if (second()==9)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
  if (second()==10)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
  if (second()==19)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
   if (second()==20)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
   if (second()==29)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
   if (second()==30)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
   if (second()==39)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
   if (second()==40)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
   if (second()==49)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
   if (second()==50)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
   if (second()==59)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
   if (second()==60)
  {
    imageMode(CORNER);
    image(img5,0,0);
  }
  
  
  else
   {
      fill(230,37,37);
      noStroke();
      ellipse(250,mouseY,70,70);
      fill(255);
  ellipse(250,mouseY,14,14);
  fill(255);
  ellipse(227,mouseY+5,14,14);
  fill(255);
  ellipse(254,mouseY+25,14,14);
  fill(255);
  ellipse(238,mouseY-22,14,14);
  fill(255);
  ellipse(265,mouseY-20,14,14);
  fill(255);
  ellipse(273,mouseY+4,14,14);
    }
 }
  
   
}


