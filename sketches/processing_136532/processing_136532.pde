
//Jordana Bungard    
//Feb 27,14 Use Arrays to println something
float[] x = new float[1000];
void setup() {
size(500, 500);
smooth();
noStroke();
frameRate(20);
fill(255, 200,100,5);//yellow
for (int i = 0; i < x.length; i++) {
x[i] = random(-100, 200); }
}
void draw() {
background(0);
for (int i = 0; i < x.length; i++) {
x[i] += 0.5;
float y = i * 0.7;
triangle(x[i],y,0,0,0.70,6);//flashlight beam
triangle(x[i],y,400,400,0.70,6);//flashlight beam
pushMatrix();
rotate(x[i]);
println("bright!!");
popMatrix();
println("shiny!!");
ellipse(400,400,25,25);
    println("GHOST!!!");
}
eye(65,44);//ghost
eye(30,50);//ghost
eye(430,350);//person
eye(400,350);//person
}
  void eye( int a, int z){
    fill(255);
    ellipse(a,z,30,30);
    fill(0);
    ellipse(a+10,z,15,15);
  fill(255,200,100,5);//yellow again
}
