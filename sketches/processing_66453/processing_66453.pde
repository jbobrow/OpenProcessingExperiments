
Walker w;

float framenum1 = 100;
float framenum2 = 200;
float framenum3 = 400;
float framenum4 = 600;
float framenum5 = 800;
float framenum6 = 1000;
float framenum7 = 2000;
float framenum8 = 3000;

void setup() {
  size(800,200);
  background(0);
  w = new Walker();
}

void draw() {
  w.display();
  w.step();
  w.fade();
  
  if (frameCount == framenum1) {
    saveFrame("output/redwalker-frame100.tiff");
       }
        
  if (frameCount == framenum2) {
    saveFrame("output/redwalker-frame200.tiff");
       }
       
  if (frameCount == framenum3) {
    saveFrame("output/redwalker-frame600.tiff");
       }
       
  if (frameCount == framenum5) {
    saveFrame("output/redwalker-frame800.tiff");
       }
       
  if (frameCount == framenum6) {
    saveFrame("output/redwalker-frame1000.tiff");
       }
       
       if (frameCount == framenum7) {
    saveFrame("output/redwalker-frame2000.tiff");
       }
       
       
       if (frameCount == framenum8) {
    saveFrame("output/redwalker-frame3000.tiff");
       }
       
        if (frameCount > 3000) {
    noLoop();
  }
}



