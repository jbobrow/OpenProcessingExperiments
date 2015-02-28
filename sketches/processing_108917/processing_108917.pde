
/*
 * Jessica Roberts
 * jroberts73
 * Sewing Game
 */

void setup() 
{
  size(600,600);
  smooth();
  noCursor();
  current = thread3;
}

color backgroundColor = color(175);
color thread1 = color(57, 183, 255); //aqua
color thread2 = color(255, 222, 0); //yellow
color thread3 = color(255, 107, 192); //pink
color thread4 = color(255,157,0); //orange
color thread5 = color(135,217,0);//green
color thread6 = color(165,57,233); //purple
color needleColor = color(202,202,202);
color current;
ArrayList threadList = new ArrayList();
ArrayList buttonList = new ArrayList();
PVector p1;
PVector p2 = new PVector(200,200);

/*
 * === Main Draw Method ===
 */
void draw() 
{
  drawBackground();
  drawColorMenu();
  
  //draw the threads
  for(int i = 0; i<threadList.size()-1; i+=2) {
    Threads t = (Threads)threadList.get(i);
    stroke(t.getColor());
    line(t.getX1(), t.getY1(), t.getX2(), t.getY2());
    line(t.getX1()+1, t.getY1()+1, t.getX2()+1, t.getY2()+1);
  }
  
  //Determine if choosing a color
  if(mousePressed)
  { 
    if(mouseX > 28 && mouseX<72 && mouseY>517 && mouseY<585)
      current = thread3;
    else if (mouseX>91 && mouseX<127 && mouseY>517 && mouseY<585)
      current = thread4;
    else if (mouseX>147 && mouseX<191 && mouseY>517 && mouseY<585)
      current = thread2;
    else if (mouseX>211 && mouseX<250 && mouseY>517 && mouseY<585)
      current = thread5;
    else if (mouseX>271 && mouseX<310 && mouseY>517 && mouseY<585)
      current = thread1;
    else if (mouseX>331 && mouseX<370 && mouseY>517 && mouseY<585)
      current = thread6;
  }
  
  //reset
   if(keyPressed)
  {
    if(key == ' '){
      threadList.clear();
    }
  }

  drawNeedle();
}//end Draw


void mouseDragged()
{
  if (mouseX >15 && mouseX<573 && mouseY>20 && mouseY<480)
  {
    threadList.add(new Threads(pmouseX, pmouseY, mouseX, mouseY, current));
  }
}

/*
 * === Background Creator ===
 */
void drawBackground() 
{
  background(backgroundColor);
  fill(20,20,20);
  stroke(175);
  quad(10,40,589,14,570,500,6,526);
  fill(238, 183, 255);
  noStroke();
  rect(15,20,560,495);
  fill(250,170,255);
  for(int i=15; i<570;i+=5)
    rect(i,20,1,495);
  for(int i=25; i<515;i+=5)
    rect(15,i,560,1);
}//end drawBackground



/*
 * === Needle Creator ===
 */
void drawNeedle() 
{
  fill(needleColor);
  stroke(0,0,0);
  triangle(mouseX+100,mouseY-100,mouseX, mouseY, mouseX+110, mouseY-95);
  fill(0,0,0);
  ellipse(mouseX+98, mouseY-91, 6,7);
  noFill();
  stroke(current);
  arc(mouseX+100,mouseY-145,200,100,0,HALF_PI);
  arc(mouseX+101,mouseY-146,200,100,0,HALF_PI);
}//end drawNeedle




/*
 * === Color Menu Creator ===
 */
void drawColorMenu() 
{
  stroke(0,0,0);
  
  //Bobbin 1
  fill(128,128,128);
  ellipse(50,575,50,25);
  fill(thread3);
  for(int i=0; i<50; i+=5) {
    ellipse(50, 570-i, 39,25);
  }
  fill(128,128,128);
  ellipse(50,525,50,25);
  fill(0,0,0);
  ellipse(50,525,10,5);
  
  //Bobbin 2
  fill(128,128,128);
  ellipse(110,575,50,25);
  fill(thread4);
  for(int i=0; i<50; i+=5) {
    ellipse(110, 570-i, 39,25);
  }
  fill(128,128,128);
  ellipse(110,525,50,25);
  fill(0,0,0);
  ellipse(110,525,10,5);
  
  //Bobbin 3
  fill(128,128,128);
  ellipse(170,575,50,25);
  fill(thread2);
  for(int i=0; i<50; i+=5) {
    ellipse(170, 570-i, 39,25);
  }
  fill(128,128,128);
  ellipse(170,525,50,25);
  fill(0,0,0);
  ellipse(170,525,10,5);
  
  //Bobbin 4
  fill(128,128,128);
  ellipse(230,575,50,25);
  fill(thread5);
  for(int i=0; i<50; i+=5) {
    ellipse(230, 570-i, 39,25);
  }
  fill(128,128,128);
  ellipse(230,525,50,25);
  fill(0,0,0);
  ellipse(230,525,10,5);
  
  //Bobbin 5
  fill(128,128,128);
  ellipse(290,575,50,25);
  fill(thread1);
  for(int i=0; i<50; i+=5) {
    ellipse(290, 570-i, 39,25);
  }
  fill(128,128,128);
  ellipse(290,525,50,25);
  fill(0,0,0);
  ellipse(290,525,10,5);
  
  //Bobbin 6
  fill(128,128,128);
  ellipse(350,575,50,25);
  fill(thread6);
  for(int i=0; i<50; i+=5) {
    ellipse(350, 570-i, 39,25);
  }
  fill(128,128,128);
  ellipse(350,525,50,25);
  fill(0,0,0);
  ellipse(350,525,10,5);
  
  fill(50,50,50);
  stroke(50,50,50);
  ellipse(450,570,100,20);
  
  fill(255,0,0);
  stroke(0,0,0);
  ellipse(485,525,125,100);
  
  //pin cushion
  stroke(20,20,20);
  fill(thread1);
  line(434,445,472,506);
  ellipse(434,445,7,7);
  fill(thread2);
  line(515,455,508,513);
  ellipse(515,455,7,7);
  fill(thread3);
  line(412,475,462,515);
  ellipse(412,475,7,7);
  fill(thread4);
  line(506,439,482,497);
  ellipse(506,439,7,7);
  fill(thread5);
  line(549,478,524,519);
  ellipse(549,478,7,7);
  
  String title = "Jessica's Sewing Game";
  textAlign(CENTER);
  fill(0,0,0);
  text(title,432,524,100,100);
  fill(255,255,255);
  text(title,433,523,100,100);
  
}//end drawColorMenu



/*
 * === Threads Class ===
 */
class Threads
{
  float x1, y1,x2,y2;
  color c;
  
  Threads(float x1, float y1, float x2, float y2, color c)
  {
    this.x1 = x1;
    this.y1=y1;
    this.x2=x2;
    this.y2=y2;
    this.c = c;
  }
  
  float getX1()
  {
    return x1;
  }
  
   float getY1()
  {
    return y1;
  }
  
   float getX2()
  {
    return x2;
  }
  
   float getY2()
  {
    return y2;
  }
  
  color getColor()
  {
    return c;
  }
}//end Threads class




