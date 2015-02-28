
float a=160;
float b=10;
float c=0;
//--------
int x=0;
float y=484;
int t=0;
int z=0;
//--------

int x1=0;
float y1=724;
int t1=0;
int z1 =0;

//----------
int x2=0;
float y2=964;
int t2=0;
int z2=0;

//----------

int x3=0;
float y3=1204;
int t3=0;
int z3=0;
//----------
//PImage img;






int puan = 0;
int mua = 2;
int nua = 2;
int q=1;
int p=0;


//PFont f;
//PFont f1;
//88888888888888888888888888888888888888888888888888888888888888888888888
//----MAİN SETUP
void setup(){
  size(320,480);
  background(255);
//  img = loadImage("1246191449.png");
  smooth();
 noStroke();


 
   
}
//9999999999999999999999999999999999999999999999999999999999999999999999
void mousePressed() {
  if (q==2) {
  q=3;
   p=0;
   puan=0;
  }
  
  
}

//88888888888888888888888888888888888888888888888888888888888888888888
void draw(){
 
  
   
 
  
frameRate(50);
  background(255);

//text(p,160,240);

   
   text(puan, 280, 430);
 //  f1 = createFont("FFScala", 10);
 //f = createFont("FFScala", 40);
  
 
  
  
  
if (q==1) {
    p=p+1;
  
   
  text("loading game, please wait...", 10,430);
  text("by Tural Alizada", 10,450);
  text("tural9292@hotmail.com", 10, 470);
}
  
  if(p==200) {
   
    q=2;
    text("PRESS TO START", 10,430);
    text("by Tural Alizada", 10,450);
    text("tural9292@hotmail.com", 10, 470);
  }
  
  

 
  
  
  //OUR HERO 
  fill(0);
 rect(a, b,10,10);
 
 //------996--------------68--------------75285------------86
 //------/----/------/-----/-----/-----/------/---
 if(q==3) {
   
 puan = puan +1;
 if ( mousePressed==true) {
  // y=y-1;
   //y1=y1-1;
   //y2=y2-1;
   //y3=y3-1;
   a=a-c;
   c=c-0.5;
   if (c<-1) {
     if (mua >3) {
       c=c-0.5;
     }
     
    
   }
   
   //000000000000000000----------000000000-------00000000-----00000000
   
 
 
 
  if (c>0) {
   mua =2;
 }

 
 
 }

 




 if (a < 0) {
   a=0;
   c=0;
 }
 //--------9-------9--------9---------9--------9-----9
//--/---/----/----/---/----/----/---/----/----/-
if ( mousePressed==false) {
 a=a-c;
 c=c+0.5;
 if (c>1) {
 if (mua <3) {
   c=c+0.5;
   
 }
 }
 
  if (c<0) {
   mua =4;
 }
 
 
 }
 //0000000000000
 if ( a> 310) {
   a = 310;
   c=0;
 }
 
 //Random buildings

   //-----------------
   
   //---------------
   
if (y>480) {
 x=int(random(15));
 t=int(random(20));
 }
 rect((x+3)*10,y,(t+5)*10,10);
  if ( mousePressed==true) {
    y=y-0.5;
  }

 y=y-7;

 if (y<-15) {
   y=964;
 }
 

 //SECOND WALL
 
 if (y1>720) {
   
   
 x1=int(random(15));
 t1=int(random(17));
 }
 rect((x1)*10,y1,(t1+3)*10,10);
 
 y1=y1-7;
 
 if ( mousePressed==true) {
   y1=y1-0.5;
  }

 
 
 if (y1<-15) {
   y1=964;
 }
 // THİRD SPC WALL
  
 if (y2>960) {
 x2=0;
 t2=int(random(17));
 }
  
 rect(x2,y2,(t2+3)*10,10);
  
  if ( mousePressed==true) {
    y2=y2-0.5;
  }
  
  
  
   y2=y2-7;
 
 if (y2<-15) {
   y2=964;
 }
 
 //WALL EXAMPLE
   if (y3>960) {
    
 x3=0;
 t3=int(random(30));
 }
 rect(x3,y3,t3*10,10);
 rect(t3*10+80,y3, 300-t3*10,10);
  y3=y3-7;
  if ( mousePressed==true) {
   y3=y3-0.5;
 }
  
  
 
 if (y3<-15) {
   y3=964;
 }












 //Fourth LAST SPC WALL
//  if (y3>960) {
    
// x3=int(random(20));
// t3=320-(x3+4)*10;
 //}
// rect((x3+4)*10,y3,t3,10);
 // y3=y3-4;
  
  
  
 
// if (y3<-15) {
 //  y3=964;
// }
 
 
 if ( b>y ) {
  if (b<y+10) {
   if (a<(x+3)*10+(t+5)*10) {
     if (a> (x+3)*10) {
       fill(50,5,156);
    // textFont(f);
    // text(puan,150,240);
   

    
    
      y=484;
      y1=724;
      y2=964;
      y3=1204;
    
      q=1;
     
      //  textFont(f1);
   
   
   // noLoop();
     }
   }
  }
 }
 
 if ( b>y1 ) {
  if (b<y1+10) {
   if (a<x1*10+(t1+3)*10) {
     if (a> x1*10) {
       fill(50,5,156);
     //  textFont(f);
    // text(puan,150,240);
     
       y=484;
      y1=724;
      y2=964;
      y3=1204;
      q=1;
      //  textFont(f1);
     
    // noLoop();
     }
   }
  }
 }
 
 if ( b>y2 ) {
  if (b<y2+10) {
   if (a<(t2+3)*10) {
     if (a> -2) {
         fill(50,5,156);
       //textFont(f);
    //text(puan,150,240);
    
    
         y=484;
      y1=724;
      y2=964;
      y3=1204;
      q=1;
       //  textFont(f1);
     
    // noLoop();
    }
   }
  }
 }
 
//  if ( b>y3 ) {
//  if (b<y3+10) {
 //  if (a<(x3+5)*10+t3) {
 //   if (a> (x3+5)*10) {
       
  //   noLoop();
  //   }
//   }
//  }
// }
 
 //wall ex
 
 if ( b>y3 ) {
  if (b<y3+10) {
   if (a<t3*10) {
    if (a> -2) {
      fill(50,5,156);
      // textFont(f);
    // text(puan,150,240);
    
        y=484;
      y1=724;
      y2=964;
      y3=1204;
      q=1;
      //  textFont(f1);
     
     
   // noLoop();
     }
   }
  }
 }
 
  if ( b>y3 ) {
  if (b<y3+10) {
   if (a>t3*10+80) {
    if (a< 321) {
      fill(50,5,156);
       //textFont(f);
    // text(puan,150,240);
    
        y=484;
      y1=724;
      y2=964;
      y3=1204;
      q=1;
        // textFont(f1);
  
   //  noLoop();
     }
   }
  }
 }
 
 
 
}
 
 
}









