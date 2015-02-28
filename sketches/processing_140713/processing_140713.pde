
//Copyright Christopher Henley 2014

int i=0;
float xVal=0;
float y,yi;


String words[]={"PShape","arc()","bezier()",
"class","false","import","fill()","loadShape()",
"point()","curveDetail()"};
float yVals[]=new float[words.length];

void setup(){
  size(400,400);
  y=10;
  yi=width/words.length;
  background(0);
  for (int i=0; i<words.length; i++){
    yVals[i]=y+yi;
    y+=yi;
  }
}

void draw(){
  prepareWindow();
  drawString();
  moveString();
}

void prepareWindow(){
  background(0,20);
}

void moveString(){
  xVal++;
  if(xVal>width){
    xVal=-30;
  }
}

void drawString(){
  fill(255);
  for (int i=0; i<words.length; i++){
    text(words[i],xVal,yVals[i]);
  }
}







