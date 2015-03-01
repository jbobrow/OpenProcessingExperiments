
void setup() {
  size (600,400);
  
  }

void draw() {
  background(102,59,106);
  ellipse(300,200,250,250);
  fill(0);
  ellipse(305,250,50,50);
  fill(111,38,38);
  ellipse(300,150,100,50);
  fill(0);
  ellipse(302,150,50,50);
  fill(111,38,38);
  strokeWeight(5);
  line(300,100,300,50);
  fill(111,38,38);
  ellipse(300,30,50,50);
  fill(111,38,38);

  // figure complete
  if (mousePressed) {
    fill(111,350,38);
    }
    else {
      fill (111,38,38); }
     
}
