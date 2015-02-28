
int x1;
int y1;
int w1;
int h1;
int state1;
 
int x2;
int y2;
int w2;
int h2;
int state2;
 
int x3;
int y3;
int w3;
int h3;
int state3;
int timeout3;
 
 
void setup() {
  size(400,400);

  textAlign(CENTER,TOP);
   
  // HOLD BUTTON
  x1 = width/4-25;
  y1 = height/2-25;
  w1 = 50;
  h1 = 50;
  state1 = 0;
   
  // TOGGLE BUTTON
  x2 = width/4*2-25;
  y2 = height/2-25;
  w2 = 50;
  h2 = 50;
  state2 = 0;
   
  // BANG BUTTON
  x3 = width/4*3-25;
  y3 = height/2-25;
  w3 = 50;
  h3 = 50;
  state2 = 0;
   
  noStroke();
}
 
void draw() {
   
  background(200);
   
  // HOLD BUTTON
  fill(50);
  text("HOLD",x1+w1/2,y1-18);
   
  if ( state1 == 1 ) {
     fill(250,18,208);
  } else {
     fill(10,250,8);
  }
  rect(x1,y1,w1,h1);
   
  // TOGGLE BUTTON
  fill(50);
  text("TOGGLE",x2+w2/2,y2-18);
   
  if ( state2 == 1 ) {
    fill(250,18,208);
  } else {
    fill(10,250,8);
  }
  rect(x2,y2,w2,h2);
   
   // BANG BUTTON
   fill(50);
   text("BANG",x3+w3/2,y3-18);
    
   if ( state3 == 1 && millis()>timeout3+350 ) {
    state3 = 0;
   }
    
   if ( state3 == 1 ) {
    fill(250,18,208);
  } else {
    fill(10,250,8);
  }
  rect(x3,y3,w3,h3);
   
}
 
void mousePressed() {
   
  if ( mouseX>x1 && mouseX<x1+w1 && mouseY>y1 && mouseY<y1+h1 ) {
     state1 = 1;
  }
     
  if ( mouseX>x2 && mouseX<x2+w2 && mouseY>y2 && mouseY<y2+h2 ) {
     if ( state2 == 0 ) {
      state2 = 1;
     } else {
       state2 = 0;
     }
  }
   
   if ( mouseX>x3 && mouseX<x3+w3 && mouseY>y3 && mouseY<y3+h3 ) {
     state3 = 1;
     timeout3 = millis();
  }
   
}
 
void mouseReleased() {
  state1 = 0;
}

