
void setup(){
  size(500,500);
  background(255);
}
void draw(){
  stroke(random(255),random(255),0);
  line(random(width),random(height),random(width),random(height));
  println(frameCount);
  //% is modulo, it calculates the remainder of a division (ex: a%b)
  //if the remainder is 0, it means that "a" is a multiple of "b"
  if(frameCount%120==0){
    background(255);
  }
}


