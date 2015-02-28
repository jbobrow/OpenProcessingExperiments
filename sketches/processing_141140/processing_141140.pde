
float r = 2;
float theta = 0;
float back = 0;

void setup() {
  size(200, 200);
  background(0);
  smooth();
}

void draw() {
  float x = r * cos(theta); //polar to cartesian conversion
  float y = r * sin(theta);

  noStroke();
  fill(back+200, back+255, back+50, theta+5);
  ellipse(x+width/2, y+height/2, 2, 2);

  theta += 0.02; //increment angle
  r+=0.02;
  println(back);
  
  if (r>150 ){
    r=2;
    back = back+10;
  }

//  if (r<=10) {
//    r+=0.02;
//  } 
//  else{
//    r-=0.02;
//  }

}



