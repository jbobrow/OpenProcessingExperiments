
/* DirtyHair_b // by Jorge Nieto @ July 2011

****PLEASE DONT USE FOR YOUR OWN PROFIT****

Click for Invert.
Press any key for reset.
*/

boolean inverted = false;
int tam = 500;
float x, y, xx = -30, yy = -40;
int lineCounter = 0, i = 0;

void setup(){
background(255);
size(500,500); 
smooth();
frameRate(20);
}

void draw(){
drawLines(inverted);
}

void keyPressed(){
reset();
}

void mousePressed(){
invertColor();
}

void reset(){
 if(inverted){
 background(0); 
 }else{
 background(255);
 }
 float xx = -20, yy = -2;
 //lineCounter = 0;
 i = 0;
}

void invertColor(){
 filter(INVERT); 
 if(inverted){
 inverted = false;
 }else{
 inverted = true;
 }
}

void drawLines(boolean inverted){
  int c = tam/2;
  float ctam = random(7);
  color lcolor;
  color ecolor;
  if(inverted){//Negro
  ecolor = color(200,200,200,140);
  lcolor = color(255,255,255,90);
  }else{//Blanco
  ecolor = color(0,0,0,200/ctam);
  lcolor = color(0,0,0,90);
  }
 
  x = random(tam/1.1+60)*sin(i)+c;
  y = random(tam/1.1+60)*cos(i)+c;
  
  stroke(lcolor); 
  strokeWeight(random(0.5)); 
  line(x, y, xx, yy);
  
  fill(ecolor);
  noStroke();
  ellipse(x,y,ctam,ctam);
  //lineCounter++;
  //println(lineCounter);
  xx = x;
  yy = y;
  i = i + 2;
}



                
                                
