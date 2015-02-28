
float x=150;
 
void setup() {
 size(200,200);
 noLoop();
 noStroke();
 }
 
 void draw() {
 background(255);
 fill(0);
 for( float a=0; a<(PI*10); a=a+0.01) {
 ellipse(100+x*cos(a),100+x*sin(a),15,15);
 x = x-0.05;
 }
}

                
                
