
float stDev (float a, float b, float c, float d, float e) {
  float myMean=(a+b+c+d+e)/5;
  float myVar=(sq(a-myMean)+sq(b-myMean)+sq(c-myMean)+sq(d-myMean)+sq(e-myMean))/5;
  float myStDev=sqrt(myVar);
  return myStDev;
}

void setup() {
  println(stDev(600, 470, 170, 430, 300));
  println(stDev(100, 200, 300, 400, 500));
  println(stDev(5, 25, 26, 27, 28));
}

void draw() {
}



