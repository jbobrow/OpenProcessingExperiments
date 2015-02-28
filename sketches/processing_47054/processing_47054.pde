
float a=0.0;
float inc = TWO_PI/25.0;
  float sz; 
void setup(){
  size(800,600);
  background(0);
  smooth();
  frameRate(24);

}
 
 
 
void draw(){
   
   noStroke();
    fill(0,0,0, 4);
    rect(0, 0, width, height);
    
  for (int i=0; i<width; i=i+20){
    strokeWeight(random(5));
    stroke(5, 5,random(127), random(127));
  sz = random(600);
   ellipse(i*sin(a),random(50,width/2), sz*sin(a), sz*sin(a));
    a = a + inc;
  }
   rotate (degrees(45));
}


