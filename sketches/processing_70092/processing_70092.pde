
//by Kevin Baker
//draws a circle with a radius proportional to the unemployment rate

int Month;
float UnEm;
void setup () {
  size (1200,600);
  Month=0;
  smooth ();  
}

void draw () {
  background (100);
  fill (0);
  text ("2009 Unemployment by Month (Move cursor left to right to change month)", 20, 20);
  Month=int(mouseX/100);
  if (Month==0){
    UnEm=7.8;
     text ("7.8%", 20, 40);
  }
  if (Month==1){
    UnEm=8.3;
     text ("8.3%", 20, 40);
  }
    if (Month==2){
    UnEm=8.7;
     text ("8.7%", 20, 40);
  }
  if (Month==3){
    UnEm=8.9;
     text ("8.9%", 20, 40);
  }
   if (Month==4){
    UnEm=9.4;
     text ("9.4%", 20, 40);
  }
  if (Month==5){
    UnEm=9.5;
     text ("9.5%", 20, 40);
  }
    if (Month==6){
    UnEm=9.5;
     text ("9.5%", 20, 40);
  }
  if (Month==7){
    UnEm=9.6;
    text ("9.6%", 20, 40);
  }
   if (Month==8){
    UnEm=9.8;
    text ("9.8%", 20, 40);
  }
  if (Month==9){
    UnEm=10.0;
    text ("10%", 20, 40);
  }
    if (Month==10){
    UnEm=9.9;
    text ("9.9%", 20, 40);
  }
  if (Month==11){
    UnEm=9.9;
    text ("9.9%", 20, 40);
  }
  ellipse (600,300, UnEm*50, UnEm*50);
  rect (0, 580, 100, 100);
  rect (200, 580, 100, 100);
  rect (400, 580, 100, 100);
  rect (600, 580, 100, 100);
  rect (800, 580, 100, 100);
  rect (1000, 580, 100, 100);
  fill (255);
  text ("January", 20, 595);
  text ("Febuary", 120, 595);
  text ("March", 220, 595);
  text ("April", 320, 595);
  text ("May", 420, 595);
  text ("June", 520, 595);
  text ("July", 620, 595);
  text ("August", 720, 595);
  text ("September", 820, 595);
  text ("October", 920, 595);
  text ("November", 1020, 595);
  text ("December", 1120, 595);

}

