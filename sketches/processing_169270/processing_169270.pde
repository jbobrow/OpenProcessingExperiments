
float t;  // time
int n;  // population number
float ne; // expected population number
float x;  // waiting time
float lambda = 0.06; // individual birth rate
float mu = 0.04; // individual death rate
int K = 1200; // immigration rate
float lambdan; // lambda_n
float mun;     // mu_n

 
void setup() {  //setup function called initially, only once
  size(480,480);    // set size of canvas
  background(255);  // set background white
  
  // plot expected value
  stroke(255, 0, 0);
  strokeWeight(4);
  for (int i = 0; i < width; i = i+1) {
    ne = 1/(lambda/(lambda - mu)/K + (1-lambda/(lambda - mu)/K)*exp(-(lambda - mu)*i));
    line(i, height-ne, i+1, height-ne);
  }

  stroke(0,0,0,5);  // set stroke colour to black with high transparency
  strokeWeight(1);

}
 
void draw() {  // this excecutes repeatedly
  t = 0;
  n = 1;
  while (t<800) { // repeat
    lambdan = n*(1-n/K)*lambda; // logistic birth
    mun = n*mu;   // simple death
    // draw random time x from Exp(lambda_n+mu_n)
    x = -log(random(0,1))/(lambdan+mun);
    // plot function between t and t+x
    line(t,height-n,t+x,height-n);
    // update time
    t = t+x;
    // decide whether birth or death
    r = random(0,lambdan+mun);
    if (r < lambdan) {
      n = n+1; // birth
    } else {
      n = n-1; // death
    }
  }
}
