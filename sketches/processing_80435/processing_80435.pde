
// define variables
int t = 0;
float w = 0;

// set up canvas
size(480,480);
background(255,255,255);
// draw zero axis
stroke(200,200,200);
line(0,440,width,440);
stroke(0,0,0);

// plot sample path
while (t<600) { // repeat
  // Draw increment from N(1,8)
  x = normal(1,8);
  line(t,440-w,t+1,440-(w+x));
  t = t+1;
  w = w+x;
}

float normal(mu, sigma) {
  // Use Box-Muller transform to draw from Normal(mu,sigma^2)
  return sigma*sqrt(-2*log(random(0,1)))*cos(2*PI*random(0,1))+mu;
}
