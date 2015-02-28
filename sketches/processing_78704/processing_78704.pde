
int X=20;
  int Y=200;
  int inc=0;
 
void setup(){
  frameRate(10);
  size(800,400);
  background(2,100,63);
 
  
}
  
void draw(){
 
    
    PFont texto1;
    texto1= loadFont ("century.vlw");
    textFont(texto1);
    fill(2,100,63);
    textSize(100);
    rect(0,0,800,400);
    fill(255);
    
    text("E",X,200);
    text("r",X+inc,200);
    text("r",X+inc*2,200);
    text("a",X+inc*3,200);
    
     inc=inc+5;
     
      if(X+inc*4>=width-60){
       noLoop();
     
    background(2,100,63); 
    text("E",random(width),random(height));
    text("r",random(width),random(height));
    text("r",random(width),random(height));
    text("a",random(width),random(height));
 
}
}
