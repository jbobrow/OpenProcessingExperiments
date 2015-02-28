
//Dana Silberberg Sahar
//Home Assignment Oct_8th_2012 

 
 //Declaring my variables:
int colorDir;
int myColor;

//Setup loop:
void setup(){
   size(600,600);
   smooth();
   colorMode (HSB,360,100,100,100);
   background(0,0,0);
       //Defining variables
       myColor=0;
       colorDir=myColor+1;
}

void draw(){

 //1st button: clear background 
stroke (0,0,0,90);
fill(0,0,100);
strokeWeight(5);
rect (0,0,50,50);
if (mouseX<=50&&mouseY<50){
  if (mousePressed){
  //println("yes!");
  background (0,0,0);
  }
}

//3rd button: switches background color
strokeWeight(5);
stroke (myColor,0,100,100);
fill(myColor,0,0,100);
rect (0,50,50,50);
if (mouseX<=100&&mouseY>=100&&mouseY<150){
  if (mousePressed){
  //println("yes! 3rd butt");
  stroke (0,0,0,100);//check!??
   fill(0,0,0,100);//check!?
      background (myColor,100,100,90);
       myColor+=colorDir;
      if (myColor>360){
      colorDir=-1;
      }
       if (myColor<0){
       colorDir=1;       
      }
  }
}
//2nd button: draw "clouds'
strokeWeight(5);
stroke (0,0,100,100);
rect (0,100,50,50);
if (mouseX<=50&&mouseY>=50&&mouseY<100){
  if (mousePressed){
  //println("yes! 2nd butt");
//stroke (0,0,100,100);
//line(mouseX,mouseY,pmouseX,pmouseY);
stroke (0,0,100,random(20));
fill   (0,0,100,random(20));
  strokeWeight (random(200));
 ellipse (random (myColor+600),random (myColor+600),pmouseX,pmouseY);
    myColor++;
    myColor+=colorDir++;
           if (myColor>=50){
           colorDir=-1;
           }

}

  }
stroke(0,0,100,100);
strokeWeight(3);
fill (0,0,100,10);
if (mouseX<=50&&mouseY>=50&&mouseY<100){
  if (mousePressed){
    ellipse (25,75,45,45);
   // myColor++;
    myColor+=colorDir;
//               if (myColor<=0){
//               colorDir=1;
//              }
               if (myColor>=50){
              colorDir=-1;
              }
             
 //          if (myColor<=0){
//           colorDir=-1;
//           }
  }
}

//4th button: draw "sunshine'
strokeWeight(5);
stroke (60,100,100,random (30));
fill (60,100,100,50);
ellipse (25,175,48,48);

if (mouseX<=50&&mouseY>=150&&mouseY<200){
  if (mousePressed){
  //println("yes! 4th butt");
stroke (60,100,100,2);
ellipse (150,100,150,150);
strokeWeight(random(40));
stroke (60,100,100,random (13));
line (150,100,random (1000),random (1000));
  }
}

//rainbow strokes:
if(mousePressed){
    stroke (myColor,100,100,90);
    fill (myColor,100,100,90);
    strokeWeight (30);
    myColor+=colorDir;
     
         if (myColor>360){
         colorDir=-1;
         }
        
          if (myColor<0){
          colorDir=1;
          }
}
line(mouseX,mouseY,pmouseX,pmouseY);


 if (mousePressed){
  //if the 'w' key is pressed use white stroke (to draw LIGHT WHITE clouds....
 /*That too -  thanks to the kind help of "Processing" [the blue book] p.225: Keyboard chapter*/
 if ((keyPressed==true)&&(key=='w')){
  stroke (100,0,100,random(30));
  strokeWeight (random(100));
line(mouseX,mouseY,pmouseX,pmouseY);
}

 }


}










