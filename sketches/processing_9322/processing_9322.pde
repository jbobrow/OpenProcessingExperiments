
Person[] people;
Hat[] hats;
Outfit[] outfits;
PImage[] imagesPerson = new PImage[3];
PImage[] imagesHat = new PImage[3];
PImage[] imagesOutfit = new PImage[3];
PFont font;
int selectedPerson;
int selectedHat = 0;
int selectedOutfit = 0;
int outfitX = -100;
int outfitY= -100;
int hatX = -100;
int hatY = -100;
int x = 0;
int y = 0;
int outfitTint1;
int outfitTint2;
int outfitTint3;
int hatTint1;
int hatTint2;
int hatTint3;
int tint1 = 255;
int tint2 = 50;
int tint3 = 50;

int fill1 = 255;
int fill2 = 255;
int fill3 = 255;
boolean outfitSwitch = false;
boolean hatSwitch=false;
int rotateFactor = 0;





void setup()
{
  println("Tasha Thiebaut");
  println("Project 2");
  
  size(800,700);
  smooth();
  imageMode(CENTER);

  
  for(int n = 0; n<3; n++)
  {
    imagesPerson[n] = loadImage("Person" + n +".gif");
  }
  people = new Person[3];
  people[0] = new Person(200,110,0);
  people[1] = new Person(400,110,1);
  people[2]= new Person(600,120,2);
  hats = new Hat[3];
  hats[0] = new Hat(50,275,0);
  hats[1] = new Hat(50, 350, 1);
  hats[2] = new Hat(50, 425, 2);
  outfits = new Outfit[3];
  outfits[0] = new Outfit(750,300,0);
  outfits[1] = new Outfit(750, 410, 1);
  outfits[2] = new Outfit(750, 550, 2);
  
  
  for(int n = 0; n<3; n++)
  {
    imagesHat[n] = loadImage("Hat" + n + ".gif");
  }
  
  for(int n = 0; n<3; n++)
  {
    imagesOutfit[n] = loadImage("Outfit" + n + ".gif");
  }
  font = loadFont("AdobeMingStd-Light-20.vlw");
  
}
void draw()
{
  println(mouseX + "," + mouseY);
  drawBackground();
  for(int n = 0; n<3; n++)
  {
    people[n].drawPerson();
  }
  for(int n = 0; n<3; n++)
  {
    hats[n].drawHat();
  }
  for(int n = 0; n<3; n++)
  {
    outfits[n].drawOutfit();
  }
  dragObjects();
  clickPerson();
  tintChange();
  hover();
}

void drawBackground()
{
  
  background(255);
  strokeWeight(3);
  fill(178,255,250);
  pushMatrix();
  translate(250,250);
  rect(0,0,300,420);
  popMatrix();
  
  drawCurtain();
  drawTriangles();
  drawRotators();
  drawBackgroundObjects();
  drawMiddleStuff();
  drawInfoBox();
  
}
void drawCurtain()
{
  strokeWeight(3);
  fill(255,95,117);
  beginShape();
  vertex(250,250);
  arc(400,250,300,100,0,PI);
  endShape(CLOSE);
}
void drawTriangles()
{
  strokeWeight(0);
  fill(255,95,117);
  for (int n = 275; n <675; n += 75)
  {
    pushMatrix();
    translate(550, n);
    triangle(0,-25,0,25,25,0);
    popMatrix();
  }
  for ( int n = 275; n < 675; n += 75)
  {
    pushMatrix();
    translate(250,n);
    rotate(PI);
    triangle(0,-25,0,25,25,0);
    popMatrix();
  }
}
void drawRotators()
{
  pushMatrix();
  strokeWeight(0);
  fill(248,252,125);
  translate(275,300);
  rotate(radians(rotateFactor));
  rotateFactor += 1;
  if(rotateFactor >= 360)
  {
    rotateFactor = 0;
  }
  rect(-10,-10,20,20);
  popMatrix();
  pushMatrix();
  strokeWeight(0);
  fill(248,252,125);
  translate(525, 300);
  rotate(radians(-rotateFactor));
  rect(-10,-10,20,20);
  popMatrix();
  
}

void drawBackgroundObjects()
{
  pushMatrix();
  translate(400,0);
  fill(fill1,fill2,fill3);
  
  
  rect(-300,20,600,160);
  popMatrix();
  pushMatrix();
  translate(30,250);
  rect(0,0,50,200);
  popMatrix();
  pushMatrix();
  translate(720,250);
  rect(0,0,55,400);
  popMatrix();
}

void drawInfoBox()
{
  pushMatrix();
  translate(20,490);
  fill(255,95,117);
  rect(0,0,190,200);
  fill(0,0,0);
  textFont(font,20);
  
  text("Choose person", 5, 40);
  text("Drag hats and outfits", 5, 61);
  text("To change color", 5, 82);
  text("type:", 5, 103);
  text("'b' for Blue", 5, 124);
  text("'r' for Red", 5, 145);
  text("'g' for Green", 5, 166);
  
  popMatrix();
  
  
  
  
}

void dragObjects()
{
  // 
  //drag Outfit
    if(mouseX > (726) && mouseX < (778) && mouseY > (242) && mouseY < (356))
    {
      if(mousePressed == true)
      {
        selectedOutfit = 0;
        outfitSwitch = true;
      }
      cursor(HAND);
      
    }
    else if(mouseX > 720 && mouseX < 777 && mouseY > 358 && mouseY < 461)
    {
      if(mousePressed == true)
      {
        selectedOutfit = 1;
        outfitSwitch = true;
      }
      cursor(HAND);
      
    }
    else if(mouseX > 720 && mouseX < 777 && mouseY > 477 && mouseY < 628)
    {
      if(mousePressed == true)
      {
        selectedOutfit = 2;
        outfitSwitch = true;
      }
      cursor(HAND);
      
      //drag hat
    } 
    else if(mouseX > 18 && mouseX < 84 && mouseY > 258 && mouseY < 292)
    {
      if(mousePressed == true)
      {
        selectedHat = 0;
        hatSwitch = true;
      }
      cursor(HAND); 
      
    }
    else if(mouseX > 24 && mouseX < 76 && mouseY > 338 && mouseY < 365)
    {
      if(mousePressed == true)
      {
        selectedHat = 1;
        hatSwitch = true;
      }
      cursor(HAND);
      
    }
    else if(mouseX > 26 && mouseX < 76 && mouseY > 410 && mouseY < 442)
    {
      if(mousePressed == true)
      {
        selectedHat = 2;
        hatSwitch = true;
      }
      cursor(HAND);
      
    } 
 }
 
 
 void hover()
 {
   if(mouseX > (726) && mouseX < (778) && mouseY > (242) && mouseY < (356))
   {
     fill1 = 255;
     fill2 = 255;
     fill3 = 255;
   }
   
   
   else if(mouseX > 720 && mouseX < 777 && mouseY > 358 && mouseY < 461)
   {
     fill1 = 225;
     fill2 = 255;
     fill3 = 255;
   }
    else if(mouseX > 720 && mouseX < 777 && mouseY > 477 && mouseY < 628)
    {
      fill1 = 255;
      fill2 = 255;
      fill3 = 255;
    }
   else if(mouseX > 18 && mouseX < 84 && mouseY > 258 && mouseY < 292)
   {
     fill1 = 255;
     fill2 = 255;
     fill3 = 255;
   }
   
   else if(mouseX > 24 && mouseX < 76 && mouseY > 338 && mouseY < 365)
   {
     fill1 = 255;
     fill2 = 255;
     fill3 = 255;
   }
   else if(mouseX > 26 && mouseX < 76 && mouseY > 410 && mouseY < 442)
   {
     fill1 = 255;
     fill2 = 255;
     fill3 = 255;
   }
   else
   {
     fill1 = 248;
     fill2 = 252;
     fill3 = 125;
   }
   
   
   
 }

void clickPerson()
{
  if(mouseButton == LEFT && mousePressed == true)
  {
    if(mouseX > 97 && mouseX < 288 && mouseY > 0 && mouseY< 232)
    {
      selectedPerson = 0;
      cursor(HAND);
    }
    else if (mouseX >300 && mouseX < 494 && mouseY > 0 && mouseY < 220)
    { 
      selectedPerson = 1;
      cursor(HAND);
    }
    else if (mouseX > 501 && mouseX < 690 && mouseY > 0 && mouseY < 230)
    {
      selectedPerson = 2;
      cursor(HAND);
    }
    else
    {
      cursor(ARROW);
    }
  }
}

void drawMiddleStuff()
{
  people[selectedPerson].drawMiddlePerson();
  hats[selectedHat].moveHat();
  hats[selectedHat].drawMiddleHat();
  hats[selectedHat].drawDupHat();
  outfits[selectedOutfit].moveOutfit();
  outfits[selectedOutfit].drawMiddleOutfit();
  outfits[selectedOutfit].drawDupOutfit();
}

void tintChange()
{
  if(key == 'b')
  {
    tint1 = 50;
    tint2 = 50;
    tint3= 255;
  }
  if(key == 'r')
  {
    tint1 = 255;
    tint2 = 50;
    tint3 = 50;
  }
  if(key == 'g')
  {
    tint1 = 50;
    tint2 = 255;
    tint3 = 50;
  }
}



class Person
{
  int translateX;
  int translateY;
  int imageNumber;
  
  

  Person(int x, int y, int i)
  {
    translateX = x;
    translateY = y;
    imageNumber = i;
  }

  void drawPerson()
  {
    pushMatrix();
    translate(translateX, translateY);
    image(imagesPerson[imageNumber],0,0);
    popMatrix();
  }
//Draw the person who shows up in the middle
  void drawMiddlePerson()
  {
    pushMatrix();
    translate(400,500);
    scale(1.5);
    image(imagesPerson[imageNumber],0,0);
  
    popMatrix();
  }
}

class Hat
{
  int translateX;
  int translateY;
  int imageNumber;
  Hat(int x, int y, int i)
  {
    translateX= x;
    translateY= y;
    imageNumber = i;
  }
  void drawHat()
  {
    pushMatrix();
    translate(translateX,translateY);
    tint(tint1,tint2,tint3);
    image(imagesHat[imageNumber], 0,0);
    noTint();
    popMatrix();
  }
  void drawMiddleHat()
  {
    if(hatSwitch == true)
    {
    pushMatrix();
    
    translate(hatX,hatY);
    scale(1.5);
    tint(hatTint1,hatTint2,hatTint3);
    image(imagesHat[imageNumber],0,0);
    noTint();
    popMatrix();
    }
  }
  void drawDupHat()
  {
    if(hatX >250 && hatX < 500 && hatY > 250 && hatY < 670 && hatSwitch == false)
    {
    pushMatrix();
    translate(hatX,hatY);
    scale(1.5);
    tint(hatTint1,hatTint2,hatTint3);
    image(imagesHat[imageNumber],0,0);
    noTint();
    popMatrix();
    }
  }
  void moveHat()
  {
    pushMatrix();
    if(mousePressed==true && hatSwitch == true)
    {
      x = x -mouseX;
      y = y - mouseY;
      hatTint1 = tint1;
      hatTint2 = tint2;
      hatTint3 = tint3;
      hatX = mouseX;
      hatY = mouseY;
      translate(hatX,hatY);
      
      cursor(HAND);
    }
    else if(mousePressed == false)
    {
      hatSwitch = false;
      cursor(ARROW);
    }
    popMatrix();
  }
 
}


class Outfit
{
  int translateX;
  int translateY;
  int imageNumber;
  
  Outfit(int x, int y, int i)
  {
    translateX= x;
    translateY= y;
    imageNumber = i;
  }
  void drawOutfit()
  {
    pushMatrix();
    translate(translateX,translateY);
    tint(tint1,tint2,tint3);
    image(imagesOutfit[imageNumber], 0,0);
    noTint();
    popMatrix();
  }
  void drawMiddleOutfit()
  {
    if(outfitSwitch == true)
    {
    pushMatrix();
    
    translate(outfitX,outfitY);
    scale(1.5);
    tint(outfitTint1,outfitTint2,outfitTint3);
    image(imagesOutfit[imageNumber],0,0);
    noTint();
    popMatrix();
    }
  }
  void drawDupOutfit()
  {
    if(outfitX >250 && outfitX < 500 && outfitY > 250 && outfitY < 670 && outfitSwitch == false)
    {
    pushMatrix();
    translate(outfitX,outfitY);
    scale(1.5);
    tint(outfitTint1,outfitTint2,outfitTint3);
    image(imagesOutfit[imageNumber],0,0);
    noTint();
    popMatrix();
    }
  }
  void moveOutfit()
  {
    pushMatrix();
    if(mousePressed==true && outfitSwitch == true)
    {
      x = x -mouseX;
      y = y - mouseY;
      outfitTint1 = tint1;
      outfitTint2 = tint2;
      outfitTint3 = tint3;
      outfitX = mouseX;
      outfitY = mouseY;
      translate(outfitX,outfitY);
     // drawMiddleOutfit();
      cursor(HAND);
    }
    else if(mousePressed == false)
    {
      outfitSwitch = false;
      cursor(ARROW);
    }
    popMatrix();
  }
 
}




