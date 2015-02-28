
//Dana Silberberg Sahar
//Home Assignment Oct_8th_2012 
//REVISED & RESUBMITTED - 24.Oct.2012
//*At least three buttons that change part of the sketch
//*At least two for loops that add complexity to the program

 
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
rect (0,0,50,44);
strokeWeight(1);
stroke (0,0,100);
line (52,0,52,50);
if (mouseX<=50&&mouseY<50){
  if (mousePressed){
  //println("yes!");
  background (0,0,0);
  }
}

//3rd button: switches background color /* with added forloop to make the button more "cloudish"

strokeWeight(5);
stroke (myColor,0,100,100);
fill(0,0,0,100);
rect (0,50,50,50);

strokeWeight (4);
fill (myColor+200,100,100,100);
myColor++;
textSize (15);
text ("Press 'W' Key + Mouse to draw clouds",57,30);
text ("Press Mouse to draw with rainbow colors",57,60);

       myColor+=colorDir;
      if (myColor>360){
      colorDir=-1;
      }
       if (myColor<0){
       colorDir=1;       
      }
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

//4th button: draw "sunshine'  /* and added for loop to make the sun realy shine (-:
strokeWeight(5);
stroke (0,0,100,100);
rect (0,150,50,50);
fill (40,100,100,random(15));
ellipse (25,175,50,50);
//stroke (60,100,100,random (30));
for(int i=0;i<8;i++){
if (mouseX<=50&&mouseY>=150&&mouseY<200){
  if (mousePressed){
  //println("yes! 4th butt");
//stroke (60,100,100,2);
//ellipse (150,100,150,150);
fill (40,100,100,random(12));
strokeWeight(random(15));
stroke (random(65),100,100,random(13));
ellipse (width/2,height/2,i*20+30,i*20+30);
//stroke (60,100,100,random (13));
line (width/2,height/2,random (600),random (600));
  }
  }
}
 if (mousePressed){
  //if the 'w' key is pressed use white stroke (to draw LIGHT WHITE clouds....
 /*That too -  thanks to the kind help of "Processing" [the blue book] p.225: Keyboard chapter*/
 if ((keyPressed==true)&&(key=='w')){
  stroke (100,0,100,random(30));
  strokeWeight (random(100));
line(mouseX,mouseY,pmouseX,pmouseY);
}else{
//rainbow strokes:
    stroke (myColor,100,100,random(100));
    fill (myColor,100,100,90);
    strokeWeight (random(30));
    myColor+=colorDir;
     
         if (myColor>360){
         colorDir=-1;
         }
        
          if (myColor<0){
          colorDir=1;
          }
}
 }
 line(mouseX,mouseY,pmouseX,pmouseY);



strokeWeight (random (3));
fill (0,100,100 ,random(100));

//forloop for cloudish button no#2

for(int i=0;i<2;i++){
fill (0,0,100,random(30));
strokeWeight(random(15));
stroke (0,0,100,random(50));
ellipse (25,75,i+35,i*i+35);
//fill (myColor,100,100,random(65));
//myColor++;
}

for(int i=0;i<3;i++){
stroke (60,100,100,random(50));
ellipse (25,175,i*10,i*10);
stroke (18,100,100,random(50));
ellipse (25,175,i*20,i*20);
}


strokeWeight(.6);
for(int i=0;i<48;i++){
fill (i*13,100,100,50);
rect (0,100,48-i,48-i);
}


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

strokeWeight (2);
textSize (10);
fill (0,100,0,100);
text ("CLEAR",10,20);
text ("SCREEN",10,35);
text ("BACK-",2,110);
text ("GROUND",10,125);
text ("COLOR",6,140);

strokeWeight (4);
fill (0,0,100,100);
textSize (10);
text ("CLOUDS",5,75);

strokeWeight (4);
fill (250,100,100,100);
textSize (10);
text ("SUNSHINE",5,175);

}










