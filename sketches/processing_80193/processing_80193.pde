
int colorFons= 220;
int x= 50;
int y= 50;
int offsetX= 0;
int offsetY= 0;

void setup (){
    size(200, 200);
    noStroke();
}

void draw(){
  background (255);
  dibuixa();
  cambiaColor();
  mousePressed();
}
void dibuixa(){
   fill (colorFons);
   rect (x, y, 100, 50);
}
void cambiaColor(){
   if (mouseX > x && mouseX < x+100 && mouseY > y && mouseY < y +50){
      if (mousePressed) {
        colorFons = 0;
        x = mouseX - offsetX;
        y = mouseY - offsetY;
      } else {
        colorFons = 120; 
      }
    }
    else {
      colorFons = 200;
    }
}
void mousePressed(){
    offsetX = mouseX - x;
    offsetY = mouseY -y;
}
  

