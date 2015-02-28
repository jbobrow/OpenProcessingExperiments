
int Qty;
float dotSize, dotChange;
String[]date;
float x;
int n;

float EAy,xo,yo;
float WFy,xo1,yo1;
float BLy,xo2,yo2;
float Sy,xo3,yo3;

float[]EAdata;
float[]WFdata;
float[]BLdata;
float[]Sdata;

PImage EAlogo,WFlogo,BLlogo,Slogo;

void setup(){
  size(720,450);
  background(172, 211, 115);
  smooth();
 
        //insert dataset EA
  String EA[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=EA&a=0&b=1&c=2012&g=d&ignore=.csv");
      Qty=EA.length;
      n=Qty;
      EAdata = new float [Qty];
      date = new String [Qty];
      
    //get the close data on daily bases
   for (int counter=0;counter<Qty;counter++) 
   {
    String[] temp = split(EA[counter], ',');
        date[counter]=temp[0];
        EAdata[counter]=float(temp[4]);//Get EAdata[0~(Qty-1)]
     }
      
    //insert Whole Foods dataset 
   String WF[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=WFM&a=0&b=1&c=2012&g=d&ignore=.csv");
    WFdata = new float [Qty];
     for (int counter=0;counter<37;counter++) 
   {
    String[] temp = split(WF[counter], ',');
    WFdata[counter]=float(temp[4]);
      }
      
     //insert Blizzard data
       String BL[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=ATVI&a=0&b=1&c=2012&g=d&ignore=.csv");
    BLdata = new float [Qty];
     for (int counter=0;counter<37;counter++) 
   {
    String[] temp = split(BL[counter], ',');
    BLdata[counter]=float(temp[4]);
      }
      
      //insert Starbucks data
       String S[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=SBUX&a=0&b=1&c=2012&g=d&ignore=.csv");
    Sdata = new float [Qty];
     for (int counter=0;counter<Qty;counter++) 
   {
    String[] temp = split(S[counter], ',');
    Sdata[counter]=float(temp[4]);
      }
  //icone dot setting   
  dotSize=10;
  dotChange=10;

     frameRate(2);
   }

  void draw(){
     
     doPulse();
     
     //table x,y axis
       stroke(0);
     strokeWeight(1);
    line(60,40,60,400);
    line(60,400,600,400);
      //sub-lines
     stroke(0,50);
     for(int m=1;m<9;m++){
     line(55,40+m*40,600,40+m*40);
     }
     
          if(n>0){
    //text background
     noStroke();
     fill(172, 211, 115);
     rect(300,240,315,60);
      //date text
      fill(0,50);
      textSize(50);
      text(date[n-1],300,290);
      noStroke();
      
      //EA dots
       fill(#c5514c);
      ellipse(x,EAy,10,10);
      stroke(#c5514c);
      strokeWeight(2);
      line(x,EAy,xo,yo);
      
      //Whole Food dots
      noStroke();
       fill(#4f81c0);
      ellipse(x,WFy,10,10);
      stroke(#5788cb);
       strokeWeight(2);
      line(x,WFy,xo1,yo1);
      
      //Blizzard dots
      noStroke();
       fill(#6f9e02);
      ellipse(x,BLy,10,10);
      stroke(#6f9e02);
       strokeWeight(2);
      line(x,BLy,xo2,yo2);
      
      //Starbucks dots
      noStroke();
       fill(#8e73b1);
      ellipse(x,Sy,10,10);
      stroke(#8e73b1);
       strokeWeight(2);
      line(x,Sy,xo3,yo3);
      
   //x position is consistant for all curves
     x=60+15*(Qty+1-n);
    n=n-1;
   //EA function
    EAy=400-EAdata[Qty-n]*4;  
    xo=60+15*(Qty+1-n);
    yo=400-EAdata[Qty-n+1]*4;//the last point yo:EAdata[Qty-1]
   //WF function
     WFy=400-WFdata[Qty-n]*4; 
     xo1=60+15*(Qty+1-n);
     yo1=400-WFdata[Qty-n+1]*4;  
    //BL function
     BLy=400-BLdata[Qty-n]*4; 
     xo2=60+15*(Qty+1-n);
     yo2=400-BLdata[Qty-n+1]*4; 
    //S function
     Sy=400-Sdata[Qty-n]*4; 
     xo3=60+15*(Qty+1-n);
     yo3=400-Sdata[Qty-n+1]*4; 
      println(n); 
     }
  }
  
void doPulse() {
   //logo load
  EAlogo= loadImage("EA.png");
  image(EAlogo,645,285,50,50);
           
  WFlogo= loadImage("wholefood.png");
  image(WFlogo,645,85,50,50);
  
  BLlogo= loadImage("Blizzard.png");
  image(BLlogo,645,360,50,50);
  
  Slogo= loadImage("starbucks.png");
  image(Slogo,645,165,50,50);
  
  //pulsing icone drawing
      noStroke();
   //EA pulsing dot
      fill(172, 211, 115);
    rect(620,285+15,20,20);
      fill(#c5514c);
    ellipse(630,285+25,dotSize,dotSize);
    
     //Whole food pulsing dot
     fill(172, 211, 115);
    rect(620,85+15,20,20);
      fill(#4f81c0);
    ellipse(630,85+25,dotSize,dotSize);
    
    //Starbucks pulsing dot
     fill(172, 211, 115);
    rect(620,360+15,20,20);
      fill(#6f9e02);
    ellipse(630,360+25,dotSize,dotSize);
    
     //Starbucks pulsing dot
     fill(172, 211, 115);
    rect(620,180,20,20);
      fill(#8e73b1);
    ellipse(630,190,dotSize,dotSize);
    
  dotSize=dotSize+dotChange;
     dotChange=dotChange*-1.0;
  }  
    
                                    
