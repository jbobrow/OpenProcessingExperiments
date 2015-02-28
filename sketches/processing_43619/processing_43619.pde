
//Max Spears

//setup
void setup() {
  size(500,500);
  f = loadFont("LiGothicMed-40.vlw");
  textFont(f);
  background(255); 
  smooth();
  noFill();
  textMode(MODEL);
  ellipseMode(CORNER);
  strokeWeight(sweight);
  frameRate(100);
}

//variables'
PFont f;
int ellSize = 10;
int count = 1;
float trans = random(90,100);
int trans2 = 20;
int X = 0;
int Y = 0;
int X2 = 490;
int Y2 = 0;
int X3 = 0;
int Y3 = 490;
int X4 = 490;
int Y4 = 490;
float textx = 33;
float texty = 60;
float statik = random(60, 100);
float sweight = random(1, 2);
float gridweight = random(1,5);


//draw loop 
void draw() {
  
  fill(#000000); //creates the text
  String g = "We Interrupt This Programme";
  text(g, 40, 248);
  fill(#ffffff);
  String s = "We Interrupt This Programme";
  text(s, 45, height/2);
  noFill();
  for (int x=0; x<width; x+=40) {
    for (int y=0; y<height; y+=40) {
      if (x%20 == 0) {
        stroke(#ffffff);
        strokeWeight(1);
        line(x, y, x+8, y);
        line(x+4, y-4, x+4, y+4);
      }
    }        
    while (count < statik) {  //Creates the pattern of ellipses in the background
      stroke(0, trans2); 
      strokeWeight(sweight);
      ellipse (X, Y, ellSize, ellSize);
      ellipse (X2, Y2, ellSize, ellSize);
      ellipse (X3, Y3, ellSize, ellSize);
      ellipse (X4, Y4, ellSize, ellSize);
      stroke(77, 218, 255, trans);     
      ellSize = ellSize+30;
      trans = trans - 8;
      trans2 = trans2 + 5;
      X2 = X2 - 30;
      Y3 = Y3 - 30;
      X4 = X4 - 30;
      Y4 = Y4 - 30;
      count++;
    }
    X = X + 100;
    ellSize = 10;   
    if (X>statik) {
      X = X + 15;
      Y = Y + 70;
      X = 0;
    }
    if (Y>statik) {
      X=0;
      Y=0;
    }
  }
}
void mousePressed() {
  noLoop();
  redraw();
}

void mouseReleased() {
  noLoop();
}


