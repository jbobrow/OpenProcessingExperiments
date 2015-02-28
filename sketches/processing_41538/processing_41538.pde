
PImage img1;
PImage img2;
PImage img3;
PImage img4;

PFont font;
void setup() 
{
  size(216, 216);
  img1 = loadImage("2014_Jiang_Tommy_001.jpg");
  img2 = loadImage("2014_Jiang_Tommy_002.jpg");
  img3 = loadImage("2014_Jiang_Tommy_003.jpg");
  img4 = loadImage("2014_Jiang_Tommy_004.jpg");

  font = loadFont("BentonSans-Medium-14.vlw");
  textFont(font);
}
void draw() 
{
  //background(200);  
  //if mouse is less than 108 Y
  if (mouseY < 108 && mouseX < 108 ) 
  {
    //show image 1
    image(img1, 0, 0);
  }
  //  or
  else if ( mouseY < 108 && mouseX>= 108)
  {
    //show image 2
    image(img2, 0, 0);
  }
  //if mouse is less than 108 X
  else if (mouseY >= 108 && mouseX < 108) 
  {
    //show image 3
    image(img3, 0, 0);
  }
  //  or
  else
  {
    //show image 4
    image(img4, 0, 0);
  }

  //stroke(102);
  //// if mouse pressed
  //if (mousePressed == true){
  //// draw black box
  //stroke(0);
  //}
  //line(0,70,width,50);

  {
  }

  // if mouse pressed
  if (mousePressed == true) {
    // draw black box
    noStroke();

    fill(0, 0, 0, 205);
    rect(0, 0, 216, 216);
    textFont(font);
    fill(255);
    textSize(14);
    text("Tommy Jiang ’14", 10, 108);
  }
}


