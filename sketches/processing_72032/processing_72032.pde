
import ddf.minim.*;
AudioPlayer player; 
Minim minim;
PImage img;
PImage img2;
int a=400;
int b=500;
int c=50;
int d=300;
int e=300;
int f=100;
int g=100;
int h=500;
int i=500;
int j=700;
int k=700;
int l=600;
int m=200;
int n=450;
int o=350;
int p=375;
void setup()
{
  size(800, 600);
  img=loadImage("Palace of Fine Arts.jpg");
  img2=loadImage("Bay Bridge.jpg");
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("Audio2.mp3", 2048);
  player.play();
}
void draw()
{ 
  background(0);
  int t= millis()/1000;
  if ((t<25) && (t>=10))
  {
    tint(50);
    image(img, 0, 0);
  }
  if (((t>=0) && (t<=10))||(t>=24) && (t<=26))
  {
    tint(255);
    image(img, 0, 0);
  }
  floor();
  robin();
  jennifer();
  blast();
  stage();
  narrator();
  //PART 2//
  if (t>=27)
  {
    background(70, 135, 255);
    image(img2, 0, 0, width, height-200);
    fill(120, 120, 125);
    strokeWeight(1);
    stroke(120, 120, 125);
    rect(0, 550, 800, 50);
    roof();
    base();
    structure();
    clock();
    strokeWeight(1);
    facade();
    windows();
    market();
    plasageist();
    trieyepod();
    int s=second();
    if (((s>=10) &&(s<16)) ||((s>=20) && (s<26)) || ((s>=30) &&(s<36))|| ((s>=40) &&(s<46)) || ((s>=50) &&(s<56))|| ((s>=60) &&(s<6)))
    {
      a=a+int(random(-2, 2));
    }
  }
} 
void stage()
{
  int t= millis()/1000;
  if (t>=0 && t<=26)
  {
    fill(0, 255, 0);
    stroke(175);
    strokeWeight(5);
    rect(50, 50, 300, 25);
    fill(255, 0, 0);
    rect(450, 50, 300, 25);
    stroke(255, 0, 0);
    strokeWeight(1);
    rect(200, 52, 147, 20);
    textSize(40);
    text("69", 375, 40);
    if (t>=0 && t<=26)
    {
      fill(252, 245, 15);
      textSize(20);
      text("DARK JENNIFER", 55, 70);
      text("ROBIN ARCHER", 455, 70);
      textSize(30);
      text("3 WINS", 50, 40);
      text("2 WINS", 630, 40);
    }
  }
}
void floor()
{
  int t= millis()/1000;
  if (t>=0 && t<=26)
  {
    fill(25, 155, 55);
    stroke(25, 155, 55);
    rect(0, 530, 800, 70);
  }
}
void narrator()
{
  int t= millis()/1000;
  if (t<3)
  {
    fill(255, 0, 0);
    textSize(50);
    text("FINISH HIM!", 260, 190);
  }
  if ((t>23) && (26>=t))
  {
    fill(255);
    textSize(30);
    text("DARK JENNIFER WINS!", 250, 130);
    fill(255, 0, 0);
    textSize(40);
    text("FATALITY!", 305, 180);
  }
}
void robin()
{
  int t= millis()/1000;
  if (t>=0 && t<=22)
  {
    //BOW//
    stroke(50, 25, 15);
    strokeWeight(5);
    line(l-5, 450, l-5, 400);
    //BAG//
    fill(95, 65, 45);
    stroke(95, 65, 45);
    rect(l-10, 420, 28, 70);
    noFill();
    stroke(0);
    ellipse(l+5, 370, 60, 60);
    line(l+5, 400, l+05, 490);
    line(l+5, 490, l-15, 590);
    line(l+5, 490, l+15, 590);
    line(l+5, 430, l-15, 490);
    line(l+5, 430, l+20, 490);
    stroke(0, 255, 0);
    fill(0, 255, 0);
    triangle(l-25, 360, l+35, 360, l+5, 320);
    //ARROW//
    stroke(170);
    line(l+10, 520, l+40, 430);
    stroke(255, 0, 0);
    line(l+5, 340, l+20, 320);
    fill(255, 0, 0);
    triangle(l+40, 430, l+33, 435, l+40, 440);

    if (t<=22)
    {
      l=l+int(random(-2, 2));
      if (l<600)
      {
        l=l+int(random(0, 2));
      }
      if (l>610);
      {
        l=l+int(random(-2, 0));
      }
    }
  }
}
void jennifer()
{
  strokeWeight(1);
  stroke(0);
  //LEFT LEG//
  fill(0);
  beginShape();
  vertex(m+5, 490);
  vertex(m+20, 530);
  vertex(m+20, 535);
  vertex(m+40, 535);
  vertex(m+40, 530);
  vertex(m+25, 490);
  endShape();
  stroke(50);
  fill(50);
  beginShape();
  vertex(m+20, 535);
  vertex(m+25, 590);
  vertex(m+30, 590);
  vertex(m+30, 580);
  vertex(m+35, 590);
  vertex(m+45, 590);
  vertex(m+40, 530);
  vertex(m+40, 535);
  endShape();
  arc(m+45, 590, 20, 20, PI, TWO_PI);
  line(m+45, 590, m+55, 590);
  //LEFT ARM//
  fill(250, 193, 140);
  stroke(250, 193, 140);
  ellipse(m+60, 458, 20, 20);
  fill(80);
  stroke(80);
  beginShape();
  vertex(m-15, 390);
  vertex(m+15, 440);
  vertex(m+60, 470);
  vertex(m+60, 445);
  vertex(m+27, 415);
  vertex(m+7, 390);
  endShape();
  //HEAD & BODY//
  fill(20);
  stroke(20);
  rect(m-15, 390, 30, 100);
  ellipse(m+15, 410, 20, 35);
  rect(m-15, 420, 37, 70);
  fill(250, 193, 140);
  stroke(250, 193, 140);
  ellipse(m+5, 355, 50, 70);
  fill(0);
  stroke(0);
  arc(m+5, 345, 50, 70, PI, TWO_PI);
  rect(m-20, 345, 20, 50);
  //RIGHT LEG//
  stroke(0);
  beginShape();
  vertex(m-15, 490);
  vertex(m-20, 530);
  vertex(m-22, 540);
  vertex(m-2, 540);
  vertex(m, 530);
  vertex(m+5, 490);
  endShape();
  stroke(50);
  fill(50);
  beginShape();
  vertex(m-22, 535);
  vertex(m-30, 590);
  vertex(m-25, 590);
  vertex(m-22, 580);
  vertex(m-18, 590);
  vertex(m-7, 590);
  vertex(m-1, 535);
  endShape();
  arc(m-7, 590, 20, 20, PI, TWO_PI);
  line(m-7, 590, m+3, 590);
  //RIGHT ARM//
  fill(250, 193, 140);
  ellipse(m+60, 465, 20, 20);
  fill(80);
  stroke(230);
  beginShape();
  vertex(m-15, 400);
  vertex(m+15, 440);
  vertex(m+60, 480);
  vertex(m+60, 455);
  vertex(m+27, 425);
  vertex(m+7, 400);
  vertex(m-15, 400);
  endShape();
  stroke(0);
  strokeWeight(3);
  line(m-4, 401, m+20, 430);
  line(m+20, 430, m+57, 464);
  strokeWeight(1);
  fill(255);
  stroke(0);
  triangle(m-8, 400, m, 400, m-4, 390);
  //SKIRT//
  fill(80);
  stroke(80);
  strokeWeight(1);
  quad(m-15, 465, m-19, 515, m+35, 515, m+22, 465);
  //BELTS//
  fill(10, 60, 15);
  stroke(10, 60, 15);
  rect(m-15, 460, 37, 8);
  rect(m+22, 457, 3, 11);
  //FACE//
  fill(255);
  stroke(0);
  ellipse(m+20, 355, 10, 5);
  strokeWeight(3);
  line(m+15, 352, m, 352);
  fill(0, 0, 0, 200);
  strokeWeight(1);
  rect(m+15, 350, 15, 8);
  strokeWeight(4);
  point(m+24, 355);
  strokeWeight(1);
  line(m+20, 375, m+26, 375);
  //CAPE//
  fill(0);
  stroke(0);
  triangle(m-15, 397, m-30, 510, m-15, 510);
  m=m-1;
  int t= millis()/1000;
  if (t<4)
  {
    m=200;
  }
  if (t>=4)
  {
    if (m<35)
    {
      m=35;
    }
  }
  if (t>=27)
  {
    m=-100;
  }
  if ((t<=10) && (t>=7))
  {
    m=m+int(random(-4, 4));
  }
}
void blast()
{
  int t= millis()/1000;
  if (t>=12 && t<=22)
  {
    fill(0);
    stroke(0);
    ellipse(150, n, 30, 30);
    n=n+int(random(-3, 3));
    ellipse(150, o, 30, 30);
    o=o+int(random(-3, 3));
    if (n<=425)
    {
      n=425;
    }
    if (n<=450)
    {
      n=450;
    }
    if (o<=300)
    {
      o=300;
    }
    if (o<=325)
    {
      o=325;
    }
    if (t>=17)
    {
      strokeWeight(10);
      line(150, n, 250, p);
      line(150, o, 250, p);
      ellipse(250, p, 50, 50);
      p=p+int(random(-2, 2));
      if (p<=365)
      {
        p=365;
      }
      if (p<=395)
      {
        p=395;
      }
      if (t>=20)
      {
        quad(250, p+5, 250, p-5, 800, 150, 800, 800);
      }
    }
  }
}
//PART 2//
void roof()
{
  fill(150);
  stroke(0);
  rect(a-800, 395, 555, 10);
  rect(a-250, 390, 500, 10);
  rect(a+250, 395, 550, 10);
  rect(a-155, 380, 310, 10);
  rect(a+445, 380, 200, 15);
  rect(a-640, 380, 195, 15);
}
void base()
{
  fill(70, 175, 225);
  //BASE//
  rect(a-250, 400, 500, 150);
  stroke(0);
  rect(a-800, 405, 555, 145);
  rect(a+245, 405, 555, 145);
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
  fill(255);
  ellipse(a, 255, 50, 50);
  fill(70, 175, 225);
  ellipse(a, 255, 35, 35);
  fill(175);
  ellipse(a, 255, 25, 25);
  strokeWeight(2);
  line(a, 255, a+15, 264);
  line(a, 255, a+10, 233);
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
  line(a-800, 430, a-250, 430);
  line(a-800, 490, a-247, 490);
  line(a+250, 430, a+800, 430);
  line(a+247, 490, a+800, 490);
  //WINDOWS//
  fill(0);
  arc(a-265, 450, 20, 20, PI, TWO_PI);
  arc(a-295, 450, 20, 20, PI, TWO_PI);
  arc(a-325, 450, 20, 20, PI, TWO_PI);
  arc(a-355, 450, 20, 20, PI, TWO_PI);
  arc(a-385, 450, 20, 20, PI, TWO_PI);
  arc(a-415, 450, 20, 20, PI, TWO_PI);
  arc(a-445, 450, 20, 20, PI, TWO_PI);
  arc(a-475, 450, 20, 20, PI, TWO_PI);
  arc(a-505, 450, 20, 20, PI, TWO_PI);
  arc(a-535, 450, 20, 20, PI, TWO_PI);
  arc(a-565, 450, 20, 20, PI, TWO_PI);
  arc(a-595, 450, 20, 20, PI, TWO_PI);
  arc(a-625, 450, 20, 20, PI, TWO_PI);
  arc(a-655, 450, 20, 20, PI, TWO_PI);
  arc(a-685, 450, 20, 20, PI, TWO_PI);
  arc(a-715, 450, 20, 20, PI, TWO_PI);
  arc(a-745, 450, 20, 20, PI, TWO_PI);
  arc(a-775, 450, 20, 20, PI, TWO_PI);
  arc(a+265, 450, 20, 20, PI, TWO_PI);
  arc(a+295, 450, 20, 20, PI, TWO_PI);
  arc(a+325, 450, 20, 20, PI, TWO_PI);
  arc(a+355, 450, 20, 20, PI, TWO_PI);
  arc(a+385, 450, 20, 20, PI, TWO_PI);
  arc(a+415, 450, 20, 20, PI, TWO_PI);
  arc(a+445, 450, 20, 20, PI, TWO_PI);
  arc(a+475, 450, 20, 20, PI, TWO_PI);
  arc(a+505, 450, 20, 20, PI, TWO_PI);
  arc(a+535, 450, 20, 20, PI, TWO_PI);
  arc(a+565, 450, 20, 20, PI, TWO_PI);
  arc(a+595, 450, 20, 20, PI, TWO_PI);
  arc(a+625, 450, 20, 20, PI, TWO_PI);
  arc(a+655, 450, 20, 20, PI, TWO_PI);
  arc(a+685, 450, 20, 20, PI, TWO_PI);
  arc(a+715, 450, 20, 20, PI, TWO_PI);
  arc(a+745, 450, 20, 20, PI, TWO_PI);
  arc(a+775, 450, 20, 20, PI, TWO_PI);
  rect(a-785, 450, 20, 30);
  rect(a-755, 450, 20, 30);
  rect(a-725, 450, 20, 30);
  rect(a-695, 450, 20, 30);
  rect(a-665, 450, 20, 30);
  rect(a-635, 450, 20, 30);
  rect(a-605, 450, 20, 30);
  rect(a-575, 450, 20, 30);
  rect(a-545, 450, 20, 30);
  rect(a-515, 450, 20, 30);
  rect(a-485, 450, 20, 30);
  rect(a-455, 450, 20, 30);
  rect(a-425, 450, 20, 30);
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
  rect(a+405, 450, 20, 30);
  rect(a+435, 450, 20, 30);
  rect(a+465, 450, 20, 30);
  rect(a+495, 450, 20, 30);
  rect(a+525, 450, 20, 30);
  rect(a+555, 450, 20, 30);
  rect(a+585, 450, 20, 30);
  rect(a+615, 450, 20, 30);
  rect(a+645, 450, 20, 30);
  rect(a+675, 450, 20, 30);
  rect(a+705, 450, 20, 30);
  rect(a+735, 450, 20, 30);
  rect(a+765, 450, 20, 30);
  //ENRTYWAY//
  arc(a-325, 510, 20, 20, PI, TWO_PI);
  arc(a-355, 510, 20, 20, PI, TWO_PI);
  arc(a-385, 510, 20, 20, PI, TWO_PI);
  arc(a-415, 510, 20, 20, PI, TWO_PI);
  arc(a-445, 510, 20, 20, PI, TWO_PI);
  arc(a-475, 510, 20, 20, PI, TWO_PI);
  arc(a-505, 510, 20, 20, PI, TWO_PI);
  arc(a-535, 510, 20, 20, PI, TWO_PI);
  arc(a-625, 510, 20, 20, PI, TWO_PI);
  arc(a-655, 510, 20, 20, PI, TWO_PI);
  arc(a-685, 510, 20, 20, PI, TWO_PI);
  arc(a-715, 510, 20, 20, PI, TWO_PI);
  arc(a-745, 510, 20, 20, PI, TWO_PI);
  arc(a-775, 510, 20, 20, PI, TWO_PI);
  arc(a+265, 510, 20, 20, PI, TWO_PI);
  arc(a+295, 510, 20, 20, PI, TWO_PI);
  arc(a+325, 510, 20, 20, PI, TWO_PI);
  arc(a+355, 510, 20, 20, PI, TWO_PI);
  arc(a+385, 510, 20, 20, PI, TWO_PI);
  arc(a+415, 510, 20, 20, PI, TWO_PI);
  arc(a+445, 510, 20, 20, PI, TWO_PI);
  arc(a+475, 510, 20, 20, PI, TWO_PI);
  arc(a+505, 510, 20, 20, PI, TWO_PI);
  arc(a+535, 510, 20, 20, PI, TWO_PI);
  arc(a+625, 510, 20, 20, PI, TWO_PI);
  arc(a+655, 510, 20, 20, PI, TWO_PI);
  arc(a+685, 510, 20, 20, PI, TWO_PI);
  arc(a+715, 510, 20, 20, PI, TWO_PI);
  arc(a+745, 510, 20, 20, PI, TWO_PI);
  arc(a+775, 510, 20, 20, PI, TWO_PI);
  rect(a-785, 510, 20, 40);
  rect(a-755, 510, 20, 40);
  rect(a-725, 510, 20, 40);
  rect(a-695, 510, 20, 40);
  rect(a-665, 510, 20, 40);
  rect(a-635, 510, 20, 40);
  rect(a-545, 510, 20, 40);
  rect(a-515, 510, 20, 40);
  rect(a-485, 510, 20, 40);
  rect(a-455, 510, 20, 40);
  rect(a-425, 510, 20, 40);
  rect(a-395, 510, 20, 40);
  rect(a-365, 510, 20, 40);
  rect(a-335, 510, 20, 40);
  rect(a+255, 510, 20, 40);
  rect(a+285, 510, 20, 40);
  rect(a+315, 510, 20, 40);
  rect(a+345, 510, 20, 40);
  rect(a+375, 510, 20, 40);
  rect(a+405, 510, 20, 40);
  rect(a+435, 510, 20, 40);
  rect(a+465, 510, 20, 40);
  rect(a+495, 510, 20, 40);
  rect(a+525, 510, 20, 40);
  rect(a+615, 510, 20, 40);
  rect(a+645, 510, 20, 40);
  rect(a+675, 510, 20, 40);
  rect(a+705, 510, 20, 40);
  rect(a+735, 510, 20, 40);
  rect(a+765, 510, 20, 40);
  rect(a-305, 500, 50, 50);
  rect(a-605, 500, 50, 50);
  rect(a+555, 500, 50, 50);
  rect(a-225, 515, 40, 35);
  rect(a+185, 515, 40, 35);
  rect(a-156, 515, 87, 35);
  rect(a-40, 515, 82, 35);
  rect(a+70, 515, 86, 35);
}
void plasageist()
{
  fill(20, 225, 255);
  stroke(20, 225, 255);
  ellipse(b, c-10, 50, 30);
  triangle(b-6, c+5, b+5, c+5, b, c+20);
  triangle(b-25, c-10, b-15, c+30, b-20, c-10);
  triangle(b+25, c-10, b+15, c+30, b+20, c-10);
  fill(0);
  stroke(0);
  ellipse(b, c-10, 45, 25);
  fill(255, 0, 0);
  ellipse(b, c-15, 8, 8);
  triangle(b-16, c-12, b-1, c-6, b-11, c-5);
  triangle(b+1, c-4, b+11, c-5, b+16, c-12);
  strokeWeight(3);
  point(b, c-15);
  b=b+int(random(-11, 11));
  c=c+int(random(-11, 11));
  if (b<-11)
  {
    b=810;
  }
  if (b>811)
  {
    b=-10;
  }
  if (c<-1)
  {
    c=0;
  }
  if (c>501)
  {
    c=500;
  }
}
void trieyepod()
{
  //HORNS//
  strokeWeight(1);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  triangle(d-5, e-5, d, e-55, d+5, e-5);
  triangle(d-10, e+5, d, e+30, d+10, e+5);
  triangle(d-35, e, d-15, e-30, d-25, e);
  triangle(d-35, e, d-15, e+30, d-25, e);
  triangle(d+35, e, d+15, e+30, d+25, e);
  triangle(d+35, e, d+15, e-30, d+25, e);
  //BODY//
  stroke(0);
  fill(235, 200, 165);
  ellipse(d+25, e, 20, 20);
  ellipse(d-25, e, 20, 20);
  ellipse(d, e, 45, 25);
  //EYES//
  fill(255);
  ellipse(d, e, 30, 15);
  ellipse(d, e, 15, 15);
  ellipse(d-30, e, 8, 8);
  ellipse(d+30, e, 8, 8);
  fill(0);
  ellipse(d, e, 5, 5);
  strokeWeight(3);
  point(d-31, e);
  point(d+31, e);
  //CLONE1//
  //HORNS//
  strokeWeight(1);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  triangle(f-5, g-5, f, g-55, f+5, g-5);
  triangle(f-10, g+5, f, g+30, f+10, g+5);
  triangle(f-35, g, f-15, g-30, f-25, g);
  triangle(f-35, g, f-15, g+30, f-25, g);
  triangle(f+35, g, f+15, g+30, f+25, g);
  triangle(f+35, g, f+15, g-30, f+25, g);
  //BODY//
  stroke(0);
  fill(235, 200, 165);
  ellipse(f+25, g, 20, 20);
  ellipse(f-25, g, 20, 20);
  ellipse(f, g, 45, 25);
  //EYES//
  fill(255);
  ellipse(f, g, 30, 15);
  ellipse(f, g, 15, 15);
  ellipse(f-30, g, 8, 8);
  ellipse(f+30, g, 8, 8);
  fill(0);
  ellipse(f, g, 5, 5);
  strokeWeight(3);
  point(f-31, g);
  point(f+31, g);
  //CLONE2//
  //HORNS//
  strokeWeight(1);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  triangle(h-5, i-5, h, i-55, h+5, i-5);
  triangle(h-10, i+5, h, i+30, h+10, i+5);
  triangle(h-35, i, h-15, i-30, h-25, i);
  triangle(h-35, i, h-15, i+30, h-25, i);
  triangle(h+35, i, h+15, i+30, h+25, i);
  triangle(h+35, i, h+15, i-30, h+25, i);
  //BODY//
  stroke(0);
  fill(235, 200, 165);
  ellipse(h+25, i, 20, 20);
  ellipse(h-25, i, 20, 20);
  ellipse(h, i, 45, 25);
  //EYES//
  fill(255);
  ellipse(h, i, 30, 15);
  ellipse(h, i, 15, 15);
  ellipse(h-30, i, 8, 8);
  ellipse(h+30, i, 8, 8);
  fill(0);
  ellipse(h, i, 5, 5);
  strokeWeight(3);
  point(h-31, i);
  point(h+31, i);
  //CLONE3//
  //HORNS//
  strokeWeight(1);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  triangle(j-5, k-5, j, k-55, j+5, k-5);
  triangle(j-10, k+5, j, k+30, j+10, k+5);
  triangle(j-35, k, j-15, k-30, j-25, k);
  triangle(j-35, k, j-15, k+30, j-25, k);
  triangle(j+35, k, j+15, k+30, j+25, k);
  triangle(j+35, k, j+15, k-30, j+25, k);
  //BODY//
  stroke(0);
  fill(235, 200, 165);
  ellipse(j+25, k, 20, 20);
  ellipse(j-25, k, 20, 20);
  ellipse(j, k, 45, 25);
  //EYES//
  fill(255);
  ellipse(j, k, 30, 15);
  ellipse(j, k, 15, 15);
  ellipse(j-30, k, 8, 8);
  ellipse(j+30, k, 8, 8);
  fill(0);
  ellipse(j, k, 5, 5);
  strokeWeight(3);
  point(j-31, k);
  point(j+31, k);
  d=d+int(random(-6, 6));
  e=e+int(random(-6, 6));
  f=f+int(random(-6, 6));
  g=g+int(random(-6, 6));
  h=h+int(random(-6, 6));
  i=i+int(random(-6, 6));
  j=j+int(random(-6, 6));
  k=k+int(random(-6, 6));
  if (d<-11)
  {
    d=810;
  }
  if (d>811)
  {
    d=-10;
  }
  if (e<-1)
  {
    e=0;
  }
  if (e>501)
  {
    e=500;
  }
  if (f<-11)
  {
    f=810;
  }
  if (f>811)
  {
    f=-10;
  }
  if (g<-1)
  {
    g=0;
  }
  if (g>501)
  {
    g=500;
  }
  if (h<-11)
  {
    h=810;
  }
  if (h>811)
  {
    h=-10;
  }
  if (i<-1)
  {
    i=0;
  }
  if (i>501)
  {
    i=500;
  }
  if (j<-11)
  {
    j=810;
  }
  if (j>811)
  {
    j=-10;
  }
  if (k<-1)
  {
    k=0;
  }
  if (k>501)
  {
    k=500;
  }
} 
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}


