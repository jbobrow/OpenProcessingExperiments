
//creating a tree with 'flowers/leaves' that change color 


//initializes each R G B for each flower(ellipses).

float colourR1;
float colourG1;
float colourB1;

float colourR2;
float colourG2;
float colourB2;

float colourR3;
float colourG3;
float colourB3;

float colourR4;
float colourG4;
float colourB4;

//initializes image variables

PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup()
{

  
//setting up all colour (R G B). Set to zero to start at BLACK. Same colour as tree. Will stay black until clicked.

  colourR1=0;
  colourG1=0;
  colourB1=0;
  
  colourR2=0;
  colourG2=0;
  colourB2=0;
  
  colourR3=0;
  colourG3=0;
  colourB3=0;
  
  colourR4=0;
  colourG4=0;
  colourB4=0;
  
//loading images into sketch. Images were exported to .png in order to achieve transparency. 
//Allows flower/leaves represented by circles to show through where the images overlap them

  img1=loadImage("sketch1.png");
  img2=loadImage("sketch2.png");
  img3=loadImage("sketch3.png");
  img4=loadImage("sketch4.png");
  
  size(200,400);
  background(255);
  smooth();
}

void draw()
{
  background(255);
  //When cursor reaches certain areas of page, the image will perform the 'if' functions
  //Draws the images (sketch1.png, sketch2.png, sketch3.png, sketch4.png) first 
  //Calls the function (First,Second,Third,Fourth) which draws the ellipses which represents the flowers/leaves
  if(mouseY<=380)
  { 
    image(img1,0,300);
     First(colourR1,colourG1,colourB1);
  }
  
  if(mouseY<=300)
  {
    image(img2,0,200);
    Second(colourR2,colourG2,colourB2);
  }
  
  if(mouseY<=200)
  { 
    image(img3,0,100);
    Third(colourR3,colourG3,colourB3);
  }
  
  if(mouseY<=100)
  {
    image(img4,0,0);
    Fourth(colourR4,colourG4,colourB4);
  }

}

//These functions use the float values R G and B
//Calling this function (i.e draw()) will create each ellipses with the colour R G B from the argument above
//(float R, float G, float B) 



void First(float R, float G, float B)
{
  fill(R,G,B);
  ellipse(30,300,40,40);
}

void Second(float R, float G, float B)
{
  fill(R,G,B);
  ellipse(150,200,40,40);
}

void Third(float R, float G, float B)
{
  fill(R,G,B);
  ellipse(30,110,40,40);
}

void Fourth(float R, float G, float B)
{
  fill(R,G,B);
  ellipse(150,30,40,40);
}

void mousePressed()
{
  
//To create the random colours 
//When the mouse is pressed each RGB value will change using the random function
//Colours will vary for each ellipse as the they each have ellipse is giving different values (e.g colourR1, colourR2)

  colourR1=random(255);
  colourG1=random(255);
  colourB1=random(255);
  
  colourR2=random(255);
  colourG2=random(255);
  colourB2=random(255);
  
  colourR3=random(255);
  colourG3=random(255);
  colourB3=random(255);
  
  colourR4=random(255);
  colourG4=random(255);
  colourB4=random(255);
}



