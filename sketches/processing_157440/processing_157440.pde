
float angle;
void setup(){
  size(500,500);
  colorMode(HSB);
  noFill();
  strokeWeight(3);
}
void draw(){
  background(0);
  fill(255);
  ellipse(250,250,8,8);
  noFill();
  translate(250,250);
 //ellipse(0,0,100,100);
 //ellipse(0,0,200,200);
  for (float j=0; j<6; j++){
  for (float i=0; i<TWO_PI; i+=PI/8){
    stroke(200-j*40,240,240);
  line(j*50*cos(angle/(j+1)-PI/2+i),j*50*sin(angle/(j+1)-PI/2+i),(j+1)*50*cos(angle/(j+2)+i),(j+1)*50*sin(angle/(j+2)+i));
  }
  }
  stroke(100);
  angle+=PI/10;
 }



