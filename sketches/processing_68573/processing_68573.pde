
import netscape.javascript.*;

int sw = 500;
int sh = 500;
int gw = 300;
int gh = 300;
int w = 100;
int h = 100;

DisplayItems dItems;
int n = 20;

int numVec = 100;
int numGrowth = 10;
RadialGrowth[] radialGrowths = new RadialGrowth[numGrowth];

float incScale = 10;
float incRotate;




void setup() {
  size(sw, sh);
  colorMode(HSB, 100);
  background(100, 0, 100);
  translate(sw / 2, sh / 2);  
  scale(incScale);
  smooth();

  dItems = new DisplayItems(n);

  for (int i = 0; i < numGrowth; i += 1) {
    radialGrowths[i] = new RadialGrowth(numVec, (int)random(-sw / 2, sw / 2), (int)random(-sh / 2, sh / 2));
    radialGrowths[i].InitUpdate(random(0.05, 0.1), random(0.0005, 0.001), random(0.05, 0.01), random(0.05, 0.01), random(0.05, 0.01), random(0.05, 0.01));    
  }
}

void draw() {
  //background(100, 0, 100);


  incScale += 0.01;
  incRotate += 0.001;

  translate(sw / 2, sh / 2);
  scale((sin(incScale) + 1) * 0.5 + 0.5); //  * map(noise(incScale), 0, 1, -1, 1)
  rotate(sin(incRotate));

  //dItems.DrawCross();
  //dItems.DrawGrid();
  //dItems.DrawGridPoints(); 
  //dItems.DrawTime();


  for (int i = 0; i < numGrowth; i += 1){
    radialGrowths[i].Update();
    radialGrowths[i].Draw();   
  }
}


