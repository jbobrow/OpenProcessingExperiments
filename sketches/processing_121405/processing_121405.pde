
  Me [] arrayMe = new Me [25]; 
  Me me1;
  Me me2;
  Me me3;
  Me me4;
  Me me5;
  Me me6;
  Me me7;
  Me me8;
  PVector apt = new PVector(450, 550);
  PVector dml = new PVector(150, 250);
  PVector lrc = new PVector(750, 250);
  PVector sci = new PVector(550, 150);
  PVector tcc = new PVector(350, 50);
 //COLORS
  color firstcolor = color(19, 6, 84);
  color secondcolor = color(40, 22, 130);
  color thirdcolor = color (46, 11, 222);
  color fourthcolor = color(11, 67, 222);
  color fifthcolor = color(11, 116, 222);
  color sixthcolor = color(11, 183, 222);
  // COUNTER
  boolean motionDone= false;
  int counter = 0;
  // TOTALS
  int [] diams= new int [10];
  int fill;
    
void setup()
{
  size(800,600);
  smooth();
  ellipse(apt.x, apt.y, 20, 20);
  ellipse(dml.x, dml.y, 20, 20);
  ellipse(lrc.x, lrc.y, 20, 20);
  ellipse(sci.x, sci.y, 20, 20);
  ellipse(tcc.x, tcc.y, 20, 20);
  // initialize people
  me1=new Me(apt, dml);
  me2=new Me(apt, sci);
  me3=new Me(lrc, dml);
  me4=new Me(sci, lrc);
  me5=new Me(apt, tcc);
  me6=new Me(tcc, lrc);
  me7=new Me(tcc, dml);
  me8=new Me(apt, lrc);
  PImage img;
  img = loadImage("CTIN_map.jpg");
  image(img, 0, 0);
  for (int i=0; i<diams.length; i++)
  {
    fill = int (random(5,15));
    diams[i]= fill;
    
  }
}

void draw() {
  counter++; 
  //println(counter);
  if(counter > 30)
  {
  me1.circles(diams[0]);
  me1.moveObjects();
  //me1.lines(firstcolor);
  }
  if (counter > 130)
  {
  me2.circles(diams[1]);
  me2.moveObjects();
  }
  if (counter > 230)
  {
  me3.circles(diams[2]);
  me3.moveObjects();
  }
  if (counter > 330)
  {
  me4.circles(diams[3]);
  me4.moveObjects();
  }
  if (counter > 430)
  {
  me5.circles(diams[4]);
  me5.moveObjects();
  }
  if (counter > 530)
  {
  me6.circles(diams[5]);
  me6.moveObjects();
  }
  if (counter > 630)
  {
  me7.circles(diams[6]);
  me7.moveObjects();
  }
  if (counter > 730)
  {
  me8.circles(diams[7]);
  me8.moveObjects();
  }
  
  
}

class Me{
  // global variables for the Me class
  PVector start;
  PVector end;
  PVector current;
// Constructor
Me(PVector temp1, PVector temp2) {
  start= new PVector(temp1.x, temp1.y);
  end= new PVector(temp2.x, temp2.y);
  current = new PVector(temp1.x, temp1.y);
}

void circles(int diam){
  stroke(0, 0, 0, 50);
  fill(0, 0, 0, 50);
  ellipse(current.x, current.y, diam, diam);
  //PImage img2;
  //img2 = loadImage("me.png");
  //image(img2, current.x, current.y);
}

void lines(color tempcolor){
  stroke(tempcolor);
  line(start.x, start.y, end.x, end.y);
}

void moveObjects ()
{
 float xincrement = (end.x-start.x)/dist(end.x, end.y, start.x, start.y);
 float yincrement = (end.y-start.y)/dist(end.x, end.y, start.x, start.y);
 
 if(abs(current.x-end.x)>2)
 // increment
   {
   current.x += xincrement;
   current.y += yincrement;
   }  
}

void totals(){
    int [] total= new int [50]; 
    for (int i=0; i<total.length; i++)
      {total[i+1]=5*(total[i]+1);
      //fill(total[i]);  
      ellipse(current.x, current.y, 10, 10);}
}
}




