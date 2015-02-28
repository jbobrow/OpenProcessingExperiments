
//Jessica Schafer, Feb 25, 2012
//thesis prototyping trials
//visualizing an online discussion over a 20 hour period
//ability to transition between displays, add additional data factors via buttons


//setup getting data from cvs file
String lines[];
String [][] csv; //2D array that will hold all info
int csvWidth=0;

//global variables
int items = 20; //MAGIC NUMBER use for number of objects
int diam, buffer, rate; //diameter of dots, buffer number for edges of display, rate of movement
float xaxis, basey, distance; //y value of x-axis, basic y value for dots, distance calculation for buttons
float buttonx1, buttonx2, buttonx3, buttonx4, buttony, bDiam;
boolean button1 = true;
boolean button2 = false;
boolean button3 = false;
boolean button4 = false;
float xcol1, xcol2, xcol3, yrow1, yrow2; //locations for positions by comm type

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
String type_prop = "proposal";
String type_comp = "complaint";
String type_goal = "goals";
String type_off = "offer";
String type_supp = "support";
String type_obsv = "observation";

//arrays for x, y locations of dots
float [] xValues, yValues, targetY, targetX;

//variables for control structure
int position;
//int display;

void setup()
{
  size (600,500);
  smooth();
  diam = 15;
  xaxis = height/2;
  buffer = 10;
  basey = height/2-30;
  position = 0;
  //display = 0;
  rate = 30;
  buttonx1 = width-80;
  buttonx2 = width-60;
  buttonx3 = width-40;
  buttonx4 = width-20;
  buttony = height-20;
  bDiam = 15;
  xcol1 = width*.25;
  xcol2 = width/2;
  xcol3 = width*.75;
  yrow1 = height/3;
  yrow2 = (2*height)/3;
  
  //filling arrays
  lines = loadStrings("Discussions.csv");
  getData();
  //println(csv[19][0]); //gets 20th down and 1st over (CHECK)
  xValues = new float [items];
  yValues = new float [items];
  targetY = new float [items];
  targetX = new float [items];
  getXValues(); //initially decide x position by time of comment
  getYValues(); // initially decide y position based on proximity to previous comment

}


void draw ()
{
  background (255);
  //translate(0, height/2);
  
  if (position == 0) // simple, comments by time, FIRST TIME
  {//println("starting up");
    }
  else //position meanings: 1 (for/against), 2 (future/past), 3 (simple by time), 4 (circle...), 5 type of communication
  { getYTarget(position);
    getXTarget(position);
    moveToPosition();}
  
  drawDots(); 
  checkConnections();  
  drawBasics(position); //lines, buttons, titles
  
}

void drawBasics(int a)
{ 
    fill(0);
  //buttons
    ellipse (buttonx1, buttony, bDiam, bDiam);
    ellipse (buttonx2, buttony, bDiam, bDiam);
    ellipse (buttonx3, buttony, bDiam, bDiam);
    ellipse (buttonx4, buttony, bDiam, bDiam);
  //titles
  writeTitles();
  //center x-axis
  if (a < 4)
  {line (buffer, xaxis, width-buffer, xaxis);}  //x-axis line

}



void writeTitles()
{
 fill(0);
 float yheight = height*.8;
 
 if (position == 0 || position == 3)
 { text (basic, buffer, yheight);}
 else if (position == 1)
 { text (opinion, buffer, yheight);}
 else if (position == 2)
 { text (view, buffer, yheight);} 
 else if (position == 5)
 {
   text( type_prop, buffer, height/8); //*****repeating magic numbers for y position here...yikes
   text (type_off, buffer, height/4);
   text (type_supp, buffer, 3*height/8);
   text (type_obsv, buffer, height/2);
   text (type_goal, buffer, 5*height/8);
   text (type_comp, buffer, 6*height/8);
 }
  
 if (button2)
 {text (connect, buffer, yheight+buffer*1.5);}
 if (button3)
 {text (amount, buffer, yheight+buffer*3);}
 else if (button4)
 {text (feeling, buffer, yheight+buffer*4.5);}
 
}




//click to change state
void mouseReleased()
{
  float d1 = dist(buttonx1, buttony, mouseX, mouseY);
  float d2 = dist(buttonx2, buttony, mouseX, mouseY);
  float d3 = dist(buttonx3, buttony, mouseX, mouseY);
  float d4 = dist(buttonx4, buttony, mouseX, mouseY);

 if (mouseY > buttony-bDiam)
 { //stuff with display buttons
   if (d1 < bDiam/2)
   {button1 = !button1;}
   if (d2 < bDiam/2)
   {button2 = !button2;}
   if (d3 < bDiam/2)
   {button3 = !button3;}
   if (d4 < bDiam/2)
   {button4 = !button4;}
//     {display+=1;}
//     else
//     {display = 0;} 
//     position = position;
   }
 else
  { if (position < 5)
      {position+=1;}
   else
    {position = 1;} 
  }
}

void moveToPosition()
{
  for (int i = 1; i<items; i++)
    {
      float dy = (targetY[i] - yValues[i])/rate;
      float dx = (targetX[i] - xValues[i])/rate;
      
      if (yValues[i]==targetY[i])
      {yValues[i]=yValues[i];
       xValues[i]=xValues[i];}
      else
      {yValues[i]+=dy;
       xValues[i]+=dx; }
    }

}


//draw lines between dots that are responding to previous comment
void checkConnections()
{
  if (button2)
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


void drawDots()
{
  float d = diam;
  int t = 180;
  for (int i = 1; i<items; i++)
    { 
      if (button1 || button2)
      { fill(teal, t);}
      if (button3)
      { fill(teal, t);
        d = (int(csv[i][8])*.03)*diam; //change dot diameter to reflect word count of comment
        if (d<5)
        {d = 5;} //minimum size for dots if word count is very low
      }
      if (button4)
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
  float y = basey;
  for (int i = 1; i<items; i++)
    { if (i>1 && xValues[i]-xValues[i-1]<20)
        {y -= 40;}
        else
        {y = basey;}
      yValues[i] = y;}
}

void getYTarget( int a)
{
  float y = basey;
  String check1 = "Against";
  String check2 = "past";
  float y1 = height/8;
  float y2 = height/4;
  float y3 = 3*height/8;
  float y4 = height/2;
  float y5 = 5*height/8;
  float y6 = 6*height/8;
  
  for (int i = 1; i<items; i++)
    { 
      if (i>1 && xValues[i]-xValues[i-1]<20)
        {y -= 40;}
        else
        {y = basey;}
      
      if (a == 3)  //move back to distribution by time
        {targetY[i] = y;}
      
      else if (a == 1)  //move to position based on pro/con
        {if (csv[i][9].equals(check1) == true)
            { float dif = xaxis - y;
              targetY[i] = xaxis+dif;}
            else
            {targetY[i] = y;}
        }
       else if (a == 2) //move position based on future/past outlook
        { if (csv[i][7].equals(check2) == true)
            { float dif = xaxis - y;
              targetY[i] = xaxis+dif;}
            else
            {targetY[i] = y;}
        }
      else if (a == 4)
      {
        y = 150*cos(TWO_PI/(items-1)*i)+height/2;
        targetY[i] = y;
      }
     else if (a == 5)
     {
      if (csv[i][5].equals(type_prop) == true)
      { 
        targetY[i] = y1; }
      else if (csv[i][5].equals(type_comp) == true)
      {targetY[i] = y6; }
      else if (csv[i][5].equals(type_supp) == true)
      { targetY[i] = y3;}
      else if (csv[i][5].equals(type_goal) == true)
      {targetY[i] = y5; }
      else if (csv[i][5].equals(type_off) == true)
      {targetY[i] = y2; }
      else if (csv[i][5].equals(type_obsv) == true)
      {targetY[i] = y4; }
     }  
    }
}


//type_prop, type_comp, type_goal, type_off, type_supp, type_obsv


void getXTarget( int a)
{
  float x = 0;
  float x1 = xcol1;
  float x4 = xcol1;
  float x2 = xcol1;
  float x5 = xcol1;
  float x3 = xcol1;
  float x6 = xcol1;
  int space = 30;
  
  for (int i = 1; i<items; i++)
    { if (a == 4)
      {
        x = 150*sin(TWO_PI/(items-1)*i)+width/2;
        targetX[i] = x;
      }
      else if (a == 5)
       {
        if (csv[i][5].equals(type_prop) == true)
        {targetX[i] = x1;
         x1 += space; }
        else if (csv[i][5].equals(type_comp) == true)
        {targetX[i] = x6; 
          x6 += space;}
        else if (csv[i][5].equals(type_supp) == true)
        {targetX[i] = x3; 
          x3 += space;}
        else if (csv[i][5].equals(type_goal) == true)
        {targetX[i] = x5;
         x5 += space; }
        else if (csv[i][5].equals(type_off) == true)
        {targetX[i] = x2;
         x2 += space; }
        else if (csv[i][5].equals(type_obsv) == true)
        { targetX[i] = x4;
          x4 += space;}
       } 
      else 
      {
      if (int(csv[i][2]) == 110302)
       { x = map(int(csv[i][3]), 1400, 2400, buffer, width/2);}
       else if (int(csv[i][2]) == 110303) 
       { x = map(int(csv[i][3]), 0, 1000, width/2, width-buffer);}
      targetX[i] = x;
        }
    }
   //println (targetX[15]); //can't figure out why this guy doesn't change position between 4 & 5
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



