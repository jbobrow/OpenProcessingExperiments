
void setup() {
  size (800,600);
  background(0);

}

void draw(){
  //translate (horizontal,vertical)
  translate(250,250);
  rotate(radians(random(360)));
  rect(0,0,100,100);
  rect(100,100,50,50);
}

