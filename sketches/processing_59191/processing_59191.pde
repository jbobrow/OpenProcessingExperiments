
void BigsmileyInc()
{
 image(BigsmileyInc,0,0); 
}
void HangMan()
{
 image(HangMan,0,0); 
 noFill();
 if (dist(StartDist, ButtonLocation, mouseX, mouseY) < 80 && (mousePressed))
 {
  nextScreen = 2; 
 }
 if (dist(InstructDist, ButtonLocation2, mouseX, mouseY) < 80 && (mousePressed))
 {
  background(255,255,255);
  nextScreen = 3; 
 }
}
void Instructions()
{
 image(Instructions,0,0);
 if (dist(backDist, backButton, mouseX, mouseY) < 50 &&(mousePressed))
 {
  nextScreen = 1; 
 }
}
void draw()
{
   if (timer.isFinished())
 {
   nextScreen = 1;
   timer.start();
   timer = new Timer(999999999);
 }
  else if(nextScreen == 0)
  {
   BigsmileyInc();
  }
  else if(nextScreen == 1)
  {
   HangMan();
  }
  else if(nextScreen == 2)
  {
   Instructions();
  }
  else if(nextScreen == 3)
  {   
    words = random(1,2);
    lives = 6;
    if (words == 1)
    {
     fill(0,0,0);
     text("_",100,110); //d
     text("_",130,110); //i
     text("_",160,110); //s
     text("_",190,110); //a
     text("_",220,110); //g
     text("_",250,110); //r
     text("_",280,110); //e
     text("_",310,110); //e
     if (keyPressed)
     {
      if (key == 'A' || key == 'a') {text("a", 190,100);}
      if (key == 'B' || key == 'b') {lives -=1;}
      if (key == 'C' || key == 'c') {lives -=1;}
      if (key == 'D' || key == 'd') {text("d", 100,100);}
      if (key == 'E' || key == 'e') {text("e",280,100); text("e",310,100);}
      if (key == 'F' || key == 'f') {lives -=1;}
      if (key == 'G' || key == 'g') {text("g", 220,100);}
      if (key == 'H' || key == 'h') {lives -=1;}
      if (key == 'I' || key == 'i') {text("i", 130,100);}
      if (key == 'J' || key == 'j') {lives -=1;}
      if (key == 'K' || key == 'k') {lives -=1;}
      if (key == 'L' || key == 'l') {lives -=1;}
      if (key == 'M' || key == 'm') {lives -=1;}
      if (key == 'N' || key == 'n') {lives -=1;}
      if (key == 'O' || key == 'o') {lives -=1;}
      if (key == 'P' || key == 'p') {lives -=1;}
      if (key == 'Q' || key == 'q') {lives -=1;}
      if (key == 'R' || key == 'r') {text("r", 250,100);}
      if (key == 'S' || key == 's') {text("s", 160,100);}
      if (key == 'T' || key == 't') {lives -=1;}
      if (key == 'U' || key == 'u') {lives -=1;}
      if (key == 'V' || key == 'v') {lives -=1;}
      if (key == 'W' || key == 'w') {lives -=1;}
      if (key == 'X' || key == 'x') {lives -=1;}
      if (key == 'Y' || key == 'y') {lives -=1;}
      if (key == 'Z' || key == 'z') {lives -=1;}
    }
  }
      if (words == 2)
    {
     fill(0,0,0);
     text("_",100,110); //i
     text("_",130,110); //m
     text("_",160,110); //p
     text("_",190,110); //a
     text("_",220,110); //t
     text("_",250,110); //i
     text("_",280,110); //e
     text("_",310,110); //n
     text("_",340,110); //t
     if (keyPressed)
     {
      if (key == 'A' || key == 'a') {text("a", 190,100);}
      if (key == 'B' || key == 'b') {lives -=1;}
      if (key == 'C' || key == 'c') {lives -=1;}
      if (key == 'D' || key == 'd') {lives -=1;}
      if (key == 'E' || key == 'e') {text("e", 280,100);}
      if (key == 'F' || key == 'f') {lives -=1;}
      if (key == 'G' || key == 'g') {lives -=1;}
      if (key == 'H' || key == 'h') {lives -=1;}
      if (key == 'I' || key == 'i') {text("i", 100,100); text("i", 250,100);}
      if (key == 'J' || key == 'j') {lives -=1;}
      if (key == 'K' || key == 'k') {lives -=1;}
      if (key == 'L' || key == 'l') {lives -=1;}
      if (key == 'M' || key == 'm') {text("m", 120,100);}
      if (key == 'N' || key == 'n') {text("n", 310,100);}
      if (key == 'O' || key == 'o') {lives -=1;}
      if (key == 'P' || key == 'p') {text("p", 160,100);}
      if (key == 'Q' || key == 'q') {lives -=1;}
      if (key == 'R' || key == 'r') {lives -=1;}
      if (key == 'S' || key == 's') {lives -=1;}
      if (key == 'T' || key == 't') {text("t", 340,100); text("t", 220,100);}
      if (key == 'U' || key == 'u') {lives -=1;}
      if (key == 'V' || key == 'v') {lives -=1;}
      if (key == 'W' || key == 'w') {lives -=1;}
      if (key == 'X' || key == 'x') {lives -=1;}
      if (key == 'Y' || key == 'y') {lives -=1;}
      if (key == 'Z' || key == 'z') {lives -=1;}
}
    }
}
  }


