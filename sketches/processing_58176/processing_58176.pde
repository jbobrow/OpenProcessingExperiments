
int mode = 1;
float xInc;
int border = 2;
color yes;
color no;

String[] ages;
String[] countries;
String[] religions;
String[] gods;

void setup()
{
 size(800, 300);
 smooth();
 yes = color(220, 10, 40);
 no = color(35, 70, 230);
 
 ages = loadStrings("data\\age.txt");
 countries = loadStrings("data\\country.txt");
 religions = loadStrings("data\\religion.txt");
 gods = loadStrings("data\\god.txt");
 
 
// xInc = float(width)/ages.length;
//println(xinc);

//fill(yes);
  background(255);
  drawBars();
}

void draw()
{
  background(255);
 
  //if(mode==1)
  drawBars();
 // else if(mode==2)
//    drawLineGraph();
 // else if(mode==3)
//    drawPie();
}

void drawBars()
{  
  int age;
  int god;
  float barWidth = float(width)/ages.length;
  
  for (int i=0; i<ages.length; i++)
  {
    age = int(ages[i]);
    god = int(gods[i]);

    if (god == 1)
    {
      fill(yes);
      //println("got here1");
    }
    else
    {
        //    println("got here2");
      fill(no); 
    }
    stroke(255, 75);
    strokeWeight(1);

    rect(i*barWidth, 300, barWidth, -age*5);
  }
}

void keyPressed()
{
  if (key=='1')
    mode=1;
  else if (key=='2')
    mode=2;
  else if (key=='3')
    mode=3;
  else
    println(mode);
}


