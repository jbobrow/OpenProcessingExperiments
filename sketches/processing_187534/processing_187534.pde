
float theta =random(0, 6.289);

void setup(0){
  size(650, 750);
  frameRate(79);
}
void draw()
{
  background(0);
// theta = radians((mouseX / (float) width) *360);
  theta=theta+0.05;
  translate(width/2, height/2);
  
  for (int i =0; i <8; i++ ){
  branch(height/4,7);
  rotate(PI/4);
}
}

void branch(float len, int num)
{
  len =len/sqrt(2);
  num = num-1;
  if ((len > 1) && (num > 0))
  {
    pushMatrix();
    rotate(theta);
    stroke(152,247,255);
    strokeWeight(num/1);
    line(0, 0, 0, -len/3);
    translate(0, -len/3);
    branch(len, num);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    stroke(152,247,999);
    strokeWeight(num/9);
    line(0, 0, 0, -len);
    translate(0, -len);
    branch(len, num);
    popMatrix();
    
    pushMatrix();
    rotate(-2*theta);
    stroke(177,247,255);
    strokeWeight(num/4);
    line(0, 0, 0, -len/6);
    translate(0, -len/6);
    branch(len, num);
    popMatrix();
  }
}

