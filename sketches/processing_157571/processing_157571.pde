
float z,c = 0;
float m = 300;
int i=0; 
float n = 40.0;

void setup(){

 colorMode(HSB, 1);
  size(600, 600);
  background(0);
  noFill();
  noStroke();
  smooth();
}

void draw(){
  translate(width/2, height/2);
  //background(0);
  //if(frameCount%60==0) background(0);
  z = millis()/900.0;
  
  z += abs(sin(z));
 
  noStroke();
  beginShape(QUAD_STRIP);
  for(int i=1; i<=n; i++){

    c = (sin(z/5.0+i*TWO_PI/n));
    c = map(c, -1, 1, 0, 1);
      
    fill(
    c,
    1,
    i%2,
    0.1
    );
      
    vertex(m*cos(z+i*TWO_PI/n+c) , m*sin(z+i*TWO_PI/n+c) );
    vertex(m*sin(z-i*TWO_PI/n+c) , m*cos(z-i*TWO_PI/n+c) );
  }
  endShape(); 
     
      
}
