
void setup() {
  size(400, 400);
  smooth();
  noStroke();
}

void draw() {
  fill(150,150,200,50);
  rect(0,0,width,height);

  fractal(100,mouseX, mouseY);
}

void fractal(float dia, float x, float y) {   
  color col = color(map(dia, 0, 100,150,255),200,100);
  fill(col);
  ellipse(x,y,dia,dia);
  
  float odia = dia;
  dia *= 0.6;
  
  if (dia > 5) {
    pushMatrix();
    translate((odia/2+dia/2)*cos(radians(frameCount)),(odia/2+dia/2)*sin(radians(frameCount)));
    fractal(dia,x,y);
    popMatrix();
    
    pushMatrix();
    translate((odia/2+dia/2)*cos(radians(frameCount*2)+radians(180)),(odia/2+dia/2)*sin(radians(frameCount*2)+radians(180)));
    fractal(dia,x,y);
    popMatrix();
    
    pushMatrix();
    translate((odia/2+dia/2)*cos(-radians(frameCount*3)),(odia/2+dia/2)*sin(-radians(frameCount*3)));
    fractal(dia,x,y);
    popMatrix();
  }
}

void keyPressed(){
  if(key == 's' || key == 'S'){
    saveFrame();
  }
}

