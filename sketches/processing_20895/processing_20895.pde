
//old school tron pattern
//Jason Fitzgerald
//for loop pattern


void setup() {
  size(400,400);
  colorMode(HSB,360,100,100);
  smooth();

}
void draw() {


  stroke(174, 100, 100);
  strokeWeight(2);
  for(int y = 00; y < 400; y += 20) {
    for(int x = 0; x < 400; x += 20) {
      fill(251, 100, 75);
      rect(x,y, 20, 20);
    }
  }  
  fill(220,100,100);
  for(int d = 200; d > 0; d -= 25) {
    strokeWeight(5);
    stroke(0,0,100);
    ellipse(200,200, d, d);
  }
}





