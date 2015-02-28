
final float a = 200; //Max amplitude
final int amountOfLines = 20; 
float s; //Separation between liens

void setup() {
  size(600, 700);
  s=(height-a)/amountOfLines;
}

void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, s+a);

  final int start = -width/2;
  final int end = width/2;


  for (int i=0;i<amountOfLines;i++) {
    
    //Black shape under White Line
    fill(0);
    noStroke();
 
    beginShape();
    curveVertex(start, mFunction(start, i)*a + i*s);
    for (int x=start;x<end;x+=5) {
      curveVertex(x, mFunction(x, i)*a + i*s);
    }
    curveVertex(end, mFunction(end, i)*a + i*s);
    curveVertex(end, mFunction(end, i)*a + i*s);
    vertex(start, mFunction(start, i)*a + i*s);
    endShape();


    
    //White Line
    noFill();
    stroke(255);

    beginShape();
    curveVertex(start, mFunction(start, i)*a + i*s);
    for (int x=start;x<end;x+=5) {
      curveVertex(x, mFunction(x, i)*a + i*s);
    }
    curveVertex(end, mFunction(end, i)*a + i*s);
    curveVertex(end, mFunction(end, i)*a + i*s);
    endShape();
  }
  
  popMatrix();

  fill(255);
  text(frameRate,20,20);
}

float mFunction(float x, int y) {
  x*=0.01;
  float currentValue = -noise(x+width, frameCount*0.01, y); //Add width (or any number in order to make x postive) so I dont get a symetric function 
  if (x==0) return currentValue;
  return currentValue*pow(sin(x)/x, 2); //currentValue modulated by Sinc, idea from how light difracts
}


