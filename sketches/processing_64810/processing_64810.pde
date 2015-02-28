
void setup(){
  size(800,200);
  background(57,42,97);
  smooth();
  noLoop();
//  frameRate(0.3);

}

void draw ( ){
  background(57,42,97);

  for(int i=0; i<width; i+=80){

//  float ang = random(PI); 
  color tc = color(random(100),random(205), random(255));  
  float sc = random(0.5, 1.5);
  float cw = random(40, 120);
  color stcl = color(0,100);
  
  cabinet(i,0,cw, tc, sc, stcl);
  
  }
}


void cabinet(float x, float y, float cabwidth, color c, float scaler, color s){
  
fill(c);
stroke(s);
  
pushMatrix();
translate(x,y);

scale(scaler);

float height = 150;

//cabinet doors
rect(0,0, cabwidth, height);
rect(0,0, cabwidth/2, 50);
rect(cabwidth/2, 0, cabwidth/2, 50);

//inside squares
rect(cabwidth/16, 5, cabwidth/2.6,40);
rect(cabwidth/1.8, 5, cabwidth/2.6,40);

//knobs
fill(s);
ellipse(cabwidth/2.8, height/6, 5,5);
ellipse(cabwidth/1.5,height/6 , 5,5);

//drawer dividers
line(0,height-53, cabwidth, height-53);
line(0, height-50, cabwidth, height-50);

//handles
fill(s);
ellipse(cabwidth/2, height/2, 25, 5);
ellipse(cabwidth/2, height/2+50, 25, 5);
popMatrix();
}

void mousePressed(){
  redraw();
}

