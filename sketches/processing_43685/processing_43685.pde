
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
 
int grid = 20;
PFont font;

void setup() {
  size(500, 500);
  font = loadFont("LucidaSans-20.vlw");
  textFont(font);
}

void draw() {
  background(150);
  
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
  
}

