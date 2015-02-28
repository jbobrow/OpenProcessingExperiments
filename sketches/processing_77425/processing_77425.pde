
int X=20;
  int Y=200;
  int inc=0;

void setup(){
  frameRate(10); 
  size(800,400);
  background(252,0,63);

 
}
 
void draw(){

   
    PFont texto1;
    texto1= loadFont ("century.vlw");
    textFont(texto1);
    fill(252,0,60);
    textSize(100);
    rect(0,0,800,400);
    fill(255);
    text("S",X,200);
    text("O",X+inc,200);
    text("F",X+inc*2,200);
    text("I",X+inc*3,200);
    text("A",X+inc*4,200);
     inc=inc+5;
    
      if(X+inc*4>=width-60){
       noLoop(); 
    
    background(252,0,63);  
    text("S",random(width),random(height));
    text("O",random(width),random(height));
    text("F",random(width),random(height));
    text("I",random(width),random(height));
    text("A",random(width),random(height));

      }
}
