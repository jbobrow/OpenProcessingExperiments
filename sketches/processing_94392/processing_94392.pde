
int col;

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  frameRate(random(10,100));
}

void draw(){
  drawIt (width/2, height/2, 10);
  col = color(random(255),random(255),random(255),random(255));


}

void drawIt(float x, float y, float Itsize) {
  ellipse(x, height/10, y, y); 
  translate(10,10);
  rect(x, height/random(5), y/3, y/3);
  
  if(Itsize > 1) {
    Itsize = Itsize - 1;
    fill(col,10,col);
    drawIt(x - y/2, y/2, Itsize);
    fill(col);
    drawIt(x + y/2-10, y/2-10, Itsize);
    fill(col);
    drawIt(x + y/2-20, y/2-20, Itsize);
}
}
