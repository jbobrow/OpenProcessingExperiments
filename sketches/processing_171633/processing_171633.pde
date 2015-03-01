
//save an image on desktop
String input = "Watching him dash away,swinging an old bouquet, dead roses, Sake and strange divine Uhhhuhhuh you'll make it Passionate bright young things, takes him away to war, don't fake it, Saddening glissando strings Uhhhuhhuh you'll make it. Who'll love Aladdin Sane. Battle cries and champagne just in time for sunrise. Who'll love Aladdin Sane. Motor sensational, Paris or maybe hell - I'm waiting. Clutches of sad remains. Waits for Aladdin Sane, you'll make it. Who'll love Aladdin Sane. Millions weep a fountain, just in case of sunrise. Who'll love Aladdin Sane. We'll love Aladdin Sane. Love Aladdin Sane. Who'll love Aladdin Sane. Millions weep a fountain, just in case of sunrise. Who'll love Aladdin Sane. We'll love Aladdin Sane. We'll love Aladdin Sane"; //place lyrics here
PImage [] bow;
PFont Cali;
int counter;
int x;
int y;
int screenshotNumber;
//drag file onto sketch
//you can input audio, images, movies
float mouseSpeed;

void setup()
{
  size(800,800);
  background(255,255,255);
  Cali = loadFont("Calibri-48.vlw");
  textFont(Cali);
  bow = new PImage[10];
  bow[0] = loadImage("bow.jpg");
  strokeWeight(0);
  
}

void draw()
{
  
  //image(bow, 0, 0, bow.width/2, bow.height/2);
  mouseSpeed = (mouseX - pmouseX) + (mouseY - pmouseY);
  fill(bow[0].get(mouseX, mouseY));
  textFont(Cali, 15);
  //text("lyrics", mouseX - mouseSpeed, mouseY + mouseSpeed, mouseX + mouseSpeed, mouseY + mouseSpeed);
  if (dist(mouseX, mouseY, x, y) > 10)
  { 
    char c1 = input.charAt(counter);
    text(c1, mouseX, mouseY);
    if (counter < input.length()-1)
    {
      counter++;
    }
    else
    {
      counter =0;
    }
    x=mouseX;
    y=mouseY;
}
  
  

}
   
 





