
/**
 * Coordinate System Tutor
 *
 * Can be used to help explain the processing coordinate system.
 *
 * Created by Rene Hangstrup Møller for the
 * Processing workshops at Open Space Aarhus
 *
 * http://osaa.dk/wiki/index.php/Processingworkshops
 */
 
 // Modeficeret af svend-ev 
 //  tast 1  og få vist et punkt i  12,12
 //  tast 2  og få vist en linje start i 5,5 og slut i 19,19
 //  tast 3  og få vist en rectangel, øverste venstre hjørne 
 //  placeret i 5,5 størrelse af rectangel 14,14 
 //  (default er [rectMode(CORNER)])
 //  tast 4 og få vist en cirkel(elipce) med center i 12,12  
 //  og en diameter 14 (der står 14,14 fordi det er en elipse)
 //  tast 5 og få vist en rectangel, placeret i 12,12 størelse  
 //  14,14 [rectMode(CENTER)].  

 
int grid = 20; // variabel, for gitter
PFont font;   
 
PGraphics gfx;   
int gfxW, gfxH;   // flere variable
 
boolean smoothIt = false;
 
Tool[] tools = {  
  new PointTool(),
  new LineTool(),
  new RectTool(),
  new EllipseTool(),
  new RectTool_II() 
};
 
int tool = -1;  
 
void setup() {
  size(500, 500);
 font = loadFont("LucidaSans-20.vlw");
 textFont(font);
   
  gfxW = width / grid;
  gfxH = height / grid;
   
  gfx = createGraphics(gfxW, gfxH, JAVA2D);
}
 
void draw() { 
  gfx.beginDraw();
  if (smoothIt) {
    gfx.smooth();
  } else {
    gfx.noSmooth();
  }
  gfx.background(150);
  gfx.stroke(0);
  if (tool >= 0) {
    tools[tool].paint(gfx); 
  }
  gfx.endDraw();
 
  background(150);
  noSmooth();
  image(gfx, 0, 0, width, height);
  smooth();
 
  fill(255, 255, 128, 128 + 100 * cos(frameCount * 0.1f));
  int px = mouseX / grid;
  int py = mouseY / grid;
  rect(px * grid, py * grid, grid, grid);
   
  stroke(100); 
  for (int y = 0; y < height; y += grid) {
    if (y % (5 * grid) == 0) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }
    line(0, y, width, y);
  }
   
  for (int x = 0; x < width; x += grid) {
    if (x % (5 * grid) == 0) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }
    line(x, 0, x, height);
  }
   
  String label = "( " + px + " , " + py + " )";
   
  int tx = 0, ty = 0;
  if (mouseX < width / 2) {
    tx = px * grid + (int)(1.5f * grid);
  } else {
    tx = px * grid - grid / 2 - (int)textWidth(label);
  }
   
  if (mouseY < height / 2) {
    ty = py * grid + (int)(1.5f * grid);
  } else {
    ty = py * grid;
  }
 
  fill(50, 120, 80, 200);
  noStroke();
  rect(tx - 8, ty - 24, textWidth(label) + 16, 32);  
  fill(255);
  text(label, tx, ty);
  stroke(0);
 
  if (tool >= 0) {
    String line = tools[tool].explain(); 
    int tw = (int)textWidth(line);
    int lineY = (mouseY > height - 48) ? 36 : height - 48;
    // fill(50, 120, 80, 200);
    fill(255, 255, 255, 200);
    noStroke();
    rect((width -tw) / 2 - 8, lineY - 24, textWidth(line) + 16, 61);  
    fill(0);
    text(line, (width - tw) / 2, lineY);
  }
}
 
void mouseClicked() {
  if (tool >= 0) {
    tools[tool].clicked(mouseX / grid, mouseY / grid);
  }
}
 
void keyPressed() {
  switch (key) {
    case 'S':
    case 's':
      smoothIt = !smoothIt;
      break;
     
    case '0': tool = -1; break;
    case '1': tool = 0; tools[tool].reset(); break;
    case '2': tool = 1; tools[tool].reset(); break;
    case '3': tool = 2; tools[tool].reset(); break;
    case '4': tool = 3; tools[tool].reset(); break;
    case '5': tool = 4; tools[tool].reset(); break;
  }
}


