

PFont lie;
PFont whopper;

void setup(){
  size(800, 800);
  smooth();
    lie = loadFont("AmericanTypewriter-Bold-48.vlw");
    whopper = loadFont("Chalkduster-48.vlw");
        
}
  
  void draw(){
    float backCol = map(mouseY, 0, height, 0, 255);
    background(backCol);
    float tSize = map(mouseY, 0, height, 10, 95);
    float tCol = map(mouseY, 0, height, 255, 0);
        fill(tCol);
  if (mouseY < width/2){
    textFont(lie);
    textSize(tSize);

    text("lie", 1, mouseY);  
  }else{
      textFont(whopper);
      textSize(tSize);
  text("You're Fucked", 1, mouseY);     
  }
}

