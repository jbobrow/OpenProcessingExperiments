
// CODE DAY 2 H.W. by Grace J
// making animated mint green pines 
// using int & floats

int slash = 5;
float a = 0;
float b = 100;
 
void setup(){
  background(0);
  size (600, 600);
}

void draw(){

   mousePressed = true;
   a = random(-100, 100);
   b = random(100, 255);
   // 100 makes it from a singular pt
   // 255 creates how far (space)
   
   stroke(slash, 199, slash, 100);
   // means the stroke is (5, color, 5, speed)
   // 199 is a mint green
   
   line(mouseX, mouseY, mouseX+a, mouseY+b);
   // creating lines with random values of a or b via MOUSE
   
   slash= floor(random(250));
   //trying new term "floor" which is just to round your random numbers

}



