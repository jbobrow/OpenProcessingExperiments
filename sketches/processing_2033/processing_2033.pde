
float h = 202;
//float s= random(50);
//float b= random(50);

void setup() {
  size(400,400);
  noFill();
  background(0);

}
void draw(){ 
  translate(width/2,height/2);
 // background(0);
  stroke (h,96+random(10),56+random(10),5
 );
  strokeWeight(6);
  float tamcirx = random(width);
    float tamciry = random(height);
  ellipse(0,0,tamcirx,tamciry);

//save("pildora.png");
}


