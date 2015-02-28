
int secs;
int brush;
boolean isSolid;
boolean randomBrush;
int brushR, brushG, brushB;

color brushColor;

void setup(){
  size(400,400);
  reset();
}

void reset(){
  background(0); 
  secs = 1;
  brush = 1;
  isSolid = true;
  randomBrush = false;
//  brushColor = color(255);
  brushR = 255;
  brushG = 255;
  brushB = 255;
}

void draw(){
  translate(width/2.0, height/2.0);
  strokeWeight(brush);
  if(randomBrush){ 
    strokeWeight(random(1,10));
  }
  if(isSolid){
    stroke(color(brushR, brushG, brushB));
  } 
  else {
    stroke( color( random(0,255),random(0,255),random(0,255)));
  }
  for(int i=0; i<secs; i++){
    rotate(TWO_PI/float(secs));
    if(mousePressed){
      line( mouseX-200, mouseY-200, pmouseX-200, pmouseY-200);
    }
  }
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){ 
      secs = constrain(++secs, 1, 200); 
    }
    if(keyCode==DOWN){ 
      secs = constrain(--secs, 1, 200); 
    }
    if(keyCode==LEFT){ 
      brush = constrain(++brush, 1, 10); 
    }
    if(keyCode==RIGHT){ 
      brush = constrain(--brush, 1, 10); 
    }
  }
}
void keyTyped(){
  if(key == CODED){ return; }
  if(key == ' '){ 
    background(0); 
  }
  if(key=='z'){ 
    isSolid=!isSolid; 
  }
  if(key=='x'){
    randomBrush=!randomBrush;
  }
  if(key=='q'){ 
    brushR = constrain( brushR+5, 0, 255);
  }
  if(key=='a'){
    brushR = constrain( brushR-5, 0, 255);
  }
  if(key=='w'){ 
    brushG = constrain( brushG+5, 0, 255);
  }
  if(key=='s'){
    brushG = constrain( brushG-5, 0, 255);
  }
  if(key=='e'){ 
    brushB = constrain( brushB+5, 0, 255);
  }
  if(key=='d'){
    brushB = constrain( brushB-5, 0, 255);
  }
  if(key=='r'){ 
    brushR = constrain( brushR+5, 0, 255);
    brushG = constrain( brushG+5, 0, 255);
    brushB = constrain( brushB+5, 0, 255);
  }
  if(key=='f'){
    brushR = constrain( brushR-5, 0, 255);
    brushG = constrain( brushG-5, 0, 255);
    brushB = constrain( brushB-5, 0, 255);
  }
  if(key=='c'){ 
    brushR = 0;
    brushG = 0;
    brushB = 0;
  }
  if(key=='v'){
    brushR = 255;
    brushG = 255;
    brushB = 255;
  }



}




