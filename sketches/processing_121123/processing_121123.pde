
float counter = 0;
 
void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100,100);
} /*HSB-Farben werden am Farbkreis abgelesen 
  360°rot, 90°gelb, 180°grün, 270°blau, H= Farbton, S= Sättigung, B=Helligkeit*/

void draw()
{
  
  
  float h = map(sin(counter), -1, 1, 80,150);
  // sin bewirkt, dass die farben von rot-gelb-grün-blau-rot nach wieder rot, blau, grün, gebl rot laufen
  // 0,360 = Farben im Farbkreis
  // -1, 1 = sin beginnt bei -1 bis 1
  background(h, 100, 100);
  counter += 0.5;


  
  pushMatrix();
  float k = map(cos(counter), -1, 1, 0,40);
  translate(sin(counter)*200, cos(counter)*100);
  ellipse(200,200,40,40);
  fill(k,100,100);
  counter+=0.05;
  popMatrix();

  
}
