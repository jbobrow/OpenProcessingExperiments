
boolean drawn = false;
boolean clear; 
PImage img;
PGraphics pg;
color transparent = color(255, 0, 0, 1);
color black = color(0);
color white = color(255);


Button refresh;

void setup() {
  size(600, 600);
  background(255);
  pg = createGraphics(width, height, P2D);
  refresh = new Button();
}

void draw() {


  if (mousePressed && refresh.over() == true) {
    clear();
  } 

  if (mousePressed && drawn == false && refresh.over() == false) {
    makeDrawing();
  }

  if (drawn == true && clear == false) {
    background(255);
    animate();
    refresh.display();
  }
}


void mouseReleased() {
  if (drawn == false && refresh.over() == false) {
    drawn = true;
    buildGuy();
  }
}


void makeDrawing() {
  fill(0);
  noStroke();
  ellipse(mouseX, mouseY, 20, 20);
}

void buildGuy() {
  this.loadPixels();
  pg.beginDraw();
  pg.loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      if (this.get(i, j) == black) {
        //        img.set(i, j, black);
        pg.pixels[i + j * width] = black;
      } 
      else if (this.get(i, j) == white) {
        //        img.set(i, j, transparent);
        pg.pixels[i + j * width] = transparent;
      }
    }
  }
  pg.updatePixels();
  pg.endDraw();
  pg.save("frame1.png");
  img = loadImage("frame1.png");
}

void animate() {
  //image(img, mouseX - img.width/2, mouseY - img.height/2);
  
  float dx = mouseX - width/2;
  float dy = mouseY - height/2;
  float angle = atan2(dy, dx); 
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  image(img, 0, 0);
  popMatrix();
  
   
  pushMatrix();
  translate(width, height/2);
  rotate(angle);
  image(img, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width, height);
  rotate(angle);
  image(img, mouseX, mouseY);
  popMatrix();


}

void clear() {
  background(255);
  drawn = false;
}



class Button {

  float x, y, w, h;
  String title;
  boolean over = false;
  color bkg = color(255, 0);

  Button() {
    w = 50;
    x = width - w - 2;
    y = 2;
    h = 15;
    title = "refresh";
  }

  void display() {


    stroke(0, 0, 0);
    fill(bkg);
    rect(x, y, w, h);

    if (over()) {
      bkg = color(200, 0, 0, 63);
    } 
    else {
      bkg = color(255);
    }

    stroke(0, 0, 0);
    fill(bkg);
    rect(x, y, w, h);

    fill(0);
    text(title, x +1, y+h-1);
  }


  boolean over() {

    if (mouseX > x && mouseX < x + w &&
      mouseY > y && mouseY < y + h) {
      return true;

    } 
    else {
      return false;
    }
  }
}

