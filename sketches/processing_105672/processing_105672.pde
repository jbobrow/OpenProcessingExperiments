
int v = 20;
int h = 5;
color[][] colors;

void setup() {
  size(800, 800);
  noStroke();
  colors = new color[h][v];
  for(int i=0;i<h;i++) {
  for(int j=0;j<v;j++) {
  colors[i][j] = color( (5*i+mouseY), ((i+j)), (mouseX) );       
    }
  }
}
void draw() {  
  background(0,mouseY,mouseX);   
{
  for(int i=0;i<h;i++) {
    for(int j=0;j<h;j++) {  
      fill(colors[i][j]);
      rect(0, mouseY, 20, 10,50);
      if(mousePressed == true) 
      fill(random(250),mouseX,mouseY);
      rect(i*(width/h), j*(height/v), 200, 300);
      fill(255);
      textSize(100);
      text("P E O P L E !",100,300);
      textSize(30);
      text("THIS IS THE SPIRIT!",150,600);
      }
      } 
      }
      }
