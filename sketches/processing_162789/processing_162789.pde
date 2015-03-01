
// CONTROLS ARE 'Z' FOR BUILDING
//' ' FOR DOOR
//CLICK FOR WINDOW
void setup(){
  size(800,800);
frameRate(30);
background(0);
}

void draw(){
  if (mousePressed){
  window(mouseX,mouseY);
}
}

void window(int x, int y){
  rect (x,y,50,50);
  line (x,y+25,x+50,y+25);
  line (x+25,y,x+25,y+50);
}
void structure(int x, int y){
  rect(x,y,random(125,300),800);
}

void door(int x,int y){
  rect(x,y,20,50);
  ellipse(x+3,y+20,3,3);
}
void keyPressed(){
  if(key == 'z'){
  structure(mouseX, mouseY);
  }
  if(key == ' '){
   door(mouseX,750); 
  }
}
