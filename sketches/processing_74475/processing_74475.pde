
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage img;
int a=400;
void setup()
{
  size(800, 600);
  img=loadImage("Bay Bridge.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Heavy Rain.mp3");
  player.loop();
}
void draw()
{
  background(100);
  image(img, 0, 0, width, 400);
  fill(120, 120, 125);
  strokeWeight(1);
  stroke(120);
  rect(0, 550, 800, 50);
  tint(50, 50, 50, 100);
  roof();
  base();
  structure();
  clock();
  strokeWeight(1);
  facade();
  windows();
  market();
  lightning();
  rain();
}
void roof()
{
  fill(150);
  stroke(0);
  rect(a-400, 395, 150, 10);
  rect(a-250, 390, 500, 10);
  rect(a+250, 395, 150, 10);
  rect(a-155, 380, 310, 10);
}
void base()
{
  fill(70, 175, 225);
  //BASE//
  rect(a-250, 400, 500, 150);
  stroke(0);
  rect(a-400, 405, 155, 145);
  rect(a+245, 405, 155, 145);
  //CLOCKTOWER//
  rect(a-55, 200, 110, 5);
  rect(a-50, 190, 100, 210);
  rect(a-50, 150, 100, 50);
  rect(a-50, 130, 100, 20);
  rect(a-40, 110, 80, 20);
  rect(a-35, 100, 70, 10);
  rect(a-30, 60, 60, 40);
  rect(a-20, 30, 40, 30);
  rect(a-10, 10, 20, 20);
  rect(a-55, 199, 110, 6);
  rect(a-55, 221, 110, 4);
  rect(a-55, 149, 110, 5);
  rect(a-34, 58, 68, 3);
  rect(a-22, 30, 44, 2);
  rect(a-12, 10, 24, 2);
  arc(a, 10, 20, 20, PI, TWO_PI);
}
void structure()
{
  noFill();
  rect(a-31, 230, 15, 170);
  rect(a-8, 230, 15, 170);
  rect(a+15, 230, 15, 170);
  fill(0);
  //WINDOWS1//
  rect(a-26, 340, 5, 15);
  rect(a+20, 340, 5, 15);
  rect(a-3, 375, 5, 15);
  rect(a-3, 305, 5, 15);
  //WINDOWS2//
  rect(a-40, 210, 7, 7);
  rect(a-28, 210, 7, 7);
  rect(a-16, 210, 7, 7);
  rect(a-4, 210, 7, 7);
  rect(a+8, 210, 7, 7);
  rect(a+20, 210, 7, 7);
  rect(a+32, 210, 7, 7);
  //WINDOWS3//
  fill(150);
  rect(a-38, 160, 12, 30);
  rect(a-22, 160, 12, 30);
  rect(a-6, 160, 12, 30);
  rect(a+10, 160, 12, 30);
  rect(a+26, 160, 12, 30);
  //WINDOWS4//
  rect(a-20, 66, 10, 29);
  rect(a-5, 66, 10, 29);
  rect(a+10, 66, 10, 29);
  //WINDOWS5//
  rect(a-17, 35, 5, 20);
  rect(a-7, 35, 5, 20);
  rect(a+3, 35, 5, 20);
  rect(a+13, 35, 5, 20);
  //WINDOWS6//
  rect(a-7, 15, 3, 10);
  rect(a-1, 15, 3, 10);
  rect(a+5, 15, 3, 10);
}
void clock()
{
  //FACE//
  fill(255);
  ellipse(a, 255, 50, 50);
  fill(70, 175, 225);
  ellipse(a, 255, 35, 35);
  fill(175);
  ellipse(a, 255, 25, 25);
  strokeWeight(2);
  //MECHANICS//
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  //HANDS//
  stroke(0);
  strokeWeight(2);
  line(a, 255, a + cos(m) * 25, 255 + sin(m) * 25);
  strokeWeight(3);
  line(a, 255, a + cos(h) * 17.5, 255 + sin(h) * 17.5);
}
void facade()
{
  fill(70, 175, 225);
  //TOP//
  rect(a-250, 400, 500, 30);
  rect(a-255, 425, 510, 5);
  rect(a-250, 400, 90, 25);
  rect(a-255, 425, 100, 5);
  rect(a+155, 425, 100, 5);
  rect(a-75, 425, 40, 5);
  rect(a+35, 425, 40, 5);
  rect(a-250, 430, 90, 20);
  rect(a-160, 430, 410, 20);
  rect(a+160, 400, 90, 25);
  rect(a+60, 430, 100, 20);
  rect(a-70, 400, 30, 25);
  rect(a-67, 430, 25, 20);
  rect(a+40, 400, 30, 25);
  rect(a+43, 430, 25, 20);
  line(a-247, 510, a+240, 510);
  line(a-240, 480, a-167, 480);
  line(a+163, 480, a+233, 480);
  //COLUMNS//
  rect(a-61, 450, 7, 70);
  rect(a-54, 450, 7, 70);
  rect(a+49, 450, 7, 70);
  rect(a+56, 450, 7, 70);
  rect(a-247, 450, 7, 70);
  rect(a-240, 450, 7, 70);
  rect(a-177, 450, 7, 70);
  rect(a-170, 450, 7, 70);
  rect(a+163, 450, 7, 70);
  rect(a+170, 450, 7, 70);
  rect(a+233, 450, 7, 70);
  rect(a+240, 450, 7, 70);
  fill(175);
  rect(a-250, 520, 20, 30);
  rect(a-180, 520, 20, 30);
  rect(a-64, 520, 20, 30);
  rect(a+46, 520, 20, 30);
  rect(a+160, 520, 20, 30);
  rect(a+230, 520, 20, 30);
}
void windows()
{
  fill(0);
  //REGULAR WINDOWS//
  rect(a-227, 455, 10, 20);
  rect(a-210, 455, 10, 20);
  rect(a-193, 455, 10, 20);
  rect(a+183, 455, 10, 20);
  rect(a+200, 455, 10, 20);
  rect(a+217, 455, 10, 20);
  //ROUNDED WINDOWS//
  arc(a-113, 485, 85, 55, PI, TWO_PI);
  arc(a+2, 485, 85, 55, PI, TWO_PI);
  arc(a+113, 485, 85, 55, PI, TWO_PI);
  arc(a-205, 505, 40, 40, PI, TWO_PI);
  arc(a+205, 505, 40, 40, PI, TWO_PI);
  line(a-225, 505, a-185, 505);
  line(a+185, 505, a+225, 505);
  beginShape();
  vertex(a-156, 485);
  vertex(a-156, 500);
  vertex(a-71, 500);
  vertex(a-71, 485);
  endShape();
  beginShape();
  vertex(a-41, 485);
  vertex(a-41, 500);
  vertex(a+44, 500);
  vertex(a+44, 485);
  endShape();
  beginShape();
  vertex(a+70, 485);
  vertex(a+70, 500);
  vertex(a+155, 500);
  vertex(a+155, 485);
  endShape();
}
void market()
{
  line(a-400, 430, a-250, 430);
  line(a-400, 490, a-247, 490);
  line(a+250, 430, a+400, 430);
  line(a+247, 490, a+400, 490);
  //WINDOWS//
  fill(0);
  arc(a-265, 450, 20, 20, PI, TWO_PI);
  arc(a-295, 450, 20, 20, PI, TWO_PI);
  arc(a-325, 450, 20, 20, PI, TWO_PI);
  arc(a-355, 450, 20, 20, PI, TWO_PI);
  arc(a-385, 450, 20, 20, PI, TWO_PI);
  arc(a+265, 450, 20, 20, PI, TWO_PI);
  arc(a+295, 450, 20, 20, PI, TWO_PI);
  arc(a+325, 450, 20, 20, PI, TWO_PI);
  arc(a+355, 450, 20, 20, PI, TWO_PI);
  arc(a+385, 450, 20, 20, PI, TWO_PI);
  rect(a-395, 450, 20, 30);
  rect(a-365, 450, 20, 30);
  rect(a-335, 450, 20, 30);
  rect(a-305, 450, 20, 30);
  rect(a-275, 450, 20, 30);
  rect(a+255, 450, 20, 30);
  rect(a+285, 450, 20, 30);
  rect(a+315, 450, 20, 30);
  rect(a+345, 450, 20, 30);
  rect(a+375, 450, 20, 30);
  //ENRTYWAY//
  arc(a-325, 510, 20, 20, PI, TWO_PI);
  arc(a-355, 510, 20, 20, PI, TWO_PI);
  arc(a-385, 510, 20, 20, PI, TWO_PI);
  arc(a+265, 510, 20, 20, PI, TWO_PI);
  arc(a+295, 510, 20, 20, PI, TWO_PI);
  arc(a+325, 510, 20, 20, PI, TWO_PI);
  arc(a+355, 510, 20, 20, PI, TWO_PI);
  arc(a+385, 510, 20, 20, PI, TWO_PI);
  rect(a-395, 510, 20, 40);
  rect(a-365, 510, 20, 40);
  rect(a-335, 510, 20, 40);
  rect(a+255, 510, 20, 40);
  rect(a+285, 510, 20, 40);
  rect(a+315, 510, 20, 40);
  rect(a+345, 510, 20, 40);
  rect(a+375, 510, 20, 40);
  rect(a-305, 500, 50, 50);
  rect(a-225, 515, 40, 35);
  rect(a+185, 515, 40, 35);
  rect(a-156, 515, 87, 35);
  rect(a-40, 515, 82, 35);
  rect(a+70, 515, 86, 35);
}
void rain()
{
  fill(20, 180, 245);
  noStroke();
  int b=1;
  while (b<=500)
  {
    ellipse(int(random(801)), int(random(701)), 2, 8);
    b++;
  }
}
void lightning()
{
  float s=second();
  if((s>=5 && s<=5.0001) || (s>=15 && s<=15.0001)|| (s>=25 && s<=25.0001) || (s>=35 && s<=35.0001)|| (s>=45 && s<=45.0001) || (s>=55 && s<=55.0001))
 { 
  fill(255);
  stroke(255);
  rect(0,0,800,600);
 }
}

