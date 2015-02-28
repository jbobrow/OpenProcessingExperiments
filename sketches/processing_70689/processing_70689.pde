
//Marlo S, User Input, CP1 mods 14-15//
PImage img; 
//CONTROLS//
int a, b;
//METROID//
int c=10;
int d=15;
//NEWS//
int e=100;
int f=100;
//METROID//
int g=300;
int h=10;
//CRAZYHAND//
int i=0;
int j=0;
//?BOX//
int k=0;
int l=0;
//METROID//
int m=200;
int n=20;
//PACMAN GHOST//
int o=20;
int p=25;
//MASTERHAND//
int q=0;
int r=0;
//PACMAN GHOST//
int s=15;
int t=15;
//?BOX//
int u=0;
int v=0;
int w=5;
int x=5;
int y=0;
int z=0;
void setup() 
{
  size(800, 600);
  img = loadImage("SF.jpg");
  a=5;
  b=530;
}
void draw() 
{
  background(0);
  image(img, 0, 0);
  frameRate(13);
  smooth();
  ball();
  metroid();
  mysterybox();
  strokeWeight(1);
  ghost();
  crazyhand();
  masterhand();
  navi();
  news();
  live();
}
void news()
{
  fill(0);
  stroke(0);
  quad(0, 568, 700, 568, 700, 600, 0, 600);
  quad(0, 536, 700, 536, 700, 568, 0, 568);
  fill(245, 230, 67);
  textSize(20);
  //BOTTOM//
  text("CITY INVESTIGATES MYSTERIOUS PORTALS THAT APPEARED IN FRONT OF LOWELL HIGH SCHOOL.", e+7100, 590);
  text("ANNOYING ORANGE MAKES TV DEBUT ON CARTOON NETWORK.", e+6350, 590); 
  text("GHIRAHIM AWARDED MOST FABULOUS PERSON OF THE CENTURY TROPHY.", e+5600, 590);
  text("RAYQUAZA STOPS BATTLE BETWEEN GROUDON AND KYORGE.", e+4930, 590);
  text("HAL 9000 MAKES GUEST APPEARANCE IN THE EPIC RAP BATTLES OF HISTORY.", e+4100, 590);
  text("DR. OCTAGONAPUS IS BANISHED FROM THE COUNCIL OF SHOOP.", e+3390, 590);
  text("STUDY SHOW 95% OF PEOPLE DISLIKE MASS EFFECT 3'S ENDINGS.", e+2670, 590);
  text("CREEPERS DESTORY HALF OF THE MINECRAFT UNIVERSE.", e+2050, 590);
  text("YOSHI RESCUES THE KIDNAPPED STAR CHILDREN.", e+1530, 590); 
  text("BART SIMPSON KIDNAPPED BY STRANGE LIGHT.", e+1020, 590); 
  text("ROBOTS ARE ON A RAMPAGE IN BIKINI BOTTOM.", e+520, 590); 
  text("PLANTS USED TO DEFEND HOUSE FROM ZOMBIES.", e, 590);
  //TOP//
  text("CHRIS GRIFFIN WINS HOT DOG EATING CONTEST.", f+200, 563);
  text("CLINT EASTWOOD TALKS TO CHAIR AT RNC.", f+750, 563);
  text("STUDY SHOWS 80% OF STATISTICS ARE MADE UP.", f+1250, 563);
  text("CSI:MIAMI CANCELLED.", f+1800, 563);
  text("POLL REVEALS LOWELL HIGH SCHOOL HAS THE MOST SLEEP-DEPRIVED STUDENTS IN THE CITY.", f+2050, 563);
  text("CURIOUSITY ROVER BRINGS MICROBES TO MARS.", f+3050, 563);
  text("MANY AMERICANS IGNORE READING MOVING TEXT.", f+3550, 563);
  text("TEACHER FIRED AFTER BEING TOO DISAPPOINTED WITH HIS CLASSES.", f+4100, 563);
  text("THE NEWS ON THE BOTTOM IS SLOWER THAN THE NEWS ON THE TOP.", f+4850, 563);
  text("REPORT SHOWS PRESSING RED BUTTONS RESULTS IN DISASTER.", f+5600, 563);
  text("RED:10 BLUE:11", f+6300, 563);
  text("SCIENTISTS DISCOVER HOW MAGNETS WORK.", f+6500, 563);
  text("NYAN CAT LEAVES A DOUBLE RAINBOW ALL THE WAY INTO SPACE.", f+7000, 563);
  text("SUPRISINGLY MOST OF THIS IS TRUE.", f+7750, 563);
  text("LOCAL STUDENTS COMPLAIN OF HALLWAY TRAFFIC JAMS.", f+8150, 563);
  text("AIRFORCE REQUIRES ALL PLANES TO DO A BARRELROLL AND PRESSING A TO SHOOT.", f+11880, 563);
  text("TABUU MERGES ALL THE WORLDS.", f+11500, 563);
  text("ALL HAIL THE MIGHTY HYPNOTOAD.", f+11100, 563);
  text("HATERS GONNA HATE.", f+10800, 563);
  text("TOM CRUISE LOCKED HIMSELF IN A CLOSET.", f+10300, 563);
  text("IF YOU TRY TO READ THIS YOU'RE GOING TO HAVE A BAD TIME.", f+9600, 563); 
  text("THE AMOUNT OF NEWS IS TOO DAMN HIGH.", f+9100, 563); 
  text("STUDY SHOW THE CAKE IS A LIE.", f+8750, 563);
  e=e-7;
  f=f-11;
  if (e<-5000)
    if (f<-14000)
    {
      e=800;
      f=800;
    }
  fill(255, 0, 0);
  stroke(255, 0, 0);
  quad(700, 536, 800, 536, 800, 600, 700, 600);
  fill(10, 255, 100);
  text("LOL NEWS", 701, 555);
  text("CHANNEL", 703, 580);
  textSize(12);
  text("SAN FRANCISCO", 705, 595);
}
void live()
{
  fill(0, 0, 255);
  stroke(0, 0, 255);
  quad(0, 0, 60, 0, 60, 30, 0, 30);
  fill(255);
  textSize(20);
  text("LIVE", 10, 23);
}  
void ball()
{
  fill(255);
  stroke(255);
  ellipse(a, b, 15, 15);
}
void keyPressed()
{
  if (key == 'd'|| key =='D')
  {
    a=a+10;
    if (a>795)
    {
      a=795;
    }
  }
  if (key == 's'|| key =='S')
  {
    b=b+10;
    if (b>530)
    {
      b=530;
    }
  }
  if (key == 'w'|| key =='W')
  {
    b=b-10;
    if (b<5)
    {
      b=5;
    }
  }
  if (key == 'a'|| key =='A')
  {
    a=a-10;
    if (a<5)
    {
      a=5;
    }
  }
}
void navi()
{
  if (key == 'h' || key =='H')
  {
    fill(140, 177, 193);
    stroke(140, 177, 193);
    triangle(40, 495, 20, 450, 20, 475);
    triangle(60, 500, 120, 480, 95, 500);
    triangle(40, 510, 20, 510, 35, 520);
    triangle(55, 510, 75, 525, 60, 525);
    stroke(82, 162, 198);
    fill(82, 162, 198);
    ellipse(50, 500, 30, 30);
    stroke(20, 175, 245);
    fill(20, 175, 245);
    ellipse(50, 500, 25, 25);
    fill(255);
    stroke(255);
    ellipse(50, 500, 20, 20);
    triangle(70, 480, 80, 400, 120, 400);
    ellipse(100, 410, 150, 90);
    fill(0);
    textSize(13);
    text("HEY! LISTEN!", 65, 390);
    text("A - LEFT  D - RIGHT", 35, 410);
    text("W - UP  S - DOWN", 45, 430);
  }
}
void metroid()
{
  //TOP//
  fill(27, 219, 208, 155);
  stroke(27, 219, 208, 155);
  ellipse(c, 90, 75, 60);
  fill(10, 88, 31, 155);
  stroke(10, 88, 31, 155);
  ellipse(c, 90, 65, 50);
  fill(124, 10, 10, 155);
  stroke(124, 10, 10, 155);
  ellipse(c-10, 100, 20, 20);
  ellipse(c+10, 100, 20, 20);
  ellipse(c, 80, 20, 20);
  fill(255, 255, 255, 155);
  stroke(255, 255, 255, 155);
  beginShape();
  curveVertex(c-20, 110);
  curveVertex(c-20, 110);
  curveVertex(c-35, 120);
  curveVertex(c-25, 140);
  curveVertex(c-30, 125);
  curveVertex(c-10, 115);
  curveVertex(c-10, 115);
  endShape();
  beginShape();
  curveVertex(c+20, 110);
  curveVertex(c+20, 110);
  curveVertex(c+35, 120);
  curveVertex(c+25, 140);
  curveVertex(c+30, 125);
  curveVertex(c+10, 115);
  curveVertex(c+10, 115);
  endShape();
  triangle(c-10, 115, c-5, 130, c, 115);
  triangle(c, 115, c+5, 130, c+10, 115);
  //BOTTOM//
  fill(27, 219, 208, 155);
  stroke(27, 219, 208, 155);
  ellipse(g, 490, 75, 60);
  fill(10, 88, 31, 155);
  stroke(10, 88, 31, 155);
  ellipse(g, 490, 65, 50);
  fill(124, 10, 10, 155);
  stroke(124, 10, 10, 155);
  ellipse(g-10, 500, 20, 20);
  ellipse(g+10, 500, 20, 20);
  ellipse(g, 480, 20, 20);
  fill(255, 255, 255, 155);
  stroke(255, 255, 255, 155);
  beginShape();
  curveVertex(g-20, 510);
  curveVertex(g-20, 510);
  curveVertex(g-35, 520);
  curveVertex(g-25, 540);
  curveVertex(g-30, 525);
  curveVertex(g-10, 515);
  curveVertex(g-10, 515);
  endShape();
  beginShape();
  curveVertex(g+20, 510);
  curveVertex(g+20, 510);
  curveVertex(g+35, 520);
  curveVertex(g+25, 540);
  curveVertex(g+30, 525);
  curveVertex(g+10, 515);
  curveVertex(g+10, 515);
  endShape();
  triangle(g-10, 515, g-5, 530, g, 515);
  triangle(g, 515, g+5, 530, g+10, 515);
  //MIDDLE//
  fill(27, 219, 208, 155);
  stroke(27, 219, 208, 155);
  ellipse(m, 290, 75, 60);
  fill(10, 88, 31, 155);
  stroke(10, 88, 31, 155);
  ellipse(m, 290, 65, 50);
  fill(124, 10, 10, 155);
  stroke(124, 10, 10, 155);
  ellipse(m-10, 300, 20, 20);
  ellipse(m+10, 300, 20, 20);
  ellipse(m, 280, 20, 20);
  fill(255, 255, 255, 155);
  stroke(255, 255, 255, 155);
  beginShape();
  curveVertex(m-20, 310);
  curveVertex(m-20, 310);
  curveVertex(m-35, 320);
  curveVertex(m-25, 340);
  curveVertex(m-30, 325);
  curveVertex(m-10, 315);
  curveVertex(m-10, 315);
  endShape();
  beginShape();
  curveVertex(m+20, 310);
  curveVertex(m+20, 310);
  curveVertex(m+35, 320);
  curveVertex(m+25, 340);
  curveVertex(m+30, 325);
  curveVertex(m+10, 315);
  curveVertex(m+10, 315);
  endShape();
  triangle(m-10, 315, m-5, 330, m, 315);
  triangle(m, 315, m+5, 330, m+10, 315);
  c=c+d;
  g=g+h;
  m=m+n;
  if (c>850)
  {
    d=d-10;
  }
  if (c<-50)
  {
    d=d+10;
  }
  if (g>850)
  {
    h=h-10;
  }
  if (g<-50)
  {
    h=h+10;
  }
  if (m>850)
  {
    n=n-10;
  }
  if (m<-50)
  {
    n=n+10;
  }
}
void crazyhand()
{
  if (mouseButton==LEFT)
  {
    fill(255);
    stroke(0);
    quad(q, 340, q-70, 340, q-70, 460, q, 460);
    quad(q, 400, q+100, 400, q+100, 430, q, 430);
    quad(q, 460, q+100, 460, q+100, 430, q, 430);
    quad(q, 370, q+100, 370, q+100, 400, q, 400);
    quad(q, 340, q+100, 340, q+100, 370, q, 370);
    quad(q, 320, q-25, 320, q-25, 420, q, 420);
    q=q+5;
    if (q>850)
    {
      q=-850;
    }
    if (q>-850)
    {
      q=q+15;
    }
  }
}
void masterhand()
{
  if (mouseButton==LEFT)
  {
    fill(255);
    stroke(0);
    quad(r, 140, r+170, 140, r+170, 260, r, 260);
    quad(r+100, 120, r+125, 120, r+125, 220, r+100, 220);
    quad(r, 200, r+100, 200, r+100, 230, r, 230);
    quad(r, 260, r+100, 260, r+100, 230, r, 230);
    quad(r, 170, r+100, 170, r+100, 200, r, 200);
    quad(r, 140, r+100, 140, r+100, 170, r, 170);
    r=r-10;
    if (r<850)
    {
      r=r-5;
    }
    if (r<-850)
    {
      r=850;
    }
  }
}
void mysterybox()
{
  //2ND BOX//
  fill(245, 250, 15, 175);
  strokeWeight(3);
  stroke(250, 203, 15, 175);
  rect(300, u, 50, 50);
  fill(255);
  textSize(50);
  text("?", 317, u+42);
  //1ST BOX//
  fill(245, 250, 15, 175);
  rect(100, k, 50, 50);
  fill(255);
  textSize(50);
  text("?", 117, k+42);
  //3RD BOX//
  fill(245, 250, 15, 175);
  rect(500, w, 50, 50);
  fill(255);
  textSize(50);
  text("?", 517, w+42);
  //4TH BOX//
  fill(245, 250, 15, 175);
  rect(700, y, 50, 50);
  fill(255);
  textSize(50);
  text("?", 717, y+42);
  k=k+l; 
  u=u+v;
  w=w+x;
  y=y+z;
  if (k>340)
  {
    l=l-10;
  }
  if (k<-10);
  {
    l=l+5;
  }
  if (u>340)
  {
    v=v-20;
  }
  if (u<-10);
  {
    v=v+10;
  }
  if (w>340)
  {
    x=x-20;
  }
  if (w<-10);
  {
    x=x+10;
  }
  if (y>340)
  {
    z=z-15;
  }
  if (y<-10);
  {
    z=z+10;
  }
}
void ghost()
{
  //RED//
  fill(255, 0, 0);
  stroke(255, 0, 0);
  beginShape();
  vertex(o-13, 20);
  vertex(o-13, 50);
  vertex(o-5, 60);
  vertex(o+2, 50);
  vertex(o+9, 60);
  vertex(o+16, 50);
  vertex(o+23, 60);
  vertex(o+30, 50);
  vertex(o+30, 20);
  endShape();
  ellipse(o+9, 17, 43, 43);
  fill(255);
  stroke(255);
  ellipse(o-3, 20, 15, 15);
  ellipse(o+20, 20, 15, 15);
  //CYAN//
  fill(0, 10, 250);
  stroke(0, 10, 250);
  ellipse(o-3, 20, 5, 5);
  ellipse(o+20, 20, 5, 5);
  fill(0, 239, 250);
  stroke(0, 239, 250);
  beginShape();
  vertex(p-13, 220);
  vertex(p-13, 250);
  vertex(p-5, 260);
  vertex(p+2, 250);
  vertex(p+9, 260);
  vertex(p+16, 250);
  vertex(p+23, 260);
  vertex(p+30, 250);
  vertex(p+30, 220);
  endShape();
  ellipse(p+9, 217, 43, 43);
  fill(255);
  stroke(255);
  ellipse(p-3, 220, 15, 15);
  ellipse(p+20, 220, 15, 15);
  fill(0, 10, 250);
  stroke(0, 10, 250);
  ellipse(p-3, 220, 5, 5);
  ellipse(p+20, 220, 5, 5);
  //PINK//
  fill(240, 191, 215);
  stroke(240, 191, 215);
  beginShape();
  vertex(s-13, 420);
  vertex(s-13, 450);
  vertex(s-5, 460);
  vertex(s+2, 450);
  vertex(s+9, 460);
  vertex(s+16, 450);
  vertex(s+23, 460);
  vertex(s+30, 450);
  vertex(s+30, 420);
  endShape();
  ellipse(s+9, 417, 43, 43);
  fill(255);
  stroke(255);
  ellipse(s-3, 420, 15, 15);
  ellipse(s+20, 420, 15, 15);
  fill(0, 10, 250);
  stroke(0, 10, 250);
  ellipse(s-3, 420, 5, 5);
  ellipse(s+20, 420, 5, 5);
  o=o+10;
  p=p+5;
  s=s-5;
  if (o>850)
  {
    o=-850;
  }
  if (o>-850)
  {
    o=o+5;
  }
  if (p>850)
  {
    p=-850;
  }
  if (p>-850)
  {
    p=p+15;
  } 
  if (s<850)
  {
    s=s-10;
  }
  if (s<-850)
  {
    s=850;
  }
}
/**
Breaking news! The skies over San Francisco have been invaded! <p>
Move the ball and avoid making any contact with the Metroids, the ghost, and ? boxes. <br>
Press "H" for the controls. <br>
Left-click to add Master Hand and Crazy Hand. <br>
Right-click to remove them. <br>
Note: This is a test version. Nothing happens when you make any contact and there's no scoring system or timer.
*/

