
void setup() {
  size(600, 600);
  background(58);
}

void draw() {
  smooth();
  for (int a = 100; a <= height-50; a += 200) {
  for (int b = 100; b <= width-50; b += 200) {
  
    noStroke();//-----------------circles
    fill(146,255,255);
    ellipse(a,b,10,10);
   
    stroke(226,251,219);//------------------ foreground
    line(a,b,0,300);
    line(a,b,600,300);
    line(a,b,300,0);
    line(a,b,300,600);
  
    strokeWeight(.05); //----------- background 
    stroke(124,213,216,50); 
    line(a,b,0,0);
    line(a,b,600,0);
    line(a,b,0,600);
    line(a, b, 600,600);

}
  }
}
