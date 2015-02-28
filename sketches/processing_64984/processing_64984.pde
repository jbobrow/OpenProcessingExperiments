
size(600, 600);
colorMode(HSB, 360, 100, 100);
rectMode(CENTER);
background(250, 99, 50);
translate(width/2, height/2);
noStroke();
smooth();

float r, theta, x, x1;
float sz = 5.;    //ellipse,rectサイズ
float num = 6.;   //1周 num*2個


r=0.;
for(int i=1; i<20; i++){
  r+=20.;
  fill(60, 99, 99, 10);
  ellipse(0, 0, 2.*r, 2.*r);
  rotate( radians(60./num) );
  fill(20*i, 99, 99);

for(theta=0.; theta<360; theta+=180./num){
  x = r * cos(radians(theta));
  pushMatrix();
  if(theta<180){
    translate(x, sqrt(r*r-x*x));
    rotate(radians(theta-135.));
    if(i%2 == 0) ellipse(0, 0, sz, sz);
    else         rect(0, 0, sz*i*0.5, sz*i*0.5);
  } else {
    translate(x, -sqrt(r*r-x*x));
    rotate(radians(theta-135.));
    if(i%2 == 0) ellipse(0, 0, sz, sz);
    else         rect(0, 0, sz*i*0.5, sz*i*0.5);
  }
  popMatrix();
}

}
