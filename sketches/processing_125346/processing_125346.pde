
PImage img;
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




void setup()
{
  size(800,530);
  img =  loadImage("_DSC0009.JPG");
  img2 = loadImage("_DSC0010.png");
  img3 = loadImage("_DSC0011.png");
  img4 = loadImage("_DSC0013.png");
  img5 = loadImage("_DSC0014.png");
  img6 = loadImage("_DSC0015.png");
  img7 = loadImage("_DSC0016.png");
  img8 = loadImage("_DSC0017.png");
  img9 = loadImage("_DSC0018.png");
  img10 = loadImage("_DSC0020.png");
  img11 = loadImage("_DSC0021.png");
  img12= loadImage("_DSC0022.png");
  img13= loadImage("_DSC0023.png");
}

void draw()
{
  background(0);
  imageMode(CORNER);
  image(img,0,0);
  
  //image2
  if (second()<=10)
  {
  imageMode(CENTER);
  image(img2,420,250);
  }
  
  //image3
  if (second()==11)
  {
    imageMode(CENTER);
    image(img3,420,250);
  }
  
   if (second()==12)
  {
    imageMode(CENTER);
    image(img3,420,250);
  }
  
  if (second()==13)
  {
    imageMode(CENTER);
    image(img3,420,250);
  }
  
  //image4
  if (second()==14)
  {
    imageMode(CENTER);
    image(img4,420,250);
  }
  
   if (second()==15)
  {
    imageMode(CENTER);
    image(img4,420,250);
  }
  
  if (second()==16)
  {
    imageMode(CENTER);
    image(img4,420,250);
  }

  //image5
if (second()==17)
{
  imageMode(CENTER);
  image(img5,420,250);
}

if (second()==18)
{
  imageMode(CENTER);
  image(img5,420,250);
}

if (second()==19)
{
  imageMode(CENTER);
  image(img5,420,250);
}

//image6
if (second()==20)
{
  imageMode(CENTER);
  image(img6,420,250);
}

if (second()==21)
{
  imageMode(CENTER);
  image(img6,420,250);
}

if (second()==22)
{
  imageMode(CENTER);
  image(img6,420,250);
}

  //image7
if (second()==23)
{
  imageMode(CENTER);
  image(img7,420,250);
}

if (second()==24)
{
  imageMode(CENTER);
  image(img7,420,250);
 
}

if (second()==25)
{
  imageMode(CENTER);
  image(img7,420,250);
 
}

  //image8
if (second()==26)
{
  imageMode(CENTER);
  image(img8,420,250);
}

if (second()==27)
{
  imageMode(CENTER);
  image(img8,420,250);
}

if (second()==28)
{
  imageMode(CENTER);
  image(img8,420,250);
}

//image9
if (second()==29)
{
  imageMode(CENTER);
  image(img9,420,250);
}

if (second()==30)
{
  imageMode(CENTER);
  image(img9,420,250);
}

if (second()==31)
{
  imageMode(CENTER);
  image(img9,420,250);
}

//image10
if (second()==32)
{
  imageMode(CENTER);
  image(img10,420,250);
}

if (second()==33)
{
  imageMode(CENTER);
  image(img10,420,250);
}

if (second()==34)
{
  imageMode(CENTER);
  image(img10,420,250);
}

  //image11
if (second()==35)
{
  imageMode(CENTER);
  image(img11,420,250);
}

if (second()==36)
{
  imageMode(CENTER);
  image(img11,420,250);
}

if (second()==37)
{
  imageMode(CENTER);
  image(img11,420,250);
}

//image12
if (second()==38)
{
  imageMode(CENTER);
  image(img12,420,250);
}

if (second()==39)
{
  imageMode(CENTER);
  image(img12,420,250);
}

if (second()==40)
{
  imageMode(CENTER);
  image(img12,420,250);
}

  //image13
if (second()==41)
{
  imageMode(CENTER);
  image(img13,420,250);
}

if (second()==42)
{
  imageMode(CENTER);
  image(img13,420,250);
}

if (second()==43)
{
  imageMode(CENTER);
  image(img13,420,250);
}
  
}


