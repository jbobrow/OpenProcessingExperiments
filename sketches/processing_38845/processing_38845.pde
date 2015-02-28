
int counter;
boolean pressed;
void setup() {
  colorMode(HSB);
  rectMode (CENTER);
  size(800, 200);
  background(180, 255, 255);
  fill (0, 255, 255);
  //counter = 1;
  pressed = true;
}

void draw() {
  for (int i = 0; i < counter; i = i + 1) {
    rect (10 + i* 20, height/2, 15, 30);
  }
  /*if (mousePressed) {
    counter = counter + 1;
    println(counter);
  } */
  
  
  if (mousePressed){
   
   if (pressed == false) {
   counter = counter + 1;
   pressed = true;
   } 
   }
   if (mousePressed == false){
   pressed = false;
   }
}


