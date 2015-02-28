
float x = 0;

void setup() {
  size (500,500);
  background(0);
 stroke(255);
}

void change_color() {
    
   //change line color to purple 
if(random(200) > 100) {
  println("PURPLE");
  stroke(255,0,255);
} else{
  //change to blue
  stroke(0,0,255);
}
}





void draw() {
 //draw white line
  line(x, 200, x, 100);

//attempt to change color

if(random(100) > 55) {
  println("TRUE");
  change_color();
}else{
  println("FALSE");
  stroke(255);
}
  //movement
  x = x + 1;
 
  //repeat
  if(x>width) {
    x = 0;
   
  
}


}

