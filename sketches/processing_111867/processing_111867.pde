
/* @pjs font="Buenard-Bold.ttf"; */

PImage night;
PImage raven;
PFont buenard;

int alphavalue;
int starttime;
int delaytime = 2000;

float count_up;
float count_down;
float calc_alpha;
float y1=0;
float y2=0;
float y3=0;
float y4=0;

void setup() {
  size(450,650);
  night=loadImage("night.jpg");
  raven=loadImage("Raven.png");
  buenard=createFont("Buenard-Bold.ttf");
  textFont(buenard, 25);
  noStroke();
}

void draw() {
  stroke(120,alphavalue);
  fill(255,alphavalue);
  image(night, 0, 0, 450, 650);
  image(raven, 230, 190, 50, 50);
  text("Once upon a midnight dreary,", 60, 100);
  text("while I pondered, weak and weary,", 40, 300);
  text("Over many a quaint and curious,", 50, 330);
  text("volume of forgotten lore-", 80, 360);
  text("While I nodded, nearly napping", 50, 420);
  text("suddenly there came a tapping,", 60, 450);
  text("As of some one gently rapping,", 60, 480);
  text("rapping at my chamber door-", 65, 510);
  text("'Tis some visitor,' I muttered,", 60, 540);
  text("'tapping at my chamber door-", 65, 570);
  text("Only this and nothing more.'", 65, 600);
  ellipse(10, y1, 5, 5);
  y1=y1+1;
  if(y1>height) {
    y1=0;
  }
  ellipse(23, y4+30, 10, 10);
  ellipse(40, y1+30, 10, 10);
  ellipse(55, y1-50, 5, 5);
  ellipse(70, y2-10, 12, 12);
  ellipse(100, y3+50, 10, 10);
  ellipse(115, y2+80, 5, 5);
  ellipse(130, y4+75, 5, 5);
  ellipse(160, y2, 15, 15);
  y2=y2+2.5;
  if(y2>height) {
    y2=0;
  }
  ellipse(175, y3, 5, 5);
  y3=y3+1.5;
  if(y3>height) {
    y3=0;
  }
  ellipse(190, y4, 5, 5);
  y4=y4+2;
  if(y4>height) {
    y4=0;
  }
  ellipse(220, y2-80, 10, 10);
  ellipse(235, y4+100, 5, 5);
  ellipse(250, y3-100, 5, 5);
  ellipse(280, y1-90, 10, 10);
  ellipse(295, y4-15, 5, 5);
  ellipse(310, y2+75, 5, 5);
  ellipse(340, y1+90, 10, 10);
  ellipse(355, y3+60, 5, 5);
  ellipse(370, y4-50, 5, 5);
  ellipse(400, y2+100, 10, 10);
  ellipse(415, y3-70, 5, 5);
  ellipse(430, y1+100, 5, 5);
  ellipse(440, y4+150, 12, 12);
  if(mousePressed) {
   
    if (millis() - starttime < delaytime) {
      count_up = (millis() - starttime); // timer count since (mousePressed())  
      count_down = delaytime - count_up; // countdown since started (mousePressed())
       
         if (mouseButton == LEFT) {
          calc_alpha = 255 / (delaytime / count_up); // fade-in, calculate alpha value vs. duration
          alphavalue = ceil(calc_alpha); // ceil rounds UP and returns the closest integer value
         }
         if (mouseButton == RIGHT) {
          calc_alpha = 255 / (delaytime / count_down); // fade-out, calculate alpha value vs. duration
          alphavalue = floor(calc_alpha); // floor rounds DOWN and returns the closest integer value
         }

    }
     
  }
  else {
    //alphavalue = 0;
  }
   
}
 
void mousePressed() {
    starttime = millis(); 
                         
}
 





