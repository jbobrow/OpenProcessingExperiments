
float x=400;
float y=125;
float ym=0;
float xm=3;
float yg=.05;

void setup(){
  size(950,200);
  smooth();
    background(0);
    
    PFont font;
    font=loadFont("VisitorTT1BRK-48.vlw");
      textFont(font,100);
      textAlign(CENTER);
    
}

void draw(){
  fill(0,25);
  noStroke();
  rect(0,0,width,height);
  fill(255);
  x=x+xm;
  y=y+ym;
  ym=ym+yg;
  

  text("Daniel",x,y);
  
  if(y>height){
    ym=-ym;
  }
  if(x>width-150){
    xm=-xm;
  }
  if(x<150){
    xm=-xm;
  }
}
  
  

