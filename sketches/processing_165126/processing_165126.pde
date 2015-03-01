
float x;
float y;
float widthit;
float heightit;
int clicker = 99;
float pig = 0.0;
float piglet = 0.01;
int circle = 200;
void setup()
{

  size(400,400);
  background(0);
  smooth();
  frameRate(7);
}


void draw()
{
  float a =(width/2);
  float b =(height/2);
  float c =(width);
  float d =(height);
  
  drawHim(mouseX, mouseY, 200, 200);
}
void drawHim(float x,float y,float widthit,float heightit)
{
  
  fill(255);
  stroke(#B6B7B1);
  strokeWeight(3);
  rectMode(CENTER);
  rect(x-(widthit*0.019),y+(heightit*0.54),widthit*0.6, heightit*0.3);
  
  triangle(x,y+heightit*0.7, x, y+ heightit*0.73,x+ widthit*0.28, y+heightit*0.7);
  triangle(x,y+heightit*0.7, x, y+ heightit*0.73,x- widthit*0.32, y+heightit*0.7);
  
  //Bow Tie
  fill(0);
  stroke(#42433D);
  strokeWeight(4);
  triangle( x,y+heightit*0.6,
            x+ widthit*0.26, y+ heightit*0.7,
            x+ widthit*0.26, y+ heightit*0.5);
  triangle( x,y+heightit*0.6,
            x- widthit*0.26, y+ heightit*0.7,
            x- widthit*0.26, y+ heightit*0.5);
  
  
  fill(92,56,54);
  noStroke();
  //Head Shadow
  ellipseMode(CENTER);
  ellipse(x,y+9,widthit, heightit);

  //Ears
  fill(112,65,57);
  ellipse(x-widthit*.4,y,widthit*.3,heightit*.3);
  ellipse(x+widthit*.4,y,widthit*.3,heightit*.3);
  
  
  //InnerEars
  fill(92,56,54);
  ellipse(x-widthit*.4,y,widthit*.27,heightit*.27);
  ellipse(x+widthit*.4,y,widthit*.27,heightit*.27);
  
  //Head
  fill(112,65,57);
  noStroke();
  ellipse(x,y,widthit,heightit);
  
  
  
  //LeftEarring
  fill(255,255,255,180);
  float earringLeftCentreX = x-widthit*0.47;
  float earringLeftCentreY = y+heightit*0.15;
  float earringLeftRadiusX = widthit*0.07;
  float earringLeftRadiusY = heightit*0.07;
  
  ellipse(earringLeftCentreX, earringLeftCentreY, widthit*0.09, heightit*0.09);
  quad( earringLeftCentreX-earringLeftRadiusX, earringLeftCentreY, 
        earringLeftCentreX, earringLeftCentreY-earringLeftRadiusY,
        earringLeftCentreX+earringLeftRadiusX, earringLeftCentreY,
        earringLeftCentreX, earringLeftCentreY+earringLeftRadiusY
       );
  
  ////RightEarring
  fill(255,255,255,180);
  float earringRightCentreX = x+widthit*0.47;
  float earringRightCentreY = y+heightit*0.15;
  float earringRightRadiusX = widthit*0.07;
  float earringRightRadiusY = heightit*0.07;
  
  ellipse(earringRightCentreX, earringRightCentreY, widthit*0.09, heightit*0.09);
  quad(   earringRightCentreX-earringRightRadiusX, earringRightCentreY,
          earringRightCentreX, earringRightCentreY-earringRightRadiusY,
          earringRightCentreX+earringRightRadiusX, earringRightCentreY,
          earringRightCentreX, earringRightCentreY+earringRightRadiusY
       );
  
  //ButtChin
  noStroke();
  fill(92,56,54);
  float chinRadiusX = widthit*0.2;
  float chinRadiusY = heightit*0.2;
  
  ellipse(x-(chinRadiusX*0.6), y+(heightit*0.5), chinRadiusX, chinRadiusY);
  ellipse(x+(chinRadiusX*0.3), y+(heightit*0.5), chinRadiusX, chinRadiusY);
  
  ellipseMode(CORNER);
  fill(112,65,57);
  ellipse(x-(chinRadiusX), ((y+heightit*0.5)-chinRadiusY*0.6),chinRadiusX*0.9, chinRadiusY*0.9);
  ellipse(x-(chinRadiusX*0.1), ((y+heightit*0.5)-chinRadiusY*0.6),chinRadiusX*0.9, chinRadiusY*0.9);
  
  //eyes
  //cornea
  fill(255);
  strokeWeight(0.3);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(x-widthit*.3+(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.3,heightit*.3);
  ellipse(x+widthit*.3-(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.3,heightit*.3);
  
  //pupil
  fill(0);
  strokeWeight(3);
  stroke(random(255));
  ellipse(x-widthit*.3+(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.1,heightit*.1);
  ellipse(x+widthit*.3-(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.2,heightit*.2);
  
  
  //Shades Shadow
  strokeWeight(9);
  stroke(#454644);
  noFill();
  rectMode(CENTER);
  rect(x-widthit*.275+(mouseX*.075),y-heightit*.14+(mouseY*.05),widthit*.300000,heightit*.300000);
  rect(x+widthit*.326-(mouseX*.075),y-heightit*.14+(mouseY*.05),widthit*.300000,heightit*.300000);
  rect(x-widthit*.27+(mouseX*.075),y-heightit*.29+(mouseY*.05),widthit*.33,heightit*0.009);
  rect(x+widthit*.346-(mouseX*.075),y-heightit*.29+(mouseY*.05),widthit*.33,heightit*0.009);
  //Shades Frame
  strokeWeight(9);
  stroke(0);
  noFill();
  rectMode(CENTER);
  rect(x-widthit*.3+(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.3,heightit*.3);
  rect(x+widthit*.3-(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.3,heightit*.3);
  rect(x-widthit*.32+(mouseX*.075),y-heightit*.30+(mouseY*.05),widthit*.33,heightit*0.009);
  rect(x+widthit*.32-(mouseX*.075),y-heightit*.30+(mouseY*.05),widthit*.33,heightit*0.009);
  
  //Glass
  fill(0,0,0,200);
  rectMode(CENTER);
  rect(x-widthit*.3+(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.3,heightit*.3);
  rect(x+widthit*.3-(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.3,heightit*.3);
  rect(x-widthit*.32+(mouseX*.075),y-heightit*.30+(mouseY*.05),widthit*.33,heightit*0.009);
  rect(x+widthit*.32-(mouseX*.075),y-heightit*.30+(mouseY*.05),widthit*.33,heightit*0.009);
  
  
    //Mouth
  ellipseMode(CENTER);
  fill(0);
  noStroke();
   ellipse(x,y+heightit*0.3,widthit*0.09, heightit*0.15);

  float randomx = random(-9,9);
  float randomw = random(3,36);
  
  
  
  
  
  
  
  
  
  
  
  
  
  if (clicker >99)
  {
   
    fill(255);
  stroke(#B6B7B1);
  strokeWeight(3);
  rectMode(CENTER);
  rect(x-(widthit*0.019),y+(heightit*0.54),widthit*0.6, heightit*0.3);
  

 
  noFill();
stroke(mouseX,mouseY,random(255),100);
 triangle(random(pmouseX),pmouseY,
           random(pmouseX),pmouseY+18,
           random(pmouseX-36),pmouseY);
    

    strokeWeight(3);
    stroke(random(255),random(255),random(255));
    filter(BLUR);
//    filter(DILATE);
    stroke(255, 255, 255, 100);
    fill(noise(pig*60)*187, noise(pig)*242, 105, 20);
    ellipse(random(mouseX), random(mouseY), noise(pig)*circle*1.5, noise(pig)*circle);
    pig+=piglet;
    stroke(133, 242, 245, 100);
    ellipse(random(mouseX+randomx), random(mouseY+randomx), randomw*1.5, randomw);
    
  triangle(x,y+heightit*0.7, x, y+ heightit*0.73,x+ widthit*0.28, y+heightit*0.7);
  triangle(x,y+heightit*0.7, x, y+ heightit*0.73,x- widthit*0.32, y+heightit*0.7);
  

  filter(BLUR);
  //Bow Tie
  fill(0);
  stroke(#42433D);
  strokeWeight(4);
  triangle( x,y+heightit*0.6,
            x+ widthit*0.26, y+ heightit*0.7,
            x+ widthit*0.26, y+ heightit*0.5);
  triangle( x,y+heightit*0.6,
            x- widthit*0.26, y+ heightit*0.7,
            x- widthit*0.26, y+ heightit*0.5);
  
  
  fill(92,56,54);
  noStroke();
  //Head Shadow
  ellipseMode(CENTER);
  ellipse(x,y+9,widthit, heightit);
  
  //Ears
  fill(112,65,57);
  ellipse(x-widthit*.4,y,widthit*.3,heightit*.3);
  ellipse(x+widthit*.4,y,widthit*.3,heightit*.3);
  
  
  //InnerEars
  fill(92,56,54);
  ellipse(x-widthit*.4,y,widthit*.27,heightit*.27);
  ellipse(x+widthit*.4,y,widthit*.27,heightit*.27);
  
  //Head
  fill(112,65,57);
  noStroke();
  ellipse(x,y,widthit,heightit);
  
  
  
  //LeftEarring
  fill(255,255,255,180);
//  float earringLeftCentreX = x-widthit*0.47;
//  float earringLeftCentreY = y+heightit*0.15;
//  float earringLeftRadiusX = widthit*0.07;
//  float earringLeftRadiusY = heightit*0.07;
  
  ellipse(earringLeftCentreX, earringLeftCentreY, widthit*0.09, heightit*0.09);
  quad( earringLeftCentreX-earringLeftRadiusX, earringLeftCentreY, 
        earringLeftCentreX, earringLeftCentreY-earringLeftRadiusY,
        earringLeftCentreX+earringLeftRadiusX, earringLeftCentreY,
        earringLeftCentreX, earringLeftCentreY+earringLeftRadiusY
       );
  
  ////RightEarring
  fill(255,255,255,180);
//  float earringRightCentreX = x+widthit*0.47;
//  float earringRightCentreY = y+heightit*0.15;
//  float earringRightRadiusX = widthit*0.07;
//  float earringRightRadiusY = heightit*0.07;
  
  ellipse(earringRightCentreX, earringRightCentreY, widthit*0.09, heightit*0.09);
  quad(   earringRightCentreX-earringRightRadiusX, earringRightCentreY,
          earringRightCentreX, earringRightCentreY-earringRightRadiusY,
          earringRightCentreX+earringRightRadiusX, earringRightCentreY,
          earringRightCentreX, earringRightCentreY+earringRightRadiusY
       );
  
  //ButtChin
  noStroke();
  fill(92,56,54);
//  float chinRadiusX = widthit*0.2;
//  float chinRadiusY = heightit*0.2;
//  
  ellipse(x-(chinRadiusX*0.6), y+(heightit*0.5), chinRadiusX, chinRadiusY);
  ellipse(x+(chinRadiusX*0.3), y+(heightit*0.5), chinRadiusX, chinRadiusY);
  
  ellipseMode(CORNER);
  fill(112,65,57);
  ellipse(x-(chinRadiusX), ((y+heightit*0.5)-chinRadiusY*0.6),chinRadiusX*0.9, chinRadiusY*0.9);
  ellipse(x-(chinRadiusX*0.1), ((y+heightit*0.5)-chinRadiusY*0.6),chinRadiusX*0.9, chinRadiusY*0.9);
  
  //eyes
  //cornea
  fill(255);
  strokeWeight(0.3);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(x-widthit*.3+(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.3,heightit*.3);
  ellipse(x+widthit*.3-(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.3,heightit*.3);
  
  //pupil
  fill(0);
  strokeWeight(3);
  stroke(random(255));
  ellipse(x-widthit*.3+(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.1,heightit*.1);
  ellipse(x+widthit*.3-(mouseX*.075),y-heightit*.15+(mouseY*.05),widthit*.2,heightit*.2);
  
  ellipseMode(CENTER);
  fill(0);
  noStroke();
   ellipse(x,y+heightit*0.3,widthit*0.3, heightit*0.15);
  fill(random(0,255),random(0,10),random(0,0));
   ellipse(x,y+heightit*0.3,widthit*0.18,heightit*0.1);
   ellipseMode(CORNER);
  
   ellipse(x-9,y+heightit*0.3,widthit*0.1, heightit*0.1);

  }
}

void mousePressed()
{
if (mousePressed == true)
{
  clicker = 100;
}
}

void mouseReleased()
{
  clicker = 99;

}

