

void setup ()
{
  smooth ();
  size (500,500);
}
void draw ()
{
  background (255);
  ellipseMode (CENTER);
  println (mouseX);
  noStroke ();
  fill (100);
  ellipse (250,450,130,40);
  stroke (0);
  strokeWeight (4);
  line (220,370,220,450);  //Beine
  line (280,370,280,450);
  //line (210,450,220,450);
  //line (280,450,290,450);  
  fill (#00C5FF);           //Körper 
  ellipse (250,280,160,220);
  line (330,280,330,360);  //Arme
  line (170,280,170,360);
  fill(0);                 //Augen
  ellipse (210+mouseX*0.05,250+mouseY*0.05,5,10);
  ellipse (270+mouseX*0.05,250+mouseY*0.05,5,10);   
  ellipse (240+mouseX*0.05,290+mouseY*0.05,100,20);  //Mund
  fill (#00C5FF);
  noStroke();
  ellipse (240+mouseX*0.05,289+mouseY*0.05,106,24);
  stroke (0);
  fill(255,0,0);
  rect (400,100,50,50);
  fill (0);
  PFont myFont;
  myFont = createFont("Georgia", 22);
  textFont(myFont);
  textAlign(CENTER,CENTER);
  text("Do not", 425,80);
  text ("Press", 425,170);
  
   if (mouseX>400&&mouseX<450&&mouseY>100&&mouseY<150&&mousePressed==true)
  { 
    
    background (255-random(40));
    
    fill (255,255,0);
    for (int i=150;i<330;i+=5)
    text ("AU",245+random(5),i+sin(millis()/100.0+i)*10);
    for (int i=180;i<300;i+=5)
    text ("AU",185+random(5),i+sin(millis()/100.0-i)*10);
    for (int i=180;i<300;i+=5)
    text ("AU",310+random(5),i+sin(millis()/100.0-i)*10);
    
    fill (255,0,0);
    for (int i=150;i<330;i+=5)
    text ("Feuer",280+random(5),i+sin(millis()/100.0-i)*10);
    for (int i=150;i<330;i+=5)
    text ("Feuer",220+random(5),i+sin(millis()/100.0-i)*10);
  
  noStroke ();
  fill (80);
  ellipse (250,450,130+random(20),20+random(10));
  stroke (0);
  strokeWeight (4);
  line (220,370,220,450-random (30));  //Beine
  line (280,370,280,450-random (30));
  //line (210,450,220,450);
  //line (280,450,290,450);  
  fill (#00C5FF);           //Körper 
  ellipse (250,280,160,220);
  line (330,280,330+random(20),220+random(10));  //Arme
  line (170,280,150+random(20),220+random (10));
  fill(0);                 //Augen
  ellipse (220,250,5+random(3),10+random(4));
  ellipse (280,250,5+random(3),10+random(4));   
  fill (#00C5FF);
  noStroke ();
  ellipse (250,258,120,10);
  fill (0);
  ellipse (250,300,30+random(8),40+random(10));
  stroke (0);
  fill(255,0,0);
  rect (400,100,50,50);
  fill (0);
  PFont myFont2;
  myFont2 = createFont("Georgia", 22);
  textFont(myFont);
  textAlign(CENTER,CENTER);
  text("STOP", 425,80);
  text ("PRESSING", 425,170);
  }
}
