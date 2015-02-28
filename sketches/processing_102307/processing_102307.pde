
int defaultN = 35;
int numberToFactor;
boolean showOutlines = true;
boolean checkPrimes = false;
boolean reversePrimes = false;
void setup() {
  size(570, 570);
  background(255);
  noLoop();
  smooth();
  numberToFactor = defaultN;
}

void draw() {
  PVector origin = new PVector(0.5*width, 0.5*height);
  int dimens = min(width, height);
  ArrayList product = primeFactors(numberToFactor);

  drawProduct(origin, dimens, product);
}

void drawProduct(PVector origin, float dimens, ArrayList prod) {
  if (prod.isEmpty()) {
    fill(20, 30, 200, 70);
    stroke(0);
    ellipse(origin.x, origin.y, .7*dimens, .7*dimens);
  }
  else {
    if (showOutlines) {
      noFill();
      stroke(0, 100, 30, 150);
      ellipse(origin.x, origin.y, 0.9*dimens, 0.9*dimens);
    }
    if (checkPrimes && prod.size()>1 && (Integer)prod.get(1)==1) {
      fill(200, 30, 20);
      noStroke();
      ellipse(origin.x, origin.y, .2*dimens, .2*dimens);
      prod.remove(prod.size()-1);
    }
    int p;
    if(reversePrimes)
      p = (Integer) prod.remove(prod.size()-1);
    else
      p = (Integer) prod.remove(0);
    float newDimens = dimens*sin(PI/p)/(1+sin(PI/p));
    for (int i=0; i<p; i++) {
      PVector newOrigin = new PVector(origin.x, origin.y);
      newOrigin.x += .5*0.9*(dimens-newDimens)*cos(2*PI*i/p - PI/2);
      newOrigin.y += .5*0.9*(dimens-newDimens)*sin(2*PI*i/p - PI/2);
      ArrayList prod0 = (ArrayList) prod.clone();
      drawProduct(newOrigin, newDimens, prod0);
    }
  }
}
ArrayList primeFactors(int N) {
  ArrayList returnable = new ArrayList();
  int testFactor = 2;
  while (N > 1) {
    if (N%testFactor == 0) {
      returnable.add(testFactor);
      N = N/testFactor;
    }
    else
      testFactor++; //Yes, this could be made slightly faster...
  }
  if (checkPrimes && returnable.size()==1)
    returnable.add(1);
  return returnable;
}
String formatFactors(ArrayList factos) {
  String returnable = numberToFactor + " = " + factos.get(factos.size()-1);
  for (int i=factos.size()-2; i>=0; i--)
    returnable += "*"+factos.remove(i);
  return returnable;
}

void update(int n) {
  numberToFactor = n;
  reset();
}
void reset() {
  background(255);
  redraw();
}
void toggleCheckOutline() {
  showOutlines = !showOutlines;
}

void toggleCheckPrimes() {
  checkPrimes = !checkPrimes;
}
void toggleOrderPrimes(){
	reversePrimes = !reversePrimes;
}
interface JavaScript {
  void printPrimeFactors(String s);
}
void bindJavascript(JavaScript js) {
  javascript = js;
}
JavaScript javascript;


