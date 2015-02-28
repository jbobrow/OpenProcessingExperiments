

  // Even though there are multiple objects, we still only need one class.
// No matter how many cookies we make, only one cookie cutter is needed.
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
 
  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
 
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
 
  void drive() {
    ypos = ypos + yspeed;
    if (ypos > height) {
      ypos = 0;
 }
 
Car rex;
Car ben;
Car ted;
void setup(){
  size(950,850);

  rex = new Car(color(200,0,0), 50.0, 355, -10);
  ben = new Car(color(100,0,0), 25.0, 255, -20);  
  ted = new Car(color(50,0,0), 40.0, 112, -15);
}
void draw(){
  background(200,120,140,130);
 rex.display();
  rex.drive();  
  ben.display();
  ben.drive();
   ted.display();
    ted.drive();
if(mousePressed == true){
  ben = new Car(color(100,0,0), 50.0, 255, 0);
rex = new Car(color(200,0,0), 50.0, 255, 0);
ted = new Car(color(50,0,0), 40.0, 112, -15);
text ("" + mouseX + ", " + mouseY, 100, 150);
}}

                
                
