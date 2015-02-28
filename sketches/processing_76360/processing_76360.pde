
PFont f; 
Button b = new Button();
import guru.ttslib.*; // custom library, will need to have application and library to use.

TTS tts; // creates object tts
void setup()
{
  size(600, 700); // custom size built specifically for this program
  frameRate(30); // frame rate included for animations
  System.setProperty("mbrola.base", "C:\\mbrola");
  tts = new TTS("mbrola_us1");
}

class Button
{
  color rectColor;
  int SIZE = 10; 
  int rectX = 100;
  int rectY = 100;
  void Button()
  {
  }

  void makeRect()
  {

    fill(0, 102, 153, 51); // colour of the shapes and text ( was gonig to fiddle with this at some point)
    int startX = 50;
    int startY= 20;
    for (startY = 20; startY < 600; startY= startY+120)
    {
      for (int i = 0; i < 4; i++) // 1st row
      { 
        rect(startX, startY, rectX, rectY);
        startX = startX + 120;
      }
      startX = 50;
    }
  }
  void makeText()
  {

    f = createFont("Comic Sans", 40, true); // Comic Sans, 40 point, anti-aliasing on
    textFont(f, 36);
    int i = 1;
    textAlign(CENTER); // allign text to centre of boxes

    for (int startX=100;startX < 600; startX=startX+120)
    {
      for (int startY = 100; startY < 500; startY= startY+120)
      {
        text(i, startY, startX);
        i++;
      }
    }
  }

 
}





void draw()
{
  background(255);
  b.makeRect();
  b.makeText();
  
}

void mousePressed() // method for mouse pressed within a certain hitbox
{
  //row 1
  if (mouseX >50 && mouseX<150 && mouseY>20 && mouseY<120)
  {
    tts.speak("1"); // uses the guru library to product text-to-speech, goes all teh way to 20 for each box
  } 
  if (mouseX >170 && mouseX<270 && mouseY>20 && mouseY<120)
  {
    tts.speak("2");
  } 
  if (mouseX >290 && mouseX<390 && mouseY>20 && mouseY<120)
  {
    tts.speak("3");
  } 
  if (mouseX >410 && mouseX<510 && mouseY>20 && mouseY<120)
  {
    tts.speak("4");
  } 

  // row 2
  if (mouseX >50 && mouseX<150 && mouseY>140 && mouseY<240)
  {
    tts.speak("5");
  } 
  if (mouseX >170 && mouseX<270 && mouseY>140 && mouseY<240)
  {
    tts.speak("6");
  } 
  if (mouseX >290 && mouseX<390 && mouseY>140 && mouseY<240)
  {
    tts.speak("7");
  } 
  if (mouseX >410 && mouseX<510 && mouseY>140 && mouseY<240)
  {
    tts.speak("8");
  } 

  //row 3
  if (mouseX >50 && mouseX<150 && mouseY>260 && mouseY<360)
  {
    tts.speak("9");
  } 
  if (mouseX >170 && mouseX<270 && mouseY>260 && mouseY<360)
  {
    tts.speak("10");
  } 
  if (mouseX >290 && mouseX<390 && mouseY>260 && mouseY<360)
  {
    tts.speak("11");
  } 
  if (mouseX >410 && mouseX<510 && mouseY>260 && mouseY<360)
  {
    tts.speak("12");
  } 

  //row 4
  if (mouseX >50 && mouseX<150 && mouseY>380 && mouseY<480)
  {
    tts.speak("13");
  } 
  if (mouseX >170 && mouseX<270 && mouseY>380 && mouseY<480)
  {
    tts.speak("14");
  } 
  if (mouseX >290 && mouseX<390 && mouseY>380 && mouseY<480)
  {
    tts.speak("15");
  } 
  if (mouseX >410 && mouseX<510 && mouseY>380 && mouseY<480)
  {
    tts.speak("16");
  } 

  //row 5
  if (mouseX >50 && mouseX<150 && mouseY>500 && mouseY<600)
  {
    tts.speak("17");
  } 
  if (mouseX >170 && mouseX<270 && mouseY>500 && mouseY<600)
  {
   tts.speak("18");
  } 
  if (mouseX >290 && mouseX<390 && mouseY>500 && mouseY<600)
  {
    tts.speak("19");
  } 
  if (mouseX >410 && mouseX<500 && mouseY>500 && mouseY<600)
  {
    tts.speak("20");
  }
}
