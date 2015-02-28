
YinYang yinyang;
float X = 10, Y = 0, Z = 0;
float sigma = 10, rho = 28, beta = 8.0/3;
float step = .0003f;
float spin = .01f;

void setup(){
  size(800, 800);
  yinyang = new YinYang(400);
}

void draw(){
  background(127);
  
  X += sigma*(Y-X)*step;
  Y += (X*(rho-Z)-Y)*step;
  Z += (X*Y - beta*Z)*step;
  
  yinyang.theta = atan(Y*0.09);
  yinyang.phi += X*spin;
  yinyang.lambda = atan(Z/(rho-1))/PI;
}



