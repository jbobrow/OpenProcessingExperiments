
import processing.pdf.*;

//void setup() {

  //use this function in combination with exit() below to produce a pdf file 
  size(2200, 1700, PDF, "wallpaper.pdf");

  /*
  Alternatively use this function to test your output on screen so you can actually see what you are doing.
  DON' FORGET TO COMMENT THE exit(); down below if you are printing on screen.
   size(1024, 768);
   */

  /*
  BONUS:
   Can you make a repeated pattern or a flexible algorithm that is bigger
   than the area you can visualize?  
   This function produces a "letter" size document 
   that can be printed at 200 dpi (decent printing resolution)

    size(2200, 1700, PDF, "wallpaper.pdf");
   */

 
 smooth();
//}

 
//void draw() {
  float i,y1, x1, y2, x2, p1,p2, count,f,r1;
  background(50,0,0);
  // Draw something good here
count=0;
f=0;
  for(i=0;i<=10000;i=i+1){
    strokeWeight(random(0,10));
    x1=count;
    y1=random(0,768);
    y2=random(y1,768);
    p1=random(0,width);
    p2=random(0,height);
    
    if(p1>0 && p1<100 || p1>200 && p1<300 || p1>400 && p1<500 ||p1>600 && p1<700 ||p1>800 && p1<900 ||p1>1000 && p1<1100 || p1>1200 && p1<1300 || p1>1400 && p1<1500 || p1>1600 && p1<1700 || p1>1800 && p1<1900 ||p1>2000 && p1<2100){
       strokeWeight(random(5,10));
              r1=f;
  
       stroke(100,random(0,255),200, 50);
   
    
    }
    else{
       strokeWeight(random(0,5));
          r1=f;
      //fill(255,255,255);
     // rect(r1,0,100, height);
       stroke(random(10,255),100,0, 50);
       
   
    }
        fill(00,00,00);
      rect(r1,0,100, height);
    line(p1,p2, p1, p2+100);
        f=f+50;
    count=count+10;
  }
  //etcetera

  // Exit the program 
  println("Finished.");

  /*
  exit() here makes the sketch similar to static mode 
   the draw function is called only once so don't do anything 
   interactive or dynamically animated, your output should be produced
   instantaneously  
   */

  //exit(); //if you are just testing on screen get rid of this line!
//}


