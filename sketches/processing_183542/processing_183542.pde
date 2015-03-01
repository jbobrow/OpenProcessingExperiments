
void setup ()
{
  size (500,500);
   background (255);
}
void draw ()
{
  background (255);
    fill (0);
  textSize (130);
  text ("I", 230,460);
  text ("I",270,460);
  text ("I", 165,380);
  text ("I",335,380);
   fill(#00C5FF);
  textSize (280);
  text("O", 160,380);
  fill (0);
  textSize (18);
  text ("o",210+mouseX*0.05,250+mouseY*0.05);
  text ("o",270+mouseX*0.05,250+mouseY*0.05); 
  textSize (80);
  rotate (-1.6);
  text ("C",-330-mouseY*0.05,265+mouseX*0.05);
  textSize (70);
  fill (255,0,0);
  rotate(1.6);
  text ("I",400,150);
  text ("I",450,150);
  rotate (-1.555);
  text ("I",-151,465);
  text ("I",-107,465);
  rotate(1.555);
  textSize (22);
  fill (0);
  text ("Do not",400,90);
  text ("Press",408,170);
  
   if (mouseX>400&&mouseX<465&&mouseY>100&&mouseY<150&&mousePressed==true)
  { 
    
    background (255-random(40));
    
    fill (255,255,0);
    for (int i=90;i<330;i+=5)
    text ("AU",245+random(5),i+sin(millis()/100.0+i)*10);
    for (int i=180;i<300;i+=5)
    text ("AU",185+random(5),i+sin(millis()/100.0-i)*10);
    for (int i=180;i<300;i+=5)
    text ("AU",310+random(5),i+sin(millis()/100.0-i)*10);
    
    fill (255,0,0);
    for (int i=90;i<330;i+=5)
    text ("Feuer",280+random(5),i+sin(millis()/100.0-i)*10);
    for (int i=150;i<330;i+=5)
    text ("Feuer",220+random(5),i+sin(millis()/100.0-i)*10);
       fill (0);
  textSize (130+random(50));
  text ("I", 230,460);
  text ("I",270,460);
  rotate (0.2);
  text ("I",380,240);
  rotate(-0.4);
  text ("I",100,360);
  rotate(0.2);
       noStroke ();
    fill(255);
    ellipse  (269,250,188,190);
   fill(#00C5FF);
  textSize (280);
  text("O", 160,360);
  fill (0);
  textSize (18+random(10));
  text ("o",227,250);
  text ("o",287,250); 
  text ("O",257,320);
  
    fill (255,0,0);
    textSize (70);
  text ("I",400,150);
  text ("I",450,150);
  rotate (-1.555);
  text ("I",-151,465);
  text ("I",-107,465);
  rotate(1.555);
  textSize (22);
  fill (0);
  text ("Stop",416,90);
  text ("Pressing",388,170);
  
  }
}



