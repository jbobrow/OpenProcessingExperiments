
void setup () {
size (800,600);
smooth ();
float bullets = 16;
float guns = calculateGun(bullets);
println(guns);
}
float calculateGun(float w) {
float newNumber = w * 3;
return newNumber;
}


void draw () {
  background(57,64,66);
  fill(0);
  rect(0,0,800,400);
  line(0,400,800,400);
  for (int x=-120; x< width+100; x +=200){
  house(x,200);
  }
  
  for (int x=-120; x< width+100; x +=200){
    int gray = int(random(0));
  lines(x,200);
  }
  
}
void house(int x, int y){
  pushMatrix();
  translate (x,y);
  strokeWeight(1);
  smooth();
  stroke(1);
  fill(148,110,73);
  //roof1
  triangle(100,100,200,50,300,100);
  //house1
  rect(130,100,140,100);
popMatrix();

}
void lines (int a, int b){
  pushMatrix();
  translate(a,b);
  strokeWeight(2);
  stroke(2);
  fill(186,142,58);
  rect (0,300,80,10);
  popMatrix();
}


