
float r=150;

void setup() {

  size(200,200);

  noLoop();

  noStroke();

}



void draw() {

  background(255);

  fill(0);

  for( float a=0; a<(PI*10); a=a+0.01) {

    ellipse(100+r*cos(a),100+r*sin(a),15,15);

    r = r-0.05;

  }
}



                
                
