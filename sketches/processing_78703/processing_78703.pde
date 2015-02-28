
int X=20;
  int Y=200;
  int i=0;
  
void setup(){
  frameRate(20);
  size(1600,400);
  background(255,137,182);
  
   
}
   
void draw(){
  
     
    PFont texto1;
    texto1= loadFont ("AGaramondPro-Bold-48.vlw");
    textFont(texto1);
    fill(30,101,250);
    textSize(200);
    rect(0,0,600,400);
    fill(255);
    text("m",X,180);
    text("a",X+i,180);
    text("r",X+i*1.5,180);
    text("i",X+i*2.5,180);
    text("a",X+i*3.5,180);
    text("n",X+i*4.5,180);
    text("a",X+i*5.5,180);    
     i=i+5;
      
      if(X+i*3>=width-100){
       noLoop();
      
    background(250,232,30);
    text("m",random(width),random(height));
    text("a",random(width),random(height));
    text("r",random(width),random(height));
    text("i",random(width),random(height));
    text("a",random(width),random(height));
    text("n",random(width),random(height));
    text("p",random(width),random(height));
    text("a",random(width),random(height));
    text("l",random(width),random(height));
    text("l",random(width),random(height));
    text("a",random(width),random(height));
    text("r",random(width),random(height));
    text("e",random(width),random(height));
    text("s",random(width),random(height));
    
    
      }
}
