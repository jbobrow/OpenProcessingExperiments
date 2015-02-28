
int X=20;
  int Y=200;
  int inc=0;
 
void setup(){
  frameRate(25);
  size(600,300);
  background(120,180,30);
 
  
}
  
void draw(){
 
    
    PFont texto1;
    texto1= loadFont ("PalatinoLinotype-Bold-100.vlw");
    textFont(texto1);
    fill(120,180,30);
    textSize(200);
    rect(0,0,600,400);
    fill(255);
    text("P",X,180);
    text("e",X+inc,180);
    text("d",X+inc*1.5,180);
    text("r",X+inc*2.5,180);
    text("o",X+inc*3.5,180);
     inc=inc+5;
     
      if(X+inc*3>=width-100){
       noLoop();
     
    background(20,120,180); 
    text("P",random(width),random(height));
    text("e",random(width),random(height));
    text("d",random(width),random(height));
    text("r",random(width),random(height));
    text("o",random(width),random(height));
 
      }
}

