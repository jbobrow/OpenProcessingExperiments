
String[] theData;
float angle = 0.0; // Changing angle
float speed = 0.04; // Speed of growth
int[] traffic = new int[25];
PFont Dfont;
int daycounter = 1;
int timing = 0;
int hourcounter = 0; //growth
int counter = 0; //growth
float scalex;
//-----------------------------------------------------------------
void setup() 
{
  theData = loadStrings("EastTraffic_BroadW_Hourly.txt");
  background(255);
  size(800, 200);
  noStroke();
  smooth();
  sortData(daycounter);
  frameRate(50);
}
//-----------------------------------------------------------------
void sortData(int trafficday)
{  
  String[] newData;
  for (int i=0; i<theData.length; i++)
  {
    String thisLine = theData[i];
    
    if (thisLine.length() > 0)
    {
      String[] lineElements = split(thisLine,',');
   
      String theday = lineElements[trafficday];
      int thisDay = int(theday);
      traffic[i] = thisDay;
    }
  }
}
//-----------------------------------------------------------------
void draw()
{

  fill(255,20); //fade
  rect(0,0,width,height);
  
  for (int j = 0; j < traffic.length; j++) //little time dots
  {
    fill(225);
    scalex = map(j, 0, traffic.length, 50, 770);
    ellipse(scalex, 100, 10, 10);
  }
  

  fill(200); //grey band
  rect(50, 180, 700,10);    

  
  fill(255,0,0,70); //day rect
  scalex = map(daycounter, 1, 8, 50, 750);
  rect(scalex, 180, 100,10);


  if(counter > 5)
  {
   if (hourcounter < traffic.length -1)
   { hourcounter++; }
   else
   {hourcounter = 0;}
   counter = 0;
  }
  else
  {counter++;}
  
  fill(255, 180);
  circlePhase(0.0,hourcounter); // main pulse
  circlePhase(QUARTER_PI,hourcounter);
  circlePhase(HALF_PI,hourcounter);
 
  
  angle += speed;
  
   if (timing > 173)   
   {
     if (daycounter < 7)
     {daycounter++;}
     else
     {daycounter = 1;}
     timing = 0;
      println(daycounter);
     sortData(daycounter);
   }
   else
   {timing++;}
}
//-----------------------------------------------------------------
void circlePhase(float phase, int item) 
{

  for (int i = 0; i < traffic.length; i++)
  {
    
    int currenttraffic = traffic[item];
    
    float diameter = (currenttraffic/55) + abs((sin((angle*0.8) + phase) * 40));
    ellipse(40+(30*item), 100, diameter, diameter);

    if(currenttraffic <= 1700)
    {
    fill(50,2); 
    }
    else
    {
    fill(200,0,0,2);
    }
   
  }
}

