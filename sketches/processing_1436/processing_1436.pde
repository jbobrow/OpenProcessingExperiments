
void setup () {
  smooth();
  background(255);
  frameRate(100);
  size(900, 500);
}
float rX, rY = 0;
int i = 0;
void circle(){
    strokeWeight(0.1);
    float br = 10;
    float x = random (br, width-br);
    float y = random (br, height-br);
    fill(#FFF000, 10);    
    noStroke();
    ellipse(x,y,10,10);
    noFill();
    fill(100);
    stroke(100);    
    ellipse(x,y,2,2);
    noFill();
    //ellipse(x,y,120,120);
    if (rX != 0 || rY != 0) {
      stroke(255,i++,0);
      line (x,y,rX,rY);
      if(i == 250){
        i = 0;
      }
    }
    rX = x;
    rY = y;
}
void draw (){
  circle();
}  


