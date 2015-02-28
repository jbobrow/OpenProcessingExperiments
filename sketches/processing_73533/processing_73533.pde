
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/73490*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int currTimer=millis()+1000; 
int mi=0;//minutes
int se=0;//seconds
int circ=240;//clock radius
String dispSec="";//string var to display seconds with leading zero
float arcSt=4.71; //starting position for arc
float arcEn=0;//end position
PFont myFont;

void setup(){
 size(500,500);
smooth();
background(0);
stroke(255,255,255);
myFont=createFont("Futura",250);
textFont(myFont,250);


}

void draw(){
 
  if(millis()>=currTimer){ //execute when millis reaches 1 second
    currTimer=millis()+1000; //reset to one second in the future
   se=se+1; //increment seconds
   if(se==60){ //check if 60 seconds passed
     se=0; //reset to 0
     mi=mi+1; //add one minute
   }
  background(0); //paint screen black 1st
  

  fill(142,152,127);
  stroke(0);
  ellipse (width/2,height/2,400,400); //outer circle
    fill(183,198,160);
    stroke(100);
    ellipse (width/2,height/2,300,300); //inner circle
    fill(149,175,110);
    stroke(100);
    rect(width/2-100,height/2-100,200,75); //box showing time
 

    
    
 //display text inside box 
  fill(255);
  if (se<=9){ //check if seconds below 10 so we can prefix with leading zero
     dispSec="0" + se; //under 10 seconds, prefix display variable with zero and append seconds 
   } else { 
     dispSec= ""+ se; //no prefix needed, seconds are above 9
   }
 textSize(60);
  text(mi + ":" + dispSec,width/2-45,height/2-40);
   
   //draw moving arc
   stroke(255);
   arcEn=arcSt+(2 * Math.PI / 60)); //set arc end (width of arc) by 0.16, 
arc(width/2,height/2,circ,circ,arcSt,arcEn-0.1);
if (arcEn==4.71){ //if arc end reaches top then reset arc start to top again
  arcSt=4.71;
}else {
arcSt=arcEn; // set arc start to where it just ended
}


  }
}

void mousePressed(){
 currTimer=millis()+100;

mi=0;
se=0;
dispSec="";
arcSt=4.71;
arcEn=0;//4.87;
}
