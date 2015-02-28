

PFont font;
 
float x=0.0;
 
void setup(){
  size(250,250);
  font= createFont("helvetica",20);
  background(0);
  textFont(font);
}
 
void draw(){
 textSize(x);
  fill(x,x+50,x*8,x);

  text("N6G4N5", 0,x);
 
  x+=1.0;//speed
  if(x>height){
    x=50;
  }
}

 
void mouseMoved(){
  x+=10;//mouse move increasing speed
  noStroke();
  if(x>=height){
    x=0;}
   
}


