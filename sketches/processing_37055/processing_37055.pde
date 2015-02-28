
void setup() {
size(500,500);
}

 void draw() {
   background(0,205,190); 
   rect(200,200,40, 200);
   stroke(255,0,0);
   fill(0,233,0);
   rectMode(CENTER);
   rect(mouseX, 200, 120, 20);
   triangle(10,10,60,60,0,60);
   ellipse(280, 46, 55, 55);
   
   strokeWeight(5);
   noFill();
   curve(0,0,50,80,100,200,mouseX,mouseY);
   
println(mouseX); 
 }



