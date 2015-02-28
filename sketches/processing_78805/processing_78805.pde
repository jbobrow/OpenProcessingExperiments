
// define variables
int t = 0;
float w = 0;

// set up canvas
size(480,480);
background(255,255,255);
// draw zero axis
stroke(200,200,200);
line(0,height/2,width,height/2);
stroke(0,0,0);

// plot sample path
while (t<600) { // repeat
  // Draw increment from N(0,8)
  x = normal(0,8);
  line(t,height/2-w,t+1,height/2-(w+x));
  t = t+1;
  w = w+x;
}

float normal(mu, sigma) {
  // Use Box-Muller transform to draw from Normal(mu,sigma^2)
  return sigma*sqrt(-2*log(random(0,1)))*cos(2*PI*random(0,1))+mu;
}
