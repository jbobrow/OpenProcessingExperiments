
int x = 0;
int y = 0;
int i=0;
int a=0;
int francobollo=255;

void setup() {
  size (400, 300);
    background (255);
}


void draw() {
///////////////////postcard

  stroke(0);
  //dashed line
  for (int i = 5; i <= height-10; i =  i+ 20) {
          line(200, 10+i, 200, i);
        }
        
  line(225,175,375,175);
    line(225,175+30,375,175+30);
      line(225,175+60,375,175+60);   
      
        fill(francobollo);
  rect(295, 25, 50, 50);
        
  if (mousePressed) {
    fill(0);
    ellipse(mouseX, mouseY, 5, 5);
    ellipse(mouseX, mouseY, 5, 5);
}

}

void keyPressed() {
  if (francobollo == 255) {
    francobollo = 0;
  }
}         
