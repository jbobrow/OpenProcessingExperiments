
// Coral Pais, Carnegie Mellon University
//Reproduction of the program without consent is strictly prohibited

// 257/757  Fall 2013
// Homework #10 Data Visualization


int i, Highest, totalPop=0,  Button, phase=0, maleDisplay, femaleDisplay ; 
float Factor, angleText, ccx,ccy, ROTATE=0;
String occupationDisplay;

final int TYPE=15;
final int YEARS=7;


float [ ] x=new float [YEARS];
float [ ] y=new float [YEARS];

String [ ] occupation= new String [TYPE];
int [ ] male =new int [TYPE];
int [ ] female =new int [TYPE];
int [ ] year= { 2006, 2007, 2008, 2009, 2010, 2011, 2012};
String [ ] files= { "Data2006.csv", "Data2007.csv", "Data2008.csv" , "Data2009.csv", "Data2010.csv", "Data2011.csv", "Data2012.csv"};
int [ ] Total=new int [TYPE];



PFont welcomeText;

void setup ( )
{
  size (800,800);
  textAlign(CENTER);
  
  ccx=width/2;
  ccy=height/2;
  
  noStroke ( );
  fill (0);
  
  welcomeText=loadFont ("ArialMT-48.vlw");
  
}


void draw ( )
{
  background (255);
  
  if (phase ==0)
  {
    WelcomeScreen ( );
    drawButtons ( );
        
  }
  
  else 
  {
    getData ( );
    InitializeTotal ( );
    FindTotalPopulation ( );
    FindFactor ();
    drawChart ( );
    drawButtons ( );
    checkAngle ( );
  }
  
}


void WelcomeScreen ( )
{
  
   
   
   pushStyle ( );
   textFont (welcomeText, 16);
   fill (120,33,33);
   
   text( "The Coxcomb charts show the Occupation by Sex for Full-Time, Year-Round Employed Population 16 years and Over", 75 , height*0.3, width-150, height );
   text( "Data is available for the year 2006-2012", 0 , height*0.36, width, height );
   text( "Click on the year above to begin.  ", 0 , height*0.48, width, height );
   text( "Source: U.S. Census Bureau, American Community Survey ", 0 , height*0.60, width, height );
   popStyle ( );
}

void getData ( )
{
  
  Table table = loadTable(files [Button], "header");

  int i=0;
  
  for (TableRow row : table.rows()) 
  {
    
    occupation[i] = row.getString("occupation");
    male [i] = row.getInt("male");
    female [i] = row.getInt("female");
    
    i++;
  }
  
}

void InitializeTotal ( )
{
  for (i=0; i< Total. length; i++)
  {
    Total[i]= male [i]+ female [i];
  }
}

void FindTotalPopulation ( )
{
  for (i=0; i< Total. length; i++)
  {
    totalPop+= Total [i];
  }
  
  
  
  
}

void FindFactor ( )
{
  Highest=Total[0];
  for (i=0; i< Total. length; i++)
  {
    if (Total[i] >Highest)
    Highest=Total[i];
  }
  
  //Factor=Highest/(width*0.8);
  Factor=35000;
  
  
}

void drawChart ( )
{
  for (i=0; i< Total. length; i++)
  {
    noStroke ( );
    fill (255, 136, 238);
    arc (width/2, height/2, Total [i] /Factor, Total [i] /Factor, TWO_PI/TYPE*i+radians (ROTATE), TWO_PI/TYPE* (i+1)+ radians (ROTATE));
    
    fill (67,92,222);
    arc (width/2, height/2, male [i] /Factor, male [i] /Factor, TWO_PI/TYPE*i+radians (ROTATE), TWO_PI/TYPE* (i+1)+radians (ROTATE));
    
    angleText=TWO_PI/TYPE*i + PI/TYPE + radians (ROTATE) ; //angle is in radians
    
    
    pushMatrix();
     pushStyle ( );
    textAlign (LEFT, CENTER);
    textFont (welcomeText, 12);
    fill (0); 
    translate (ccx+ (Total [i]*0.5 /Factor )* cos (angleText), ccy+ (Total [i]*0.5 /Factor )* sin (angleText)); 
    rotate( angleText);
    text ( occupation [i], 0,0  );
    popStyle ( );
    popMatrix();
    
  }
  pushStyle ( );
  textFont (welcomeText, 12);
  textAlign (LEFT);
  fill (67,92,222);
  text ( "Male:  " + maleDisplay, 10, height-50);
  fill (255, 136, 238);
  text ( "Female:  " + femaleDisplay , 10, height-35);
  fill (0);
  text ( "Occupation:  " + occupationDisplay, 10, height-20);
  textAlign (RIGHT);
  text ( "Year:  " + year [Button], width-10, height-20);
  //text ( "Total Population:  " + totalPop, width-10, height-35);
  popStyle ( );
  
   
}

void drawButtons ( )
{
  stroke (0);
  fill (0);
  for (i=0; i<7; i++)
  { 
    x[i]= ccx+ width*0.12* (i-3);
    y[i]= ccy-height*0.4;
    ellipse ( x[i] , y[i] , width*0.025, height*0.025);
    text ( year [i], x[i], y[i]-height*0.016);
    
  }
   
  pushStyle ( );
  noFill( );
  stroke( 200, 200, 0 );
  strokeWeight( 4 );
  
  for (i=0; i<7; i++)  
  {
        if (dist (mouseX, mouseY,  x[i], y[i]) < width*0.025 )
      {
        ellipse (x[i], y[i], width*0.028, height*0.028);
        
        }
   }
  
  
  popStyle ( );
 
  
}


void checkAngle ( )
{
  float mouseAngle =atan2 (mouseY-ccy, mouseX-ccx);

    if (mouseAngle<0)
      mouseAngle+=TWO_PI;
      
      mouseAngle-= radians (ROTATE);
      
      if (mouseAngle<0)
      mouseAngle+=TWO_PI;

    for (i=0; i< Total. length; i++)
    {
      if (mouseAngle > TWO_PI/TYPE*i && mouseAngle < TWO_PI/TYPE* (i+1) )
        if (dist (mouseX, mouseY, ccx, ccy) < 0.5*Total [i] /Factor)
      {
        maleDisplay = male [i];
        femaleDisplay =female [i];
        occupationDisplay=occupation [i];
        
        fill (0);
        arc (width/2, height/2, Total [i] /Factor, Total [i] /Factor, TWO_PI/TYPE*i+radians (ROTATE), TWO_PI/TYPE* (i+1)+ radians (ROTATE));
        arc (width/2, height/2, male [i] /Factor, male [i] /Factor, TWO_PI/TYPE*i+radians (ROTATE), TWO_PI/TYPE* (i+1)+radians (ROTATE));
        
      }

    }
  
}

void mousePressed ( )
{
  for (i=0; i<7; i++)  
  {
        if (dist (mouseX, mouseY,  x[i], y[i]) < width*0.025 )
      {
        
        Button=i;
        totalPop=0;
        phase=1;
        }
  
  }
  
}


void mouseDragged ( )
{
  
  if (mouseX < pmouseX || mouseY>pmouseY)
  {
    
    ROTATE++;
    
  }
  
  else 
  
  ROTATE--;
    
    
}




