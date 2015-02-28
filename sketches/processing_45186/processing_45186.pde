

//
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer audio;
float speed = 4;
float SMOOTHING = 0.15;
float vol = 0;
//float jump = vol*500;

//for stupid font
float y = 250;
float x = 100;
float x1 = x+40; //130

float cDim=30;

float add1=30;
float add2=40;
//


PFont T;
PFont H ;
PFont A;
PFont N;
PFont K;

PFont Y;
PFont O;
PFont U;




void setup()
{
  
  size(600,400);
  noStroke();



textSize(30);

  rectMode(CORNERS);
  noStroke();

minim = new Minim(this);
  audio = minim.loadFile("sweet.mp3");
  audio.loop();  


}




void draw(){
    background(0);


//T
if(mouseX < x) { 
 fill(255, 0 ,255);
  ellipse(x,y,cDim-vol*200,cDim-vol*200) ;
} else if(mouseX > x)

{ fill(255, 0 ,255);
  text("T",x,y-vol*700);
}
//



//H
if(mouseX < x1) { 
 fill(255,255,0); 
  ellipse(x1,y,cDim-vol*300,cDim-vol*300) ;
} else if(mouseX > 120)

{  fill(255,255,0); 
  text("H",x+add1,y-vol*300);
}
//


//A
if(mouseX < x1+add2) { 
fill(178,58,238); 
  ellipse(x1+add2,y,cDim-vol*400,cDim-vol*400) ;
} else if(mouseX > x1+add2)

{ fill(178,58,238); 
  text("A",x+add1*2,y-vol*400);
}
//


//N
if(mouseX < x1+add2*2) { 
 fill(255,255,0) ;
  ellipse(x1+add2*2,y,cDim-vol*500,cDim-vol*500) ;
} else if(mouseX > x1+add2*2)

{  fill(255,255,0) ;
  text("N",x+add1*3,y-vol*500);
}
//

//K
if(mouseX < x1+add2*3) { 
fill(118,238,0); 
  ellipse(x1+add2*3,y,cDim-vol*600,cDim-vol*600) ;
} else if(mouseX > x1+add2*3)

{fill(118,238,0); 
  text("K",x+add1*4,y-vol*200);
}
//


//Y
if(mouseX < x1+add2*4.5) { 
fill(0,191,255); 
  ellipse(x1+add2*4.5,y,cDim-vol*700,cDim-vol*700) ;
} else if(mouseX > x1+add2*4.5)

{fill(0,191,255); 
  text("Y",x+add1*7,y-vol*400);
}
//


//O
if(mouseX < x1+add2*5.5) { 
  fill(255,20,147); 
  ellipse(x1+add2*5.5,y,cDim-vol*800,cDim-vol*800) ;
} else if(mouseX > x1+add2*5.5)

{  fill(255,20,147); 
  text("O",x+add1*8,y-vol*600);
}
//


//U
if(mouseX < x1+add2*6.5) { 
 fill(255,165,0); 
 ellipse(x1+add2*6.5,y,cDim-vol*900,cDim-vol*900) ;
} else if(mouseX > x1+add2*6.5)

{  fill(255,165,0); 
  text("U",x+add1*9,y-vol*300);
}
//

vol = lerp(vol, audio.mix.level(), SMOOTHING);


 speed = audio.mix.level();



}



