
PFont futura;
float x=50;
float y=75;
int inc= 0;

void setup(){
 size(400,100);
 smooth();
 frameRate(10);
 
}


void draw(){
  futura=loadFont("Futura-Medium-48.vlw");
  background(0);
  
  textFont(futura);
  text("A",50,y);
  
  text("L",x+inc*2,y);

  text("E",x+inc*3,y);

  text("X",x+inc*4,y);
  
    inc=inc+5;
  if(x+inc*4>=180) {
    noLoop();
    background(0);
    
    text("A",random(300),random(80));
    text("L",random(300),random(80));
    text("E",random(300),random(80));
    text("X",random(300),random(80));

    
    
  }
 

  
  
}

