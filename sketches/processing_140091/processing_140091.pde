
/**
 * Loading Images. 
 * 
 * Processing applications can only load images from the network
 * while running in the Processing environment. 
 * 
 * This example will not run in a web broswer and will only work when 
 * the computer is connected to the Internet. 
 */

PImage img;
PFont font; // Digital Clock Font

void setup() {
  size(800, 480);
  img = loadImage("Koude middel kring.jpg");

}
void draw() 
{
  background(0);

  if (img != null) 
  {
    for (int i = 0; i < 5; i++) 
    {
      image(img, 0, img.height * i);
    }
  }
//display temperaturen intekenen  
  fill(122,122,122);
  rect(325, 80,90, 30);
  rect(645, 80,90, 30);
  rect(325, 365,90, 30);
  rect(515, 365,90, 30);
  
//meetspot intekenen
  fill(255, 0, 0);
  triangle(416,85,416,105,435,95);
  triangle(416,370,416,390,435,380);
  triangle(606,370,606,390,626,380);
//kleurtje aanpassen aanders valt het niet op!
  fill(0, 0, 255);
  triangle(644,85,644,105,627,95);
  
//waardes invullen in display
  font =loadFont("DigitaldreamFat-18.vlw"); 
  textFont(font, 18);
  fill(250, 87, 05);
  text("44,1 C", 330,100);
  text("63,7 C", 650,100);
  text("38,6 C", 330,385);
  text("50,9 C", 520,385);
  
//klein debug testje!

text (mouseX,700,460);
text ("-",745,460);
text (mouseY,760,460);
if (mouseX >510 & mouseX <560 & mouseY <100)
{
  text("compressor",200,460);
}
if (mouseX >510 & mouseY >420)
{
  text("exspansie ventiel",200,460);
}
 if (mouseX >430 &mouseX <450 & mouseY >200)
{
  text("verdamper",200,460);
} 
 if (mouseX >600 & mouseX <730 & mouseY >200)
{
  text("condensor",200,460);
} 
}

