
PFont pick;
PFont live;

void setup(){
  size(800,500);
  background(227,216,188);
  pick = loadFont("ClarendonLTStd-Light-30.vlw"); 
  live = loadFont("BudmoJiggler-70.vlw"); 
 fill(149,203,55);
  textSize(30);
  textFont(live);
  text("Get Lively",100,100); 
}

void draw(){
  
  
}

void mouseDragged(){
  fill(100,129,34,80);
  textSize(30);
  textFont(pick);
  text("Pick your feet up kid.",mouseX,mouseY);
}


