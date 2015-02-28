
String[] asxData;
String[] DAData;
float speed = 0.02; // speed of growth

int[] stocks;
int[] s_day;
int[] s_month;
int[] s_year;

int[] DADate;
int[] DADecision;
int[] s_year_DA;
int[] s_day_DA;
int[] s_month_DA;

PFont thefont;

float scaledstock0;
float scaledstock1;
float scaledx;
float scalex;

void setup()
{
  size(1200,500);
  background(255);
  frameRate(10);
  asxData = loadStrings("asx.txt");
  stocks = new int[asxData.length];
  s_day = new int[asxData.length];
  s_month = new int[asxData.length];
  s_year = new int[asxData.length];
  
  DAData = loadStrings("Ultimo Applications_DA1.txt");
  DADecision = new int[DAData.length];
  
  thefont = loadFont("ArialMT-16.vlw");//add form 
}

void draw()
{
   noStroke();
   fill(255,50); // screen color-white
   rect(0,0,width,height);

   for (int j = 0; j < s_year.length; j++) //little time dots
   {
     fill(0,20);
     scalex = map(j, 100, s_year.length/14.12, 50, 770);
     ellipse(50+(scalex*5), 200, 10, 10);
  }

  fill(255,0,0,70); //day rect
  scalex = map(s_year.length, 1, 8, 50, 750);
  rect(scalex, 180, 100,10);
 
 int numberofsquares = int(random(0,10000));
 frameRate(numberofsquares/2);
 if(numberofsquares > 8000)
   {
   fill(255,0,0,10); 
   }
   else
   {
   fill(200,70);
   }
 
   float posx = random(0,1200);
   float posy = random(0,150); 
 
   for (int i = 0; i < stocks.length; i++)
   {
   rect(posx*2,posy*2,(numberofsquares / 600),(numberofsquares / 600)); 
   } 
   for (int i = 0; i < DADecision.length; i++)
   {
    rect(posx*2,posy*2,60,60); 
   } 

getData();
  
  for(int i = 2; i < stocks.length; i++)
  {
    strokegraph(s_month[i]);  
    scaledstock0 = map(stocks[i-1], min(stocks), max(stocks), 0, 50);
    scaledstock1 = map(stocks[i], min(stocks), max(stocks), 0, 50);
//  println(stocks[i]);

    scaledx = map(i, 0, stocks.length, 0,1200);
    
    line(scaledx, height - scaledstock0, scaledx, height - scaledstock1);
  //point(scaledx, height - scaledstock1);

    textFont(thefont, 32);
    text(stocks[i], 0, 100);
 // println(stocks[i]);
    }

//added 001
   for(int i = 2; i < DADecision.length; i++)
   {
    strokegraph(DADecision[i]);
    scaledstock0 = map(DADecision[i-1], min(DADecision), max(DADecision), 0, 50);
    scaledstock1 = map(DADecision[i], min(DADecision), max(DADecision), 0, 50);

    scaledx = map(i, 0, DADecision.length, 0,1200);
    line(scaledx, height - scaledstock0, scaledx, height - scaledstock1);
  //point(scaledx, height - scaledstock1);
    
  //textFont(thefont,16);
 // text(200+random(-20,20),200+random(-20,20),200+random(-20,20));  
  } 
}

void getData()
{   
 for (int i=1; i<asxData.length; i++)
    {
    String thisLine = asxData[i];
    if (thisLine.length() > 0)
    {
      String[] lineElements = split(thisLine,',');
      
      String tempdate = lineElements[0];
      String[] tempdate2 = split(tempdate, "/");
      
      s_day[i] = int(tempdate2[0]);
      s_month[i] = int(tempdate2[1]);
      s_year[i] = int(tempdate2[2]);
      
      stocks[i] = int(lineElements[4]);   
    }
    } 
  
   for (int i=1; i<DAData.length; i++)
   {
   String thisLine_DA = DAData[i];
   if (thisLine_DA.length() > 0)
   {
   String[] lineElements_DA = split(thisLine_DA,',');
   String tempdate_DA = lineElements_DA[4];
          
   // println(tempdate_DA);
      textFont(thefont, 32);
      text(tempdate_DA, 0, 100);
      println(tempdate_DA);
     }
     }
     }

void strokegraph(int input_month)
{
    stroke(0,255);
    switch(input_month)
    {
      case 1: 
        strokeWeight(1);
        break;
      case 2: 
        strokeWeight(2);
        break;
      case 3: 
        strokeWeight(.9);
        break;
      case 4: 
        strokeWeight(1.2);
        break;
      case 5: 
        strokeWeight(1.5);
        break;        
      case 6: 
        strokeWeight(1.8);
        break;        
      case 7: 
        strokeWeight(2.1);
        break;        
      case 8: 
        strokeWeight(2.4);
        break;        
      case 9: 
        strokeWeight(2.7);
        break;        
      case 10: 
        strokeWeight(3);
        break;        
      case 11: 
        strokeWeight(3.3);
        break;    
      case 12: 
        strokeWeight(3.6);
        break;       
    }
}


