
//copyright jingjing chen

void setup(){
  size(240,120);
  smooth();
}
void draw(){
  background(201);
  for (int x = 20; x<width; x+=20){
    if (mouseX<=0.5*width){
    float mx = mouseX/10.0;
    float offsetA = random(-mx,mx);
    float offsetB = random(-mx,mx);
    line(x+offsetA, 20, x + offsetB, 100);
    }

  else if(mouseX >0.5*width){
    float mx = -0.1*mouseX+24;
    float offsetA = random(-mx,mx);
    float offsetB = random(-mx,mx);
    line(x+offsetA, 20, x + offsetB, 100);
    }
  }
}
  


