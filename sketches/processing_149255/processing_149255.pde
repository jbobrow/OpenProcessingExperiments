
import gifAnimation.*;
Gif sevImg, sevImg2, draImg, draImg2, lucImg, lucImg2, albImg, albImg2, narImg, narImg2, sirImg, sirImg2;
PImage Img2;
float z = 0;
float rotVar1 = 0;
float rotVar2 = 0;
float rotVar3 = 0;
float rotVar4 = 0;
float rotVar5 = 0;
float rotVar6 = 0;
int startup = 1;

//int released = 0;
//float zTest = 0;
//float scaleFloat = 0;
//boolean startup = true;
//float alpha = 255;
//float alpha1 = 0;
//float val = 0;
void setup()
{
  size(640, 360, P3D);
//  console.log("made it to here!");
  sevImg = new Gif(this, "snapeFront.gif");
  //  sevImg2 = new Gif(this, "severusBack.png");
  draImg = new Gif(this, "dracoFront.gif");
  //  draImg2 = new Gif(this, "dracoBack.png");
  lucImg = new Gif(this, "luciusFront.gif");
  //  lucImg2 = new Gif(this, "luciusBack.png");
  albImg = new Gif(this, "dumbledoreFront.gif");
  //  albImg2 = new Gif(this, "albusBack.png");
  narImg = new Gif(this, "narcissaFront.gif");
  //  narImg2 = new Gif(this, "narcissaBack.png");
  sirImg = new Gif(this, "siriusFront.gif");
  //  sirImg2 = new Gif(this, "siriusBack.png");
  Img2 = loadImage("backCardSized.png");
  String [] animas = {
  };
  //  frameRate(6);
  background(0);
}
void severus()
{
  translate(width/2, 0, -800);
  rotateZ(TWO_PI);
  rotateY(PI);
  rotateY(rotVar1);
  rotVar1 = rotVar1 + .02;
  image(sevImg, 0, 0);
  translate(0, 0, 5);
  image(Img2, 0, 0);
//  sevImg.play();
}

void albus()
{
  translate(0, 0, 800);
  rotateY(rotVar2);
  rotVar2 = rotVar2 + .02;
  image(albImg, 0, 0);
  translate(0, 0, 5);      
  image(Img2, 0, 0);
  albImg.play();
}

void lucius()
{
  translate(0, -300, -300);
  rotateY(rotVar3);
  rotVar3 = rotVar3 + .02;
  image(lucImg, 0, 0);   
  translate(0, 0, 5);   
  image(Img2, 0, 0);
  lucImg.play();
}

void narcissa()
{
  translate(0, 400, -1000);
  rotateY(rotVar4);
  rotVar4 = rotVar4 + .02;
  image(narImg, 0, 0);   
  translate(0, 0, 5);   
  image(Img2, 0, 0);
  narImg.play();
}
void draco()
{
  translate(200, -400, -1000);
  rotateY(rotVar5);
  rotVar5 = rotVar5 + .02;
  image(draImg, 0, 0);   
  translate(0, 0, 5);   
  image(Img2, 0, 0);
  //  draImg.play();
}
void sirius()
{
  translate(-200, 600, 1000);
  rotateY(rotVar6);
  rotVar6 = rotVar6 + .02;
  image(sirImg, 0, 0);   
  translate(0, 0, 5);   
  image(Img2, 0, 0);
  sirImg.play();
}
void orbit()
{
  severus();
  albus();
  lucius();
  narcissa();
  draco();
  sirius();
}

void draw()
{
  background(0);
  //SeverusRect
  fill(200, 140, 140, 75);
  strokeWeight(2);
  rect(0, 0, width/6, height/7);
  textSize(20);
  fill(255);
  text("Severus S.", 5, 25); 
  //DumbledoreRect
  fill(200, 140, 140, 75);
  strokeWeight(2);
  rect(0, height/7, width/6, height/7);
  textSize(20);
  fill(255);
  text("Albus D.", 10, 80);
  //LuciusRect
  fill(200, 140, 140, 75);
  strokeWeight(2);
  rect(0, 2*height/7, width/6, height/7);
  textSize(20);
  fill(255);
  text("Lucius M.", 5, 135); 
  //NarcissaRect
  fill(200, 140, 140, 75);
  strokeWeight(2);
  rect(0, 3*height/7, width/6, height/7);
  textSize(19);
  fill(255);
  text("Narcissa M.", 0, 185); 
  //DracoRect
  fill(200, 140, 140, 75);
  strokeWeight(2);
  rect(0, 4*height/7, width/6, height/7);
  textSize(20);
  fill(255);
  text("Draco M.", 7, 235); 
  //SiriusRect
  fill(200, 140, 140, 75);
  strokeWeight(2);
  rect(0, 5*height/7, width/6, height/7);
  textSize(20);
  fill(255);
  text("Sirius B.", 10, 285); 
  //orbitRect
  fill(200, 140, 140, 75);
  strokeWeight(2);
  rect(0, 6*height/7, width/6, height/7);
  textSize(20);
  fill(255);
  text("ORBIT", 15, 335); 

  if (startup == 1)
  {
    orbit();
  }
}

void mouseReleased()
{
  //severus
  if (mouseX >= 0 && mouseY >= 0 && mouseX <= width/6 && mouseY <= height/7)
  {
    startup = -1;
    severusAnimation();
  }
  //Albus
  if (mouseX >= 0 && mouseY >= height/7 && mouseX <= width/6 && mouseY <= 2*height/7)
  {
    startup = -1;
    albusAnimation();
  }

  //Lucius
  if (mouseX >= 0 && mouseY >= 2*height/7 && mouseX <= width/6 && mouseY <= 3*height/7)
  {
    startup = -1;
    luciusAnimation();
  }
  //Narcissa
  if (mouseX >= 0 && mouseY >= 3*height/7 && mouseX <= width/6 && mouseY <= 4*height/7)
  {
    startup = -1;
    narcissaAnimation();
  }
  //Draco
  if (mouseX >= 0 && mouseY >= 4*height/7 && mouseX <= width/6 && mouseY <= 5*height/7)
  {
    startup = -1;
    dracoAnimation();
  }
  //Sirius
  if (mouseX >= 0 && mouseY >= 5*height/7 && mouseX <= width/6 && mouseY <= 6*height/7)
  {
    startup = -1;
    siriusAnimation();
  }
  //Orbit
  if (mouseX >= 0 && mouseY >= 6*height/7 && mouseX <= width/6 && mouseY <= height)
  {
    startup = 1;
  }
}
void severusAnimation()
{
}
void albusAnimation()
{
}
void luciusAnimation()
{
}
void narcissaAnimation()
{
}
void dracoAnimation()
{
}
void siriusAnimation()
{
}

//public void fadeIn()
//{
//  background(0);
//  lights();
//  translate(width/2 - 350, -height + 100, -800);
//  rotateX(2*TWO_PI);
//  rotateZ(2* PI);
//  if (scaleFloat < 2)
//  {
//    scaleFloat = scaleFloat + .02;
//  }
//  scale(scaleFloat);
//  tint(0, 0, 0, alpha1);
//  if (alpha1 < 255 && alpha1 >= 0)
//  {
//    alpha1 = alpha1 + 3;
//  }
//  image(img, 0, 0);
//  translate(0, 0, 5);
//  image(img2, 0, 0);    
//  startup = false;
//  alpha = 255;
//}
