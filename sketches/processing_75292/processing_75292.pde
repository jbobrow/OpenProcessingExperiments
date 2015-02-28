
void setup (){
  size(800,800);
  smooth();
  colorMode(HSB, 250, 100, 150, 100);

  strokeWeight(.5);
  background(0,0,.100);
}

void draw (){

  background(150,random(255),random(255));
  fill(random(156));
  for(int i = 0; i < 10; i++ ){
    rotate(radians(10));
    quad(20,30,300,400,600,300,68,900);
    triangle(i++*2, i++*4, i++*6, i++*8, i++*10, i++*12);
  }
}
