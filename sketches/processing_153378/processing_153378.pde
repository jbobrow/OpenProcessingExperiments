
float div = 100;
float r = 30;
float n;
float widthDiv,heightDiv;

void setup() {
  size(600, 600);
  smooth();
  
  colorMode(HSB, 360, 100,100,100);
  
  n =random(100);
  widthDiv = width / div;
  heightDiv = height / div;
}

void draw() {

  background(0);
  noStroke();

  for (int i=-4; i<(div) + 8; i++) {
    fill(210,60,60 * ( i*(1/div)) );
    beginShape();
    vertex(-2*widthDiv, ((div*r*2) + i*heightDiv));
    vertex(-2*widthDiv, (i*heightDiv));
    
    for (int j=-2; j<(div) + 6; j++) {
            
      float theta = map( noise(n,i*0.1,j*0.02), 0,1, 0,TWO_PI);
      float x = (cos(theta)* r) + (j*widthDiv) ;
      float y = (sin(theta)* r)*1.5 + (i*heightDiv);
      
      curveVertex(x,y);
      
    }
    
    vertex((div+6)*widthDiv, (i*heightDiv));
    vertex((div+6)*widthDiv, ((div*r*2) + i*heightDiv));
    
    endShape(CLOSE);
  }
  n += 0.03;
}

