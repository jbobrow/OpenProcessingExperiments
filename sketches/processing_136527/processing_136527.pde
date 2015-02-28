
int myState = 0 ;
int M = 1;
PFont R ;
PImage btp ;

void setup(){
  size(300,300) ;
  R = createFont("CharlemagneStd-Bold-48.vlw",200);
 btp = loadImage("btp.jpg") ;
}

void draw() {
  image(btp,0,0,300,330);
 
 
  switch(myState) {
  case 0:
 fill(255,255,0);
  ellipse(height/2,width/2,50,50) ;
  fill(255);
  ellipse(height/2 - 10,width/2 - 7,10,10) ;
   ellipse(height/2 + 10,width/2 - 7,10,10) ;
fill(0);
   rectMode(CENTER);
   ellipse(height/2, width/2 + 5, 15,10);
  break ;
  
  case 1:

   fill(205,205,0);
  rect(height/2,width/2,50,50) ;
  fill(255);
  ellipse(height/2 - 10,width/2 - 7,10,10) ;
   ellipse(height/2 + 10,width/2 - 7,10,10) ;
fill(0);
   rectMode(CENTER);
   ellipse(height/2, width/2 + 5, 15,10);
  break ;
  
  case 2:
   fill(155,155,0);
  rect(height/2,width/2,50,50) ;
  fill(255);
  rect(height/2 - 10,width/2 - 7,10,10) ;
   rect(height/2 + 10,width/2 - 7,10,10) ;
fill(0);
   rectMode(CENTER);
   ellipse(height/2, width/2 + 5, 15,10);
  break ;
  
   case 3: 
   fill(105,105,0);
  rect(height/2,width/2,50,50) ;
  fill(255);
  rect(height/2 - 10,width/2 - 7,10,10) ;
   rect(height/2 + 10,width/2 - 7,10,10) ;
fill(0);
   rectMode(CENTER);
   rect(height/2, width/2 + 5, 15,10);
  break ;
  
  case 4:
   fill(100);
  rect(height/2,width/2,50,50) ;
  fill(255);
  rect(height/2 - 10,width/2 - 7,10,10) ;
   rect(height/2 + 10,width/2 - 7,10,10) ;
fill(0);
   rectMode(CENTER);
   rect(height/2, width/2 + 5, 15,10);
  break;
  
  case 5:
fill(150);
  rect(height/2,width/2,50,50) ;
  fill(255,0,0);
  rect(height/2 - 10,width/2 - 7,10,10) ;
   rect(height/2 + 10,width/2 - 7,10,10) ;
fill(0);
   rectMode(CENTER);
   rect(height/2, width/2 + 5, 15,1);
  break;
  
  case 6:
   textAlign(CENTER);
 textFont(R,30);
  text("Robots",150,75) ;
  text("Rule",150,225);
   fill(150);
     rect(150,125,3, 25) ;
  rect(height/2,width/2,50,50) ;
  fill(255,0,0);
  rect(height/2 - 10,width/2 - 7,10,10) ;
   rect(height/2 + 10,width/2 - 7,10,10) ;
fill(0);
   rectMode(CENTER);
   rect(height/2, width/2 + 5, 15,1);
   fill(#CB2929,random(10,1000));
   ellipse(151,108,10,10) ;
  break;
  
  
  }
}
void mousePressed() {
  myState = myState + M ;
  if(myState > 5) {
    M = -1 ;
  }
  if(myState < 1) {
    M = 1 ;
  }
}



