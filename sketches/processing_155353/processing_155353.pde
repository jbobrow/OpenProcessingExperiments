
void setup() {
size(800,800);
}
  void draw(){
    background(0);
    stroke(255);
    fill(153,210,164);
    translate(width/2, height/2); 
    for (int r = 0; r < 360; r = r + 2){
    rotate(r+ mouseY);
    quad(10,10,50,125,150,150,125,50);
  }
   if (mousePressed){
  saveFrame("b-###.png");
    }
  }
  
