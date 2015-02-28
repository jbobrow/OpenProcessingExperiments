
color buttonColor, baseColor;
color highlightButton;
color currentColor;
color pressedColor;
PFont font10;
int rectx=200;
int recty=150;
int rectw=50;
int recth=20;

boolean mouseOver = false;

void setup(){
  size(640,480);
  buttonColor = color(100);
  highlightButton = color(45,250,234);
  baseColor = color(255);
  pressedColor = color(255,3,3);
  currentColor = baseColor;
  font10 = loadFont("Ebrima-10.vlw");
  
  
}

void draw(){
  update(mouseX, mouseY);
  background(currentColor);
  
  if (mouseOver) {
    stroke(highlightButton);
    
  }else{
    stroke(0);
    
  }
  fill(buttonColor);
  rect(rectx, recty, rectw, recth);
  textFont(font10);
  fill(0);
  text("BUTTON",rectx+25,recty+10);
  textAlign(CENTER);
}

void update(int x, int y){
  if (mouseOver(rectx,recty,rectw,recth)){
    mouseOver=true;
    
  }else{
    mouseOver=false;
  }
}
boolean mouseOver(int x,int y, int width, int height){
  if(mouseX> x && mouseX < x+width && mouseY > y && mouseY < y+height) {
    return true;
  } else {
    return false;
  }
}

  void mousePressed(){
    if (mouseOver){
      buttonColor=pressedColor;
    }
    
  }
  


