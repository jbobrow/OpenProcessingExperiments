
//Jessica Schafer, Feb 22, 2012
//thesis prototyping trials
//visualizing discussion data -- adding transitions between states


//setup getting data from cvs file
String lines[];
String [][] csv; //2D array that will hold all info
int csvWidth=0;

//global variables
int items = 20; //MAGIC NUMBER use for number of objects
int diam, buffer, rate; //diameter of dots, buffer number for edges of display, rate of movement
float xaxis, basey, distance; //y value of x-axis, basic y value for dots, distance calculation for buttons
float buttonx, buttony;

color teal = color (50, 132, 138); 
color ltblue = color (108, 255, 236);
color blah = color (232, 225, 201); //fleshy? eek!
color pink = color (255, 174, 165);
color redder = color (255, 63, 69);
color reddish = color (196, 10, 10);

String basic = "Comments arranged in sequence by time";
String opinion = "FOR demolition above, AGAINST demolition below";
String view = "Future-focused comments above, past-focused comments below";
String connect = "Lines show comments that respond directly to a previous comment";
String amount = "Size indicates word length of comment";
String feeling = "Color indicates sentiment: redder is angrier, bluer is happier";


//arrays for x, y locations of dots
float [] xValues, yValues, targetY;

//variables for control structure
int position, display;

void setup()
{
  size (600,500);
  smooth();
  //translate(0, height/2); //set middle line as 0 for y values
  diam = 15;
  xaxis = 0;
  buffer = 10;
  basey = 0;
  position = 0;
  display = 0;
  rate = 30;
  buttonx = width-20;
  buttony = (height/2)-20;
  
  //filling arrays
  lines = loadStrings("Discussions.csv");
  getData();
  //println(csv[19][0]); //gets 20th down and 1st over (CHECK)
  xValues = new float [items];
  yValues = new float [items];
  //pxValues = new float [items]; //don't need?
  targetY = new float [items];
  getXValues(); //decide x position by time of comment
  getYValues();

}


void draw ()
{
  background (230);
  translate(0, height/2);
  
  if (position == 0) // simple, comments by time, FIRST TIME
  {println("starting up");}
  else //position meanings: 1 (for/against), 2 (future/past), 3 (simple by time)
  { getYTarget(position);
    moveToPosition();}
  
  drawDots(display); 
  checkConnections(display);  
  line (buffer, xaxis, width-buffer, xaxis);  //x-axis line
  fill(0);
  ellipse (buttonx, buttony, diam*2, diam*2);
  writeTitles();
  
}

//click to change state
void mouseReleased()
{
  float d = dist(buttonx, (buttony+height/2), mouseX, mouseY); //funkiness to deal with impact of translation
 if (d < diam*2)
   { if (display < 3)
     {display+=1;}
     else
     {display = 0;} 
     position = position;
   }
 else if (d > diam*2)
  { if (position < 3)
      {position+=1;}
   else
    {position = 1;} 
  }
  println(d);
}

void moveToPosition()
{
  for (int i = 1; i<items; i++)
    {
      float dy = (targetY[i] - yValues[i])/rate;
      if (yValues[i]==targetY[i])
      {yValues[i]=yValues[i];}
      else
      {yValues[i]+=dy;}
    }

}

void writeTitles()
{
 fill(0);
 float yheight = height/3;
 
 if (position == 0 || position == 3)
 { text (basic, buffer, yheight);}
 else if (position == 1)
 { text (opinion, buffer, yheight);}
 else if (position == 2)
 { text (view, buffer, yheight);} 
 
 if (display == 1)
 {text (connect, buffer, yheight+buffer*2);}
 else if (display == 2)
 {text (amount, buffer, yheight+buffer*2);}
 else if (display == 3)
 {text (feeling, buffer, yheight+buffer*2);}
 
}


//draw lines between dots that are responding to previous comment
void checkConnections(int a)
{
  if (a == 1)
  {
    for (int i = 2; i<items; i++)
    {
     if (csv[i][1].equals(csv[i-1][0]) == true)
     {line(xValues[i], yValues[i], xValues[i-1], yValues[i-1]);
      line(xValues[i-1], yValues[i-1], xValues[i-1]-5, yValues[i-1]+10);   //attempt at directional marking
       }   
    }
  }
}


//draw dots by time
void drawDots(int a)
{
  float d = diam;
  int t = 180;
  for (int i = 1; i<items; i++)
    { 
      if (a == 0 || a == 1)
      { fill(teal, t);}
      else if (a == 2)
      { fill(teal, t);
        d = (int(csv[i][8])*.03)*diam; //change dot diameter to reflect word count of comment
      }
      else if (a == 3)
      {if (csv[i][6].equals("good") == true) //change dot color to reflect sentiment
       {fill(teal, t); }
       else if (csv[i][6].equals("fine") == true)
       {fill(ltblue,t);}
       else if (csv[i][6].equals("cynical") == true)
       {fill(blah,t);}
       else if (csv[i][6].equals("frustrated") == true)
       {fill(pink,t);}
       else if (csv[i][6].equals("upset") == true)
       {fill(redder,t);}  
       else if (csv[i][6].equals("angry") == true)
       {fill(reddish,t);} 
      }    
      ellipse (xValues[i], yValues[i], d, d);
    } 
}

//x values based on time
void getXValues()
{
  float x = 0;
  for (int i = 1; i<items; i++)
    { if (int(csv[i][2]) == 110302)
       { x = map(int(csv[i][3]), 1400, 2400, buffer, width/2);}
       else if (int(csv[i][2]) == 110303) 
       { x = map(int(csv[i][3]), 0, 1000, width/2, width-buffer);}
      xValues[i] = x;
    } 
}

void getYValues()
{
  float y = buffer*-5;
  for (int i = 1; i<items; i++)
    { if (i>1 && xValues[i]-xValues[i-1]<20)
        {y -= 40;}
        else
        {y = basey-(buffer*5);}
      yValues[i] = y;}
}

void getYTarget( int a)
{
  float y = buffer*-5;
  String check1 = "Against";
  String check2 = "past";

  for (int i = 1; i<items; i++)
    { 
      if (i>1 && xValues[i]-xValues[i-1]<20)
        {y -= 40;}
        else
        {y = basey-(buffer*5);}
      
      if (a == 3)
        {targetY[i] = y;}
      else if (a == 1)
        {if (csv[i][9].equals(check1) == true)
            {targetY[i] = y*-1;}
            else
            {targetY[i] = y;}
        }
       else if (a == 2)
        { if (csv[i][7].equals(check2) == true)
            {targetY[i] = y*-1;}
            else
            {targetY[i] = y;}
        }
    }
    
}

//getting data from CSV file into array
void getData()
{
  //calculate max width of csv file
for (int i=0; i < lines.length; i++) 
 {
  String [] chars=split(lines[i],',');
  if (chars.length>csvWidth)
    {
    csvWidth=chars.length;
    }
 }
//create csv array based on # of rows and columns in csv file
csv = new String [lines.length][csvWidth];
//parse values into 2d array
for (int i=0; i < lines.length; i++) {
  String [] temp = new String [lines.length];
  temp= split(lines[i], ',');
  for (int j=0; j < temp.length; j++){
   csv[i][j]=temp[j];
    }
  }
}



