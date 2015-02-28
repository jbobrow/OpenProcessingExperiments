
//HW 13 Information viz
//copyright Jessica Schafer, Pittsburgh, PA, Nov. 2011

//*****DATA*****
//Data: total U.S. employment numbers Jan. 2007- Oct. 2011
//numbers source: bls.gov, Current Employment Statistics survey -- total NONFARM employment, millions
//Employment, Hours, and Earnings from the Current Employment Statistics survey (National)
//Series Id:     CES0000000001
//Seasonally Adjusted
//Super Sector:  Total nonfarm
//Data Type:     ALL EMPLOYEES, THOUSANDS (I moved the decimal to make it millions)
float [] totalJobs = {137.094, 137.182, 137.400, 137.479, 137.620, 137.687, 137.638, 137.612, 137.681, 137.772, 137.899, 137.983,  //2007
                      137.996, 137.913, 137.841, 137.656, 137.423, 137.245, 137.014, 136.747, 136.313, 135.804, 135.002, 134.383, //2008
                      133.563, 132.837, 132.041, 131.381, 130.995, 130.493, 130.193, 129.962, 129.726, 129.505, 129.450, 129.320,  //2009
                      129.281, 129.246, 129.438, 129.715, 130.173, 129.981, 129.932, 129.873, 129.844, 130.015,	130.108, 130.260,  //2010
                      130.328, 130.563, 130.757, 130.974, 131.027, 131.047, 131.174, 131.278, 131.436, 131.516}; //2011
String [] mon = {"Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sep.","Oct.", "Nov.","Dec.",      
                  "Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sep.","Oct.", "Nov.","Dec.",
                  "Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sep.","Oct.", "Nov.","Dec.",
                  "Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sep.","Oct.", "Nov.","Dec.",
                  "Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sep.","Oct."};
int [] yr = {2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007,
              2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 
              2009, 2009, 2009, 2009, 2009, 2009, 2009, 2009, 2009, 2009, 2009, 2009, 
              2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 
              2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011, 2011}; 
//*****ARRAYS*****              
float [] changeJobs;
color [] boxColor;
String [] sign; //for plus or minus in front of job change info
//*****TEXT****
String temp;
String jan07 = "137 million jobs";
String dec07 = "Beginning of\neconomic recession\n(137.9 million jobs)";
String sep08 = "Lehman Brothers collapse\n(136.3 million jobs)";
String jan09 = "Obama inauguration\n(133.5 million jobs)";
String jun09 = "End of economic\nrecession\n(130.5 million jobs)";
String feb10 = "Lowest jobs number\nduring this period\n(129.2 million jobs)";
String dec10 = "Recovery Act stimulus\nfunds paid out reaches\n$580 billion\n(130.1 million jobs)";
String oct11 = "131 million total jobs";
String jan07label = "January 2007";
String dec07label = "December 2007";
String sep08label = "September 2008";
String jan09label = "January 2009";
String jun09label = "June 2009";
String feb10label = "February 2010";
String dec10label = "December 2010";
String oct11label = "October 2010";
String sourceTitle = "Sources:";
String sourceBLS = "Bureau of Labor Statistics\nwww.bls.gov\n(Total non-farm jobs)";
String sourceNBER = "National Bureau of Economic Research,\nBusiness Cycle Dating Committee\nwww.nber.org\n(Recession dates)";
String sourceARRA = "Recovery Accountability and\nTransparency Board,\n2010 Agency Financial Report\nwww.recovery.gov\n(Recovery Act funding totals)";
//*****VARIABLES*****              
float x, y, multiplier; //location of box o' jobs and multiplier for zoom
float titlex, titley; //location of labels
int count, count2, index, timeline; //counters
float r; //variable for red value of box color
color txt = color (0); //text color
color bkg = color (240); //background color
color button = color(150); //button color
color button2 = color (0); //(200, 10, 100);
int buttonD = 30; //button size
float d, d2, d3, d4, d5, d6, d7, d8; //distances for button activation
float bar, segment, linex1, linex2, linex3, liney1, liney2, yloc;//associated with timeline
int bigText, mediumText, smallText, textLead;//text sizes and attribues
int slowFrame = 1; //associated with speed of animation
int regFrame = 60;


//****GET THE PARTY STARTED*****
void setup()
{
  size (800, 600);
  noStroke();
  smooth();
  frameRate (regFrame);
  fill(txt); 
  count = 0;  
  count2 = 0;
  multiplier = 2;  
//ARRAYS
  changeJobs = findDiff(totalJobs);
  boxColor = calcColors(totalJobs);
  sign = calcDiff(totalJobs);
//TIMELINE  
  linex1 = width-170;
  linex2 = linex1+5;
  linex3 = linex2+3;
  liney1 = 50;
  liney2 = height-50;
  yloc = liney1;
  bar = (liney2-liney1);
  segment = bar/58;
  timeline = 0;
//TEXT ATTRIBUTES
  bigText = 24;
  mediumText = 14;
  smallText = 11;
  textLead = 11;
  titlex = width/7;
  titley = 50;
}

//*****DRAW****
void draw ()
{
  background (bkg);
//STATE 0 initial screen  
if (index == 0)
 { setVariables(2, width/6, height/2);
   drawIntro();
   buttonPanel(index);}
//STATE 1 see entire object
  else if (index == 1)
   { getCount();
     setVariables(2, width/2, height/2);
     drawJobs(totalJobs, multiplier); 
     writeJobsDate((width/2)+20, height/2); 
     buttonPanel(index);
   }  
//STATE 2 loop on one iteration of object
  else if (index == 2)
   {drawOneJob(totalJobs, multiplier);
     writeJobsDate((width/2)+20, height/2); 
     buttonPanel(index);
    }
//STATE 3 zoom in
  else if (index == 3)  
   { getCount();
    setVariables(29, -width*1, height*3);   
    drawJobs(totalJobs, multiplier);
    writeJobsDate((width/2)+20, height/2); 
    buttonPanel(index);
   }
// STATE 4 sources
 else if (index == 4)
  {setVariables(2, width/6, height/2);
   timeline = 0;
   pauseAnimation();
   drawIntro();
   drawSources();
   drawColorKey();
   buttonPanel(index);
  }
  writeMainLabels();
  drawTimelineLine();
}

//*****SETUP+COUNT*****
void setVariables (float m, float inputx, float inputy)
{
 multiplier = m;
 x = inputx; 
 y = inputy;
}

//change count
void getCount()
{
 int a = frameCount;
 float r = a%15;
 if (r == 0)
  { 
    if (count < 57) 
    {count++;}
    else 
    {count = count;} 
  }
  else 
  {count = count;}
}

void pauseAnimation()
{
  count = count;
}


//*****TEXT+TIMELINE*****

void drawTimelineLine()
{
  if (timeline == 1)
  {
    strokeWeight(3);
    float y = liney1;
    if (count>0 && count <58)
    { 
     stroke (boxColor[count]);
     line (linex1, y, linex1, (y+segment*count));
    }
   drawTimelineText();
  } 
 else if (timeline == 0)
 { stroke(bkg);
   line (linex1, y, linex1, y+segment);
   noStroke();
 } 
}
  
void drawTimelineText() //painfully long way to do this, but couldn't figure another way...
{
  fill(0);
  float y = liney1;
  float x = linex3-15;
  textSize(smallText);
  
  if (count<11)
  {
    textAlign(RIGHT);
    text (jan07label, x, y);
    textAlign(LEFT);
    text (jan07, linex3, y);}
  else if (count<20)
  { textLeading(textLead);
    textAlign(RIGHT);
    text (jan07label, x, y);
    textAlign(LEFT);
    text (jan07, linex3, y);
    
    textAlign(RIGHT);
    text (dec07label, x, y+segment*12);
    textAlign(LEFT);
    text (dec07, linex3, y+segment*12);}
  else if (count<24)
  { textLeading(textLead);
    textAlign(RIGHT);
    text (jan07label, x, y);
    textAlign(LEFT);
    text (jan07, linex3, y);
    
    textAlign(RIGHT);
    text (dec07label, x, y+segment*12);
    textAlign(LEFT);
    text (dec07, linex3, y+segment*12);
    
    textAlign(RIGHT);
    text (sep08label, x, y+segment*21);
    textAlign(LEFT);
    text (sep08, linex3, y+segment*21);}
  else if (count<29)
  { textLeading(textLead);
    textAlign(RIGHT);
    text (jan07label, x, y);
    textAlign(LEFT);
    text (jan07, linex3, y);
    
    textAlign(RIGHT);
    text (dec07label, x, y+segment*12);
    textAlign(LEFT);
    text (dec07, linex3, y+segment*12);
    
    textAlign(RIGHT);
    text (sep08label, x, y+segment*21);
    textAlign(LEFT);
    text (sep08, linex3, y+segment*21);
    
    textAlign(RIGHT);
    text (jan09label, x, y+segment*25);
    textAlign(LEFT);
    text (jan09, linex3, y+segment*25);
   }
  else if (count<37)
  { textLeading(textLead);
    textAlign(RIGHT);
    text (jan07label, x, y);
    textAlign(LEFT);
    text (jan07, linex3, y);
    
    textAlign(RIGHT);
    text (dec07label, x, y+segment*12);
    textAlign(LEFT);
    text (dec07, linex3, y+segment*12);
    
    textAlign(RIGHT);
    text (sep08label, x, y+segment*21);
    textAlign(LEFT);
    text (sep08, linex3, y+segment*21);
    
    textAlign(RIGHT);
    text (jan09label, x, y+segment*25);
    textAlign(LEFT);
    text (jan09, linex3, y+segment*25);
    
    textAlign(RIGHT);
    text (jun09label, x, y+segment*30);
    textAlign(LEFT);
    text (jun09, linex3, y+segment*30);
   }
  else if (count<47)
  { textLeading(textLead);
    textAlign(RIGHT);
    text (jan07label, x, y);
    textAlign(LEFT);
    text (jan07, linex3, y);
    
    textAlign(RIGHT);
    text (dec07label, x, y+segment*12);
    textAlign(LEFT);
    text (dec07, linex3, y+segment*12);
    
    textAlign(RIGHT);
    text (sep08label, x, y+segment*21);
    textAlign(LEFT);
    text (sep08, linex3, y+segment*21);
    
    textAlign(RIGHT);
    text (jan09label, x, y+segment*25);
    textAlign(LEFT);
    text (jan09, linex3, y+segment*25);
    
    textAlign(RIGHT);
    text (jun09label, x, y+segment*30);
    textAlign(LEFT);
    text (jun09, linex3, y+segment*30);
    
    textAlign(RIGHT);
    text (feb10label, x, y+segment*38);
    textAlign(LEFT);
    text (feb10, linex3, y+segment*38);
  }
  else if (count <57)
  { textLeading(textLead);
    textAlign(RIGHT);
    text (jan07label, x, y);
    textAlign(LEFT);
    text (jan07, linex3, y);
    
    textAlign(RIGHT);
    text (dec07label, x, y+segment*12);
    textAlign(LEFT);
    text (dec07, linex3, y+segment*12);
    
    textAlign(RIGHT);
    text (sep08label, x, y+segment*21);
    textAlign(LEFT);
    text (sep08, linex3, y+segment*21);
    
    textAlign(RIGHT);
    text (jan09label, x, y+segment*25);
    textAlign(LEFT);
    text (jan09, linex3, y+segment*25);
    
    textAlign(RIGHT);
    text (jun09label, x, y+segment*30);
    textAlign(LEFT);
    text (jun09, linex3, y+segment*30);
    
    textAlign(RIGHT);
    text (feb10label, x, y+segment*38);
    textAlign(LEFT);
    text (feb10, linex3, y+segment*38);
    
    textAlign(RIGHT);
    text (dec10label, x, y+segment*48);
    textAlign(LEFT);
    text (dec10, linex3, y+segment*48);
  }
  else
  { textLeading(textLead);
    textAlign(RIGHT);
    text (jan07label, x, y);
    textAlign(LEFT);
    text (jan07, linex3, y);
    
    textAlign(RIGHT);
    text (dec07label, x, y+segment*12);
    textAlign(LEFT);
    text (dec07, linex3, y+segment*12);
    
    textAlign(RIGHT);
    text (sep08label, x, y+segment*21);
    textAlign(LEFT);
    text (sep08, linex3, y+segment*21);
    
    textAlign(RIGHT);
    text (jan09label, x, y+segment*25);
    textAlign(LEFT);
    text (jan09, linex3, y+segment*25);
    
    textAlign(RIGHT);
    text (jun09label, x, y+segment*30);
    textAlign(LEFT);
    text (jun09, linex3, y+segment*30);
    
    textAlign(RIGHT);
    text (feb10label, x, y+segment*38);
    textAlign(LEFT);
    text (feb10, linex3, y+segment*38);
    
    textAlign(RIGHT);
    text (dec10label, x, y+segment*48);
    textAlign(LEFT);
    text (dec10, linex3, y+segment*48);
    
    textAlign(RIGHT);
    text (oct11label, x, y+segment*58);
    textAlign(LEFT);
    text (oct11, linex3, y+segment*58);
  }
  noStroke();
}

void writeMainLabels()
{
 String title = "Jobs in America";
 textSize(mediumText);
 String smallprint = "all non-farm jobs, 2007-present";
 float spw = textWidth(smallprint);
 fill(bkg);
 //rect(titlex-15, titley-25, spw+30, 50);
 fill(txt);
 textSize(bigText);
 textAlign(LEFT);
 text (title, titlex, titley);
 textSize(mediumText);
 text(smallprint, titlex, titley+20);
}

void writeJobsDate(float labelx, float labely)
{
 fill(txt);
 textSize(bigText);
 textAlign(LEFT);
 text (mon[count], labelx, labely);
 text (yr[count], labelx+60, labely);
}

void drawSources()
{
 float posy = titley+40;
 float posx = width*.7;
 fill(txt);
 textAlign(LEFT);
 textSize (mediumText);
 text (sourceTitle, posx, posy);
 text ("Jessica Schafer // Nov. 2011", posx, height*.95); 
 textSize (smallText);
 textLeading(smallText+4);
 text (sourceBLS, posx, posy+20); 
 text (sourceNBER, posx, posy+75); 
 text (sourceARRA, posx, posy+150); 
}

//*****BUTTONS*****

void buttonPanel(int a)
{
 int inc = 65;
 int offset = 10;
 float posy = titley+40;
 float posx1 = titlex+offset;
 float posx2 = titlex+offset+inc;
 float posx3 = titlex+offset+inc*2;
 float posx4 = titlex+offset+inc*3;
 float posx5 = titlex+offset+inc*4;
 float cornery = height*.9;
 color temp;
 
 if (a == 0)
  { d2 = d3 = d4 = d5 = d7 = buttonD; //to make sure mouseReleased pays attention to correct variables 
   d = dist(posx1, posy, mouseX, mouseY);
   if (d<buttonD/2)temp = button2;
   else temp = button;
   button("Start", temp, buttonD, posx1, posy);
   
   d6 = dist(posx1, cornery, mouseX, mouseY);
   if (d6<buttonD/4)temp = button2;
   else temp = button;
   button("Additional\nInformation", temp, buttonD/2, posx1, cornery);
  }
 else if (a == 1)
  {d = buttonD; 
   d2 = dist(posx2, posy, mouseX, mouseY);
   if (d2<buttonD/2) temp = button2;
   else temp = button;
   button("Zoom\nIn", temp, buttonD, posx2, posy);
   
   d3 = dist(posx3, posy, mouseX, mouseY);
    if (d3<buttonD/2) temp = button2;
    else temp = button;
   button("Timeline\nToggle", temp, buttonD, posx3, posy); 
   
   d4 = dist(posx4, posy, mouseX, mouseY);
    if (d4<buttonD/2) temp = button2;
    else temp = button;
   button("Restart", temp, buttonD, posx4, posy);
   
   d7 = dist(posx5, posy, mouseX, mouseY);
    if (d7<buttonD/2) temp = button2;
    else temp = button;
   button("Pause", temp, buttonD, posx5, posy);
   
   d6 = dist(posx1, cornery, mouseX, mouseY);
   if (d6<buttonD/4)temp = button2;
   else temp = button;
   button("Additional\nInformation", temp, buttonD/2, posx1, cornery);
   }
 else if ( a == 2)
  { d = d2 = d4 = d5 = d6 = d7 = buttonD;
   d3 = dist(posx3, posy, mouseX, mouseY);
    if (d3<buttonD/2) temp = button2;
    else temp = button;
   button("Timeline\nToggle", temp, buttonD, posx3, posy); 
   
   d8 = dist(posx5, posy, mouseX, mouseY);
    if (d8<buttonD/2) temp = button2;
    else temp = button;
   button("Resume", temp, buttonD, posx5, posy);
  } 
 else if (a == 3)
  { d = d2 = d6 = buttonD; 
    
    d3 = dist(posx3, posy, mouseX, mouseY);
    if (d3<buttonD/2) temp = button2;
    else temp = button;
    button("Timeline\nToggle", temp, buttonD, posx3, posy); 
    
    d4 = dist(posx4, posy, mouseX, mouseY);
    if (d4<buttonD/2) temp = button2;
    else temp = button;
    button("Restart", temp, buttonD, posx4, posy);
    
    d5 = dist(posx2, posy, mouseX, mouseY);
    if (d5<buttonD/2) temp = button2;
    else temp = button;
    button("Zoom\nOut", temp, buttonD, posx2, posy);
    
    d7 = dist(posx5, posy, mouseX, mouseY);
    if (d7<buttonD/2) temp = button2;
    else temp = button;
   button("Pause", temp, buttonD, posx5, posy);
  }
 else if (a == 4)
 {d2 = d3 = d4 = d5 = d6 = d7 = buttonD;
   d = dist(posx1, posy, mouseX, mouseY);
   if (d<buttonD/2)temp = button2;
   else temp = button;
   button("Return to\nMain View", temp, buttonD, posx1, posy);
 } 
 //println(d6);
}

void mouseReleased()
{
  if (d < buttonD/2) 
    {index = 1;
     //println ("move to main animation");
   }
  else if (d2 < buttonD/2) 
    {index = 3;
     //println ("zoom!");
    }
  else if (d3 < buttonD/2)
   { //println("time");
     if(timeline == 0)
     { timeline = 1;}
     else if (timeline == 1)
     {timeline = 0;}
    }
  else if (d4 < buttonD/2) 
    {count = 0;
     //println("restart!");
     }
  else if (d5 < buttonD/2)
   {index = 1; d5 = buttonD; //println("mainpaged5");
    } 
  else if (d6 < buttonD/4)
   {index = 4;
    //println("info!");
    } 
    
  else if (d7< buttonD/2)
   { index = 2;} 
   
  else if (d8< buttonD/2)
   { if(x == width/2)
     {index = 1; //println("back to far view");
      }
     else if (x == -width*1)
     {index = 3; //println("back to close view");
       }
   } 
}

void button(String label, color col, int diam, float x, float y)
{
  fill(txt);
  textSize(mediumText);
  textAlign(CENTER);
  textLeading(mediumText);
  text (label, x, y+28);
  fill(col);
  ellipse (x, y, diam, diam);
}

//*****FILL ARRAYS*****

//calculate change from one data point to the next, boost for use in color variation
float [] findDiff(float []a)
{
 float [] temp = {};
 float diff;
 for (int i=1; i<a.length; i++) //start loop at element 1, so can get difference
   {
    diff = a[i]-a[i-1];
    temp = append (temp, abs(diff)*10);
   } 
 return temp; 
}

//create array of positive and negative signs based on change in data points
String [] calcDiff(float []a)
{
  String [] temp = {};
  String sign;
  float diff;
  for (int i=0; i<a.length; i++)
  { 
    if (i == 0)
     {sign = "+";} 
    else
     { if (a[i] >= a[i-1])
        {sign = "+";}
       else
        {sign = "-";}
     }
    temp = append (temp, sign);
   } 
 return temp;
}

//create array of box colors based on change in data points
color [] calcColors(float []a)
{
  color [] temp = {};
  color boxCol;
  float diff;
  for (int i=0; i<a.length; i++)
  { 
    if (i == 0)
     {r = 200;} 
    else
     { diff = changeJobs[i-1]; 
       if (a[i] >= a[i-1])
        {r = r+diff;}
       else
        {r = r-diff;}
     }
    boxCol = color(r, 10, 100);
    temp = append (temp, boxCol);
   } 
 return temp;
}

//*****SHAPES*****
void drawIntro()
{
 fill(boxColor[0]);
 ellipse(x, y, 1*multiplier, 1*multiplier);
 ellipse (x*1.7, y, 10*multiplier, 10*multiplier);
 ellipse (x*3, y, 100*multiplier, 100*multiplier); 
 fill(txt);
 textSize(smallText);
 text ("1 million jobs", x-30, y+20);
 textSize(mediumText); 
 text ("10 million jobs", x*1.7-40, y+30);
 textSize(bigText);
 text ("100 million jobs", x*3-80, y+140);
}

void basicObject(int a, int b)
{
  fill(boxColor[a], b);
  ellipse (x, y, totalJobs[a]*multiplier, totalJobs[a]*multiplier);
}

void drawOneJob(float [] j, float m)
{
   x = x; y = y;
   count = count;
   timeline=timeline;
   basicObject(count-2, 50);
   basicObject(count-1, 100);
   basicObject(count, 255);
}

void drawJobs(float [] j, float m)
{
 if (count < (j.length-1))
 {
 //for the first box   
     if (count == 0)
     { basicObject(count, 255); }
//for the second box      
     else if (count == 1)
     { basicObject(count-1, 100);
       basicObject(count, 255); }
//all other boxes     
     else
     { basicObject(count-2, 50);
       basicObject(count-1, 100);
       basicObject(count, 255);}
   }
 else if (count == (j.length-1))
  {
    basicObject(count-2, 50);
    basicObject(count-1, 100);
    basicObject(count, 255);
  //HOLD count     
    count = count;
   }
}

//****COLOR GRADIENT BLOCK****

void drawColorKey()
{
  float xpos = width*.7;
  float ypos = height*.62;
  float ht = 5;
  float wd = 40;
  for (int i = 12; i<41; i++)
  {
   fill(boxColor[i]);
   rect( xpos, ypos, wd, ht);
   ypos += ht;
  }
  fill(txt);
  textSize (mediumText);
  text ("Color key:", xpos, height*.6);
  textSize(smallText);
  text("Gaining jobs", xpos+wd+5, height*.62+10);
  text("Loosing jobs", xpos+wd+5, ypos-5);
}

//***********END************** 


