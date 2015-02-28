
int x=400;
int y=0;
int c=0;
boolean cat = false;
boolean mouse = false;
void setup(){
  size(400,400);
  colorMode(HSB);
  background(0);
}
void draw(){
  stroke(c,255,255);
  
    if(cat==true){
    background(0);
    cat = false;
    }
  if(mousePressed==true){
    mouse = !mouse;
    line(mouseX,mouseY,x,y);
    c++;
    if(c==255){
      c=0;

    }
  }
}    
void keyPressed () {
  if (key=='c'){
    cat = !cat;
}
}
  


