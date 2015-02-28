
// Experiment_02_Internet_Exercise

void setup() {
  size(800,600);
  background(160,218,255);
  smooth();
}
 
void draw() {

  //Body
  float a = random(10,800);
  float b = random(10,800); 
  float c = random(10,800);
  float d = random(10,800);  
  float ab = random(0,555);
  float bc = random(0,555);
  stroke(ab,bc);

  line(200,300,a,b);
  line(400,200,c,d);
}
// Albert Cordero

