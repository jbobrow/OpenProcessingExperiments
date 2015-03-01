
PFont font;
int x,y;
int fade = 0;
int textSize = floor(random(16,32));
int sizeX = round(textSize*1.6);
int sizeY = textSize;

void setup(){
  font = createFont("Arial", 32, false);
  textFont(font, textSize);
  size(500,400);
  noStroke();
  textAlign(LEFT,TOP);
  x = floor(random(0,width-50));
  y = floor(random(0,height-50));
  colorMode(RGB,255,255,255,1000);
}

void draw(){
  background(0);
  if(mousePressed){
    for(int i = 51; i > 0; i--){
      fill(155-3*i,155-3*i,155-3*i);
      ellipse(mouseX,mouseY,1.3*i,1.3*i);
      if(mouseX > x && mouseX < x + sizeX && mouseY > y && mouseY < y + sizeY){
        sizeX = round(textSize*2.5);
        if(fade < 1000 && frameCount%3 == 0){
          fade += 1;
        }
      }
      else{
        sizeX = round(textSize*1.6);
        if(fade > 0 && frameCount%2 == 0){
          fade -= 1;
        }
      }
    }
  }
  //fill(255,255,255);
  //rect(x,y,sizeX,sizeY);
  fill(0,0,0,1000-fade);
  text("lost",x,y);
  fill(0,0,0,fade);
  text("found",x,y);
}
  


