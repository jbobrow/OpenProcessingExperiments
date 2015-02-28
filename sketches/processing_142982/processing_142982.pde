
/*
  Tree!! It's the tree of life
  The tree sends out a fruit of a certain colour
  then the element of another colour grabs it,
  then brings it to the corresponding coloured element.
*/

//objects
Earth earthy = new Earth();
Fire firey = new Fire();
Air airy = new Air();
Water watery = new Water();

//fruits
WaterFruit wFruit = new WaterFruit();
FireFruit fFruit = new FireFruit();
AirFruit aFruit = new AirFruit();

void setup()
{
  size(800,600);
  background(255);
  
  //setup any objects
  earthy.setup();
  firey.setup();
  airy.setup();
  watery.setup();
  
  //setup fruit
  wFruit.setup();
  fFruit.setup();
  aFruit.setup();
  
  strokeWeight(2);
}

void draw()
{
  //create trail
  noStroke();
  fill(255,5);
  rect(0,0,width,height);
  
  //draw the objects
  earthy.draw();
  firey.draw();
  airy.draw();
  watery.draw();
  
  //send the fruit code
  firey.checkFruit(earthy.GiveFruit(),fFruit.fireFruitX(),fFruit.fireFruitY());
  airy.checkFruit(earthy.GiveFruit(),aFruit.airFruitX(),aFruit.airFruitY());
  watery.checkFruit(earthy.GiveFruit(),wFruit.watFruitX(), wFruit.watFruitY());
  
  //see if it's been taken (only check for the one currently searching)
  //earthy.MakeFruit(keyPressed);
  switch (earthy.GiveFruit())
  {
    case 1:
      earthy.MakeFruit(airy.collide(aFruit.airFruitX(),aFruit.airFruitY()));
      break;
    case 2:
      earthy.MakeFruit(watery.collide(wFruit.watFruitX(),wFruit.watFruitY()));
      break;
    case 3:
      earthy.MakeFruit(firey.collide(fFruit.fireFruitX(),fFruit.fireFruitY()));
      break;
  }
  
}
class Air
{ 
  float c,d;
  float posX, posY;
  int thingSize;
  boolean fruitGot;
  float speedX;
  float speedY;
  float size;
  
  Air()
  {
  }

  void setup()
  {
    posX = 120;
    posY = 250;
    c=400;
    d=400;
    thingSize = 50;
    speedX = 6;
    speedY = 5;
    size = 12;
  }  
 
  void draw()
  {
    fill(255,15);
    rect(0,0,width,height); 
    
    stroke(84,121,88);
    
    pushMatrix();
    translate(posX - 400,posY - 400);
    //translate(posX,posY);
     
    float a = random(6)-3;
    float b = random(6)-3;
    line(c,d,c+a,d+b);
    line(800-c,800-d,800-(c+a),800-(d+b));
    line(800-c,d,800-(c+a),d+b);
    line(c,800-d,c+a,800-(d+b));
    line(d,c,d+b,c+a);
    line(800-d,800-c,800-(d+b),800-(c+a));
    line(d,800-c,d+b,800-(c+a));
    line(800-d,c,800-(d+b),c+a);
    c = constrain(c+a,380,420);
    d = constrain(d+b,380,420);
    popMatrix();
    
    //Bounce the Air
    if(posX + size > width || posX < 0) speedX *= -1;
     
    if(posY + size > height || posY < 0) speedY *= -1;
      
    //Move the Air
    posX += speedX;
    posY += speedY;
    
    //if air is outside, respawn in
    if(posX > width || posX + size < 0) posX = 120;

    if(posY > height || posY + size < 0) posY = 250;
  }
  
  void checkFruit(int number, float frtX, float frtY)
  {
    if (number == 1)
    {
      println("Air saw fruit");
      speedX = ((frtX - posX)/width) * 10;
      speedY = ((frtY - posY)/height) * 10;
      println("Speed X: " + speedX + ", Speed Y: " + speedY);
    }
  }
  
  boolean collide(float airFrtX, float airFrtY)
  {
    //the ellipse mode is CENTER, but I considered the thing (fruit) to be in CORNER mode
    //if (posX - size/2 <= 215 + thingSize && posX + size/2 >= 215 && posY - size/2 <= 482 + thingSize && posY + size/2 >= 482)
    if (posX <= airFrtX + thingSize/4 && posX >= airFrtX - 25 && posY <= airFrtY + thingSize/4 && posY >= airFrtY - 25)
    {
        fruitGot = true;
        speedX = 6;
        speedY = 5;
        
        //reset fruit position
        aFruit.aX = width/2 - 25;
        aFruit.aY = 200;
    }
    else
    {
      fruitGot = false;
    }
    
    return fruitGot;
  }  
}

//wind fruit
class AirFruit
{
  float aX, aY;
  float xoff=0.0;
  
  AirFruit()
  {
  }
  
  void setup()
  {
    aX = width/2 - 25;
    aY = 200;
  }
  
  void draw()
  {
    if(focused)
    {
      xoff = xoff + .01;
      float  xoff2 = xoff + xoff;
      noFill();
      stroke(84,121,88);
      ellipseMode(CENTER);
      ellipse(aX, aY, 50*noise(xoff2), 50*noise(xoff));
    }
    
    //move the fruit to 350,55
    if (aY < 55)
    {
      //move the fruit down
      aY = aY + 2;
    }
    else
    {
      aY = aY - 2;
    }
    
    if (aX < 350)
    {
      //move right
      aX = aX + 2;
    }
    else
    {
      aX = aX - 2;
    }
  }
  
  float airFruitX()
  {
    return aX;
  }
  
  float airFruitY()
  {
    return aY;
  }
}
class Earth
{
  //variables
  int elemCol; //determine the colour for the element fruit
  int propagate; //determines which fruit should propagate
  int x,y,size; //fruit coordinates & size
  int PosX, PosY; //position of the rocks
  int dir; //direction to move rocks
  int yChange; //change in the y direction
  int rot; //rotation
  
  Earth()
  {
  }
  
  void setup()
  {
    PosX = 390;
    PosY = 240;
    rot = 0;
    size = 25;
    x = width/2 - size/2;
    y = 200;
    dir = 1; //1 = down; -1 = up
    propagate = 3;
  }
  
  void draw()
  {
    //draw earth rock
    //make it float in space
    if (dir == 1)
    {
      yChange++;
    }
    else
    {
      yChange--;
    }
    
    if ((yChange == 15) || (yChange == -15))
    {
      dir = -dir;
    }
    
    //println("Y Change: " + yChange);
    
    //main rock
    pushMatrix();
    translate(PosX,PosY + yChange);
    
    fill(229,189,151);
    beginShape();
    vertex(370-PosX,168-PosY);
    vertex(411-PosX,201-PosY);
    vertex(430-PosX,266-PosY);
    vertex(394-PosX,314-PosY);
    vertex(358-PosX,286-PosY);
    endShape(CLOSE);
    
    popMatrix();
    
    //small floating rocks
    pushMatrix();
    translate(PosX,PosY + yChange);
    rotate(rot);
    
    fill(209,192,135);
    beginShape();
    vertex(479-PosX,233-PosY);
    vertex(475-PosX,246-PosY);
    vertex(488-PosX,260-PosY);
    vertex(497-PosX,231-PosY);
    vertex(488-PosX,227-PosY);
    endShape(CLOSE);
    
    fill(144,101,58);
    beginShape();
    vertex(336-PosX,176-PosY);
    vertex(331-PosX,185-PosY);
    vertex(340-PosX,193-PosY);
    vertex(349-PosX,190-PosY);
    vertex(343-PosX,170-PosY);
    endShape(CLOSE);
    
    popMatrix();
    
    //increase the rotation
    rot = rot + 3;
    
    
    //draw fruit that appear
    if (propagate == 1)
    {
      aFruit.draw();
      //draw a wind fruit
      //fill(125,255,124);
      /*windFruit(x,y);
      
      //move the fruit to 350,55
      if (y < 55)
      {
        //move the fruit down
        y = y + 2;
      }
      else
      {
        y = y - 2;
      }
      
      if (x > 350)
      {
        //move left
        x = x - 2;
      }
      else
      {
        x = x + 2;
      }*/
    }
    
    if (propagate == 2)
    {
      wFruit.draw();
      //draw a water fruit
      //fill(35,229,215);
      /*waterFruit(x,y);
      
      //move the fruit to 515,460
      if (y < 460)
      {
        //move the fruit down
        y = y + 2;
      }
      else
      {
        y = y - 2;
      }
      
      if (x < 515)
      {
        //move right
        x = x + 2;
      }
      else
      {
        x = x - 2;
      }*/
    }
    
    if (propagate == 3)
    {
      //draw a fire fruit
      //fill(255,80,80);
      //fireFruit(x,y);
      fFruit.draw();
      
      /*
      //move the fruit to 215,482
      if (y < 482)
      {
        //move the fruit down
        y = y + 2;
      }
      else
      {
        y = y - 2;
      }
      
      if (x > 215)
      {
        //move right
        x = x - 2;
      }
      else
      {
        x = x + 2;
      }*/
    }
  }
  
  int GiveFruit()
  {
    //this returns the value of the fruit
    //so the elements know how to react
    switch (propagate)
    {
      case 1:
        elemCol = 1;
        //drawSwitch = false;
        break;
      case 2:
        elemCol = 2;
        //drawSwitch = false;
        break;
      case 3:
        elemCol = 3;
        //drawSwitch = false;
        break;  
    }
    
    println("Colour: " + elemCol);
    
    return elemCol;
  }
  
  void MakeFruit(boolean propCount)
  {
     //takes a value from the elements then increases the counter
     if (propCount == true)
     {
       if (propagate <= 3)
       {
         //go to the next colour
         propagate++;
       }
       else
       {
         //reset the cycle
         propagate = 1;
       }
       
       x = width/2 - size/2;
       y = 200;
       
       propCount = false;
     }
     
     println("Propagate? " + propCount);
  }
}
class Fire
{
  //size is for the center, size2 are for the rotating sparkles
  float posX, posY, size, size2;
  float speedX, speedY, sparklePos, rotation, rotation2;
  int thingSize = 5;
  boolean fruitGot;
  
  Fire()
  {
  }
  
  void setup()
  {
    posX = width - 100;
    posY = 100;
    size = 12;
    speedX = 4;
    speedY = 3;
    sparklePos = 12;
    size2 = 12;
    rotation = 0;
    rotation2 = 0;
  }
 
  void draw()
  {  
    noStroke();
    ellipseMode(CENTER);
    
    //Drawing the rotating sparkles
    pushMatrix();
    
    translate(posX, posY);
    rotate(rotation);
    
    fill(250,255,130,45);
    ellipse(-sparklePos*5/4,sparklePos*5/4,size2/2,size2/2);
    fill(250,255,0,75);
    ellipse(-sparklePos/2,sparklePos/2,size2/2,size2/2);
    fill(250,95,0,115);
    ellipse(-sparklePos,sparklePos,size2,size2);
    
    popMatrix();
    pushMatrix();
    
    translate(posX, posY);
    rotate(rotation2);
    fill(250,190,130,45);
    ellipse(-sparklePos*5/4,sparklePos*5/4,size2/2,size2/2);
    fill(255,50,20,75);
    ellipse(-sparklePos*8/7,sparklePos*8/7,size2*3/4,size2*3/4);
    fill(250,95,0,115);
    ellipse(-sparklePos,sparklePos,size2,size2);
    popMatrix();
    
    //Rotating them
    rotation += PI/20;
    rotation2 -= PI/20;
    
    //Draw the Center of the Fire
    noStroke();
    fill(255, random(50), random(50), 100);
    ellipse(posX, posY, size, size);
    
    //Bounce the Fire
    if(posX + size > width || posX < 0) speedX *= -1;

    if(posY + size > height || posY < 0) speedY *= -1;
      
    //Move the Fire
    posX += speedX;
    posY += speedY;
    
    //Draw a bunch of lines randomly with a circle in the end of each
    for(float i = 0; i < 15; i++)
    {
      noStroke();
      fill(255, random(50), random(50), 100);
      //Draw the lines with one circle in the end of them
      float endX = posX + (random(2*size) - size);
      float endY = posY + (random(2*size) - size);
      float s = size/10.0 + random(i);
      stroke(random(50) + 150,random(50) + 25, random(50), random(30) + 100);
      line(posX + random(i) - i/2, posY + random(i) - i/2, endX, endY);
      noStroke();
      fill(random(10) + 245,random(25) + 40, random(25) + 40, random(30) + 225);
      ellipse(endX, endY, s, s);
      stroke(0);   
    }
    
    //if the fire is outside the screen, respawn inside
    if(posX > width || posX + size < 0) posX = width - 100;

    if(posY > height || posY + size < 0) posY = 100;
  }
  
  void checkFruit(int number, float firFruitX, float firFruitY)
  {
    if (number == 3)
    {
      speedX = ((firFruitX - posX)/width) * 10;
      speedY = ((firFruitY - posY)/height) * 10;
    }
  }
  
  boolean collide(float fCurX, float fCurY)
  {
    //the ellipse mode is CENTER, but I considered the thing (fruit) to be in CORNER mode
    //if (posX - size/2 <= fCurX + thingSize && posX + size/2 >= fCurX && posY - size/2 <= fCurY + thingSize && posY + size/2 >= fCurY)
    if (posX - size/2 <= fCurX && posX + size/2 >= fCurX && posY - size/2 <= fCurY && posY + size/2 >= fCurY)
    {
        fruitGot = true;
        speedX = 4;
        speedY = 3;
        println("collide");
        
        //reset fruit position
        fFruit.fX = width/2 - 25;
        fFruit.fY = 200;
    }
    else
    {
        fruitGot = false;
    }
    
    return fruitGot;
  }
}


class FireFruit
{
  float fX, fY;
  
  FireFruit()
  {
  }
  
  void setup()
  {
    fX = width/2 - 25;
    fY = 200;
  }
  
  void draw()
  {
    ellipseMode(CENTER);
    noStroke();
    fill(255,0,0, 125);
    smooth();
    
    for (int i = 2; i < 25; i++ )
    {
      noStroke();
      fill(0);
      fill(random(55) + i*10, random(15) + i*10, random(i) + 20, 125 + i*2);
      ellipse(fX + 10 - i/4,(fY - 4) + i/2,i/3,i/3 + 1);
      fill(random(55) + i*10, random(15) + i*5, random(i), 125 + i*2);
      ellipse(fX - 10 + i/4,(fY - 6) + i/2,i/3,i/2);
      fill(random(55) + i*10, random(15) + i*2, random(i), 150 + i*5);
      ellipse(fX,(fY - 10) + i*2/3,i*2/3,i*2/3);
    }
    
    //move the fruit to 215,482
    if (fY < 482)
    {
      //move the fruit down
      fY = fY + 2;
    }
    else
    {
      fY = fY - 2;
    }
    
    if (fX < 215)
    {
      //move right
      fX = fX + 2;
    }
    else
    {
      fX = fX - 2;
    }
  }
  
  float fireFruitX()
  {
    return fX;
  }
  
  float fireFruitY()
  {
    return fY;
  }
}
class Water 
{
  float x2 = 400;
  float y2 = 300;
  int xDirection;
  int yDirection;
  boolean fruitGot;
  //float x2;
  //float y2;

  PImage img;
  
  Water()
  {
  }
  
  void setup()
  {
    img = loadImage("wavesellipse.png");
  }

  void draw() 
  {
    if (frameCount % 10 == 0)
    {
       xDirection = int(random(-10, 10)); 
       yDirection = int(random(-10, 10)); 
    }
    
    x2 = x2 + xDirection;
    y2 = y2 + yDirection;
    
    if ((x2 + 25 > width)) x2 = width - 25;
    else if ((x2 < 25)) x2 = 25;
    
    if ((y2 + 25> height)) y2 = height - 25;
    else if ((y2 + 25 < 0)) y2 = 25;
    
    //check if it's outside, then respawn in
    if ((x2 > width)) x2 = width - 25;
    else if ((x2 + 25 < 25)) x2 = 25;
    
    if ((y2 > height)) y2 = height - 25;
    else if ((y2 + 25 < 25)) y2 = 25;

    noStroke();
    fill(0, 255, 240);
    ellipse(x2, y2, 80, 80);
    
    noStroke();
    fill(172, 248, 250);
    ellipse(x2, y2, 60, 60);
    
    fill(0, 255, 240, 50);
    ellipse(x2, y2, 50, 50);
     
    imageMode(CENTER);
    image(img, x2, y2);
  }
  
  boolean collide(float fCurX, float fCurY)
  {
    //if ((x2 >= 515 - 25) && (x2 <= 515 + 25) && (y2 >= 460 - 25) && (y2 <= 460 + 25))
    if ((x2 >= fCurX - 25) && (x2 <= fCurX + 25) && (y2 >= fCurY - 25) && (y2 <= fCurY + 25))
    //if ((x2 == 515) && (y2 == 460))\
    
    {
      fruitGot = true;
      println("collide");
      
      //reset fruit position
      wFruit.wX = width/2 - 25;
      wFruit.wY = 200;
    }
    else
    {
      fruitGot = false;
    }
    
    return fruitGot;
  }
  
  void checkFruit(int number, float fruitCurX, float fruitCurY)
  {
    if (number == 2)
    {//515,460
      //x2 = 515 + xDirection;
      //y2 = 460 + yDirection;
      
      if (x2 > fruitCurX)
      {
        x2 = x2 - 3;
      }
      else
      {
        x2 = x2 + 3;
      }
      
      if (y2 > fruitCurY)
      {
        y2 = y2 - 3;
      }
      else
      {
        y2 = y2 + 3;
      }
      /*
      if (x2 < 515)      x2 = 515 + xDirection;
      if (x2 > 515)      x2 = 515 - xDirection;
      if (y2 > 460)      y2 = 460 - yDirection;
      if (y2 < 460)      y2 = 460 + yDirection;*/
    }
  }
}


class WaterFruit
{
  PImage watFruit;
  float wX, wY;
  
  WaterFruit()
  {
  }
  
  void setup()
  {
    //images
    watFruit = loadImage("waterFruit.png");
    
    wX = width/2 - 25;
    wY = 200;
  }
  
  void draw()
  {
    //fill(35,229,215);
    //waterFruit(x,y);
    imageMode(CENTER);
    image(watFruit,wX,wY);
    
    //move the fruit to 515,460
    if (wY < 460)
    {
      //move the fruit down
      wY = wY + 2;
    }
    else
    {
      wY = wY - 2;
    }
    
    if (wX < 515)
    {
      //move right
      wX = wX + 2;
    }
    else
    {
      wX = wX - 2;
    }
  }
  
  float watFruitX()
  {
    return wX;
  }
  
  float watFruitY()
  {
    return wY;
  }
}


