
/*
 Creator: Chia Yuan (Ruby) Chang
 IDEA9203 Assignment1a: A simple looping animation for a victory (medal) ceremony at the olympics
 08/08/2012
  
*/



String _backTitle = "OLYPMICS";
String _frontTitle = "LONDON2012";
PFont _font,_font2;
int _winnerX,_y,_m=0;
int _cx, _cy;
boolean rightway=true, circleRight=true;
int t;
int _w, _h; 
color c1, c2, c3, c4, c5,picked;

void setup() {
  size(720, 400);
  frameRate(8); 
  _cy=20; //upper small circle y pos
  _winnerX = 0;
  //_y = 0;
  //set the 5 olympics colors
  c1 = color(1,133,195);
  c2 = color(247,194,50);
  c3 = color(0);
  c4 = color(0,158,68);
  c5 = color(234,0,43);

  _font = loadFont("Bauhaus93-100.vlw");    
  textFont(_font, 60);
  _font2 = loadFont("Bauhaus93-250.vlw");
  smooth();
  background(255);  
  strokeWeight(5);
}

void draw(){
  
  background(255);
  //pick a random colour from the 5 colours
  noStroke();
  int ranColor= int(random(5));
  switch(ranColor){
   case(0):   picked = c1; break;
   case(1):   picked = c2; break;
   case(2):   picked = c3; break;
   case(3):   picked = c4; break;
   case(4):   picked = c5; break;
  }
  //draw circle from centre
  fill(picked);
  if(_m==0 || millis()>_m + 3000) //wait for 3sec then draw circle again
    {ellipse(width/2, height/2, t,t);
     t=t+20;
    }
  if (t>width+100)
  { t=0;
    _m = millis();
  }
  strokeWeight(40);

  //title OLYMPICS and its shadow
  fill(255,222,54);//yellow
  textFont(_font, 100);  
  text(_backTitle, width/9, height/2-1);
  fill(random(40,150));
  text(_backTitle, width/9-2, height/2);
  //tilte LONDON2012 and its shadow
  fill(255,222,54);//yelllow
  text(_frontTitle, width/9, height/2+99);
  fill(random(60,250));
  text(_frontTitle, width/9-2, height/2+100);
  
  
  //the moving text "winner"
  if (_winnerX > width+600) { 
   rightway=false;
  }
  //moving to right
  if (rightway==true){
    _winnerX = _winnerX + 10;
  }else if (rightway==false){  //moving to left
    _winnerX = _winnerX - 10;
    if(_winnerX<-600)
    {//_winnerX=0;
    rightway=true;
    }
  }
  fill(255,255,255,230);
  textFont(_font2, 250);
  text("WINNERS", _winnerX-600,  height/2+100);
  
  //five small circles moving from right to left and back
  if ( _cx > width+200 )
  {  
     circleRight = false;
  }
  if (circleRight==true){
  _cx = _cx + 50;
  }else if(circleRight==false){
  _cx = _cx -50;
  if(_cx<-100){
    _cx=0;
    circleRight= true;
   }  
  }

  noStroke();
  fill(255,0,0);
  drawCircle(_cx-100,_cy);
  drawCircle(_cx-100,height-20);
  
}

void drawCircle(int _cx, int _cy){
  fill(1,133,195);
  ellipse(_cx, _cy, 10,10);
  fill(247,194,50);
  ellipse(_cx+20, _cy, 10,10);
  fill(0);
  ellipse(_cx+40, _cy, 10,10);
  fill(0,158,68);
  ellipse(_cx+60, _cy, 10,10);
  fill(234,0,43);
  ellipse(_cx+80, _cy, 10,10); 
}
void drawCircle2(int _cx, int _cy){
  
  stroke(1,133,195);
  strokeWeight(2);
  fill(255);
  ellipse(_cx, _cy, 10,10);
  stroke(247,194,50);
  ellipse(_cx+20, _cy, 10,10);
  stroke(0);
  ellipse(_cx+40, _cy, 10,10);
  stroke(0,158,68);
  ellipse(_cx+60, _cy, 10,10);
  stroke(234,0,43);
  ellipse(_cx+80, _cy, 10,10); 
}


