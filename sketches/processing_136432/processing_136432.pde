
PFont f;
  String [] topics = {"gaming","web dev","creative code","business","inspire","failure","hardware","storytelling","workshop"};
  int [] totals = {4,17,15,6,30,3,8,7,2};
  color [] colors = {#10c5b2,#2d81d8,#0cab09,#ff7510,#e82b7e,#a77e60,#275498,#8e44c7,#e074e7};
  int i = 0;
  
void setup() {
  size(600, 600); 
  f = createFont("Georgia",16,true);
  textFont(f);
}

void draw() {
   background(255);
   int diam = totals[i];
   ellipseMode(CENTER);
   float x = width/2;
   float y = height/2;
   noStroke();
   color colorstroke = colors[i];
   fill(colorstroke);
   ellipse(x,y,diam*14,diam*14);
   fill(0);
   textSize(14);
   textAlign(CENTER);
   text(topics[i],width/2,height-50);
   
  if (mouseX <= (x+30) && mouseX >= (x-30) && mouseY <= (y+30) && mouseY >= (y-30) ) {
    textAlign(CENTER);
    fill(255);
    textSize(26);
      text(totals[i],x,y+8);      
} 
} 
  
 void mouseReleased() {
   if (i < totals.length-1) {
     i++; 
   } else {
     i = 0;
 }
 }


