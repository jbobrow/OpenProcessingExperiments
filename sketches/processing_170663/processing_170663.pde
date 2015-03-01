
float theta;
int units=4, frames=240, step, col;

void setup() {
  size(500, 500);
  smooth();
  step = width/units;

  strokeWeight(2);
}

void draw() {
  theta = 2*radians(frameCount);
  //println(theta);
  float szmin = .25*sqrt(2)*step;
  float szmax = .5*step;
  float diam = szmin;

  float mapmin = 0;
  float mapmax = step/2-diam*sqrt(3)/2;
  background(255,0,0);
   
  float sin = map(1.3*Math.sin(theta), -1, 1, mapmin,mapmax );
background(0,255,0);
  float yuragi = constrain(sin, mapmin, mapmax);
  boolean flash = (yuragi!=sin)? true : false;

  if(flash) {
    col = 0;
    background(#FF7171);
  }else{
    col = 255;
    background(#07B5E8);
  }
  stroke(col);
  fill(col);

  for (int i=-1; i<units+1; i++) {
    for (int j=-1; j<units+1; j++) {
      float zure = (j%2 == 0)? step/2 : 0;
      float x = (i+.5)*step + zure;
      float y = (j+.5)*step*sqrt(3)/2;;
      float px = x + yuragi;
      float py = y;
      
      for(int k=0;k<6;k++){
        pushMatrix();
        translate(x,y);
        rotate(k*PI/3);
        translate(yuragi,0);
        triangle(0, 0, diam*Math.cos(PI/6), diam*Math.sin(PI/6),diam*Math.cos(-PI/6), diam*Math.sin(-PI/6));
        popMatrix();
      }
    }
  }




}


