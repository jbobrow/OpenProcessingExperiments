
int z;
int j;
boolean gameOver;
ArrayList<Integer> genLines;
//Object b;



void setup() {
  size(600, 600);
  z = 0;
  frameRate(30);
  j = 100;
  gameOver = false;
   
}
void draw() {
  background(40);
  smooth();
  if(gameOver) {
    textSize(30);
    text(z, width/2, height/2);
    text("Game Over", width/2 -70, height/2 + 40);
    
  } else {
  
  Stick(mouseX, mouseY);
  textSize(20);
  text(z, width - 25, 20);
  z++;
  if(z >= j) {
    width = width - 13;
    j = j * 10;
  }
  drawLine();
  }


}
void Stick(float x, float y) {
  fill(255);
  ellipse(x, y, 35, 35);
  smooth();
  fill(255);
  line(x - 23, y + 27, x + 23, y + 27);
  line(x, y , x, y + 50); 
  line(x, y + 51, x - 15 , y + 80);
  line(x, y + 51, x + 15, y + 80);
  stroke(255);
  smooth();
}
void drawLine() {
  
int x = 40;
int y = 50;
if(x < width) {
//fill(255);
translate(x,0);
rect(-30, 10, y, 10);
y += x;

}
  
  
  
  
  /*genLines = new ArrayList();
int i;
int j;
int k;
int l;
int m;
genLines.add(-30,30
 
rect(i,j,k,l);
*/
  
}
  

  
  
  
  
  
  
  
  
  
  

