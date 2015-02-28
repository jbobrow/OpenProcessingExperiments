
//import processing.opengl.*;

//Declare Globals
int rSn; // randonSeed number. put into var so can be saved in file name. defaults to 47
Pane p;
ArrayList<Pane> panes = new ArrayList();


void setup() {
  background(255);
  size(800, 400);
  smooth();
  int rSn = 47;
  randomSeed(rSn);
  
  p = new Pane();
  p.x = 10; p.y = height/2;
  p.w = 150; p.h = 50;
  
  p.col = color(180,0,90);
  
}

void draw() {
  background(255);
  stroke(0);
  line(width/2, 0, width/2, height);
  p.x = mouseX/2-60;
  p.h = mouseY/4+50;
  p.y = mouseY;
  p.render();
  // if (mouseX != 0 && mouseY != 0)  line(mouseX, mouseY, width/2, height/2);
  
  for(Pane sp : panes){
  sp.render();
  }
  
}

void keyPressed() {
  if (key == 'S') screenCap();
}

void mousePressed(){
  //save current pos of pane in a new pane and store
  
  Pane newPane;
  newPane = new Pane();
  newPane.x = p.x;
  newPane.y = p.y;
  newPane.w = p.w;
  newPane.h = p.h;
  newPane.col = p.col;
  newPane.transp = p.transp;
  
panes.add(newPane);

}







void screenCap() {
  // save functionality in here
  String outputDir = "out/";
  String sketchName = "template-";
  String randomSeedNum = "rS" + rSn + "-";
  String dateTime = "" + year() + month() + day() + hour() + second();
  String fileType = ".tif";
  String fileName = outputDir + sketchName + randomSeedNum + dateTime + fileType;
  save(fileName);
  println("Screen shot taken and saved to " + fileName);
}

class Pane {
  float x, y;
  float w, h;
  color col;
  float transp = 50;

  void render() {
    color(col);
    fill(col,transp);
    noStroke();
    pushMatrix();
    translate(width/2, 0);
    triangle(x, y, x+h, y+h/2, x+h, y-h/2);
    triangle(-x, y, -x-h, y+h/2, -x-h, y-h/2);
    
    popMatrix();
  }
}
