
void setup(){ //
  size(1300, 600);
  background(200);
  noLoop();}
  
  void draw(){
  
    stroke(0);
    strokeWeight(2);
    fill(random(255), random(255), random(255));
    float X = random(width);
    float Y = random(height);
    float radius = 10;
    ellipse(X, Y, radius, radius);
    float mouseX;
    float mouseY;
    
    if mouseX = X +- radius && mouseY = Y +- radius){
    X == (random(0, X - 2*radius) || random(X + 2*radius, width));
   Y == (random(0, Y - 2*radius) || random(X + 2*radius, height));
   draw();}
    
