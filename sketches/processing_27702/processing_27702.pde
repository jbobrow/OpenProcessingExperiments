
PShape face;
PFont font;
int s;
int m;
int blink;



void setup() {
  size(640,480);
 face= loadShape("face.svg"); //svg file of head
  smooth();
  font= loadFont("HelveticaNeue-Bold-200.vlw"); //Hour font name
  textFont(font,325);
}

void draw() {
   background(0);
  
  m= minute();
 
  PShape openTurn= face.getChild(m*2);//open
  PShape closeTurn= face.getChild(m*2+1);//close

  if(second()!=s){
    s= second();
    blink= millis();
  }

  if(millis()<blink+75) {
    shape(closeTurn,340,90);
 
    
    
  } 
  else {
shape(openTurn,340,90);
  
  }
  
    fill(255,0,0,100);
  text(hour(),-25, 390);
  
  }
  



