
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
String [] dayName =
{"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"};
int [] TotalOneDay = {20136,21233,21376,21573,23045,23880,21755};

//-----------------------------------------------------------------------------
void setup() 
{
  theData = loadStrings("EastTraffic_BroadW_Hourly.txt");
  background(0);
  size(820, 200);
  noStroke();
  smooth();
  sortData(daycounter);
  frameRate(20);
}
//-----------------------------------------------------------------------------
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
//-----------------------------------------------------------------------------
void draw()
{

  fill(0,40); //fade pulse
  rect(0,0,width,height);
    
  for (int j = 0; j < traffic.length; j++) //little time dots
  {
    fill(60);
    scalex = map(j, 0, traffic.length, 50, 770);
    ellipse(scalex, 150, 10, 10);
  }

  if(counter > 5)
  {
   if (hourcounter < traffic.length -2)
   { hourcounter++; }
   else
   {hourcounter = 0;}
   counter = 0;
  }
  else
  {counter++;}
  
  fill(255, 180);
  circlePhase(0.0,hourcounter, daycounter -1); // main pulse
  circlePhase(QUARTER_PI,hourcounter, daycounter - 1);
  circlePhase(HALF_PI,hourcounter, daycounter - 1);
   
  angle += speed;
  
   if (timing > 166)   
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
  //saveFrame("mobil_01.jpg"); //saving image
  
  angle = angle+0.001; //tick tick
  translate(50, 50);
  rotate(angle);
  fill(250);
  rect(-30, -30, 10, 1);
}
//-----------------------------------------------------------------------------
void circlePhase(float phase, int item, int day_no) 
{

  for (int i = 0; i < traffic.length; i++)
  {
    int currenttraffic = traffic[item]; 
    
    float diameter = (currenttraffic/55) + abs((sin((angle*0.8) + phase) * 40));
    ellipse(40+(30*item), 150, diameter, diameter);

    if(currenttraffic <= 1700)
    {
    fill(10,10*currenttraffic,10,2); 
    }
    else
    {
    fill(200,0,0,5);
    }
  }
  
  int currenttraffic02 = traffic[item]; //running number 
  //Dfont = loadFont ("ArialNarrow-12.vlw");
    if(currenttraffic02 <= 1700)
    {
    Dfont = loadFont ("ArialNarrow-12.vlw");
    fill(255,30); 
    }
    else
    {
    Dfont = loadFont ("Arial-Black-24.vlw"); //traffic jam
    fill(200,0,0,30);
    }
    
   textFont (Dfont);
   text(currenttraffic02, 40+(30*item), 120);
   String dayText = dayName[day_no]; //running days
   int TotalOneDayText = TotalOneDay [day_no];
   Dfont = loadFont ("ArialNarrow-12.vlw");
   textFont (Dfont);
   fill(200,10);
   text(dayText,20,50); //text inside circle
   text(TotalOneDayText + " cars passing on Broadway near to Harris st.",20,65);
   text("am", 45,143);
   text("pm", 390,143);
}

