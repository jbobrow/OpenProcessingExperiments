
PGraphics layer1;
int renk=1;
int renk2=1;
int sure=1000;
int tempsure;
int gecensure;

void setup() { 
  size(400, 400); 
  colorMode(HSB,100);
  smooth();
  tempsure = millis();
  layer1 = createGraphics(width, height, P2D); 

} 
 
void draw() { 
  gecensure = millis() - tempsure;
  float aci=constrain(radians(360/(second()+1)), 0,PI*2);
  float milim=norm(millis(), 0,1000);
  float acii=radians(360*milim);
arc(200, 200, 150, 150, aci, aci+0.5);
fill(60,60,renk);
layer1.beginDraw();
  layer1.noStroke();
  layer1.smooth();
  layer1.strokeWeight(3);
  layer1.stroke(255);
  layer1.arc(200, 200, 100, 100, acii, acii+0.5);
  layer1.fill(renk);
    layer1.endDraw();
  image(layer1,0,0); 
  

renk=((second()/6)*10);
println (second());
}

