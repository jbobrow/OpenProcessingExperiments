
String[] name = {
  "Toyota:", 
  "G.M:", 
  "Volkswagen:", 
  "Hyundai:", 
  "Ford:", 
  "Nissan:", 
  "Honda:", 
  "PSA:", 
  "Suzuki:", 
  "Renault:",
};

int[] total = {	
  8557351, 
  8476192, 
  7341065, 
  5764918, 
  4988031, 
  3982162, 
  3643057, 
  3605524, 
  2892945, 
  2716286,
};


void setup() {
  noStroke();
  smooth();
  size(400, 400);
  background(255);
}

void draw() {
  int x=0;
  text("WORLD MOTOR VEHICLE PRODUCTION", 80, 20);
  for (int i=0;i<10;i++) {

    if (mouseX>x && mouseX<=x+40) {
      fill(255, 40, 40);
      if (mouseX>4 && mouseX<=x+32) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img;
        img = loadImage("data/toyota.jpg");
        image(img, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[0], 200, 50);
        text(name[0], 200, 60);
      }
      if (mouseX>36 && mouseX<=x+68) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img1;
        img1 = loadImage("data/gm.jpg");
        image(img1, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[1], 200, 50);
        text(name[1], 200, 60);
      }
      if (mouseX>72 && mouseX<=x+104) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img2;
        img2 = loadImage("data/VW.jpg");
        image(img2, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[2], 200, 50);
        text(name[2], 200, 60);
      }
      if (mouseX>108 && mouseX<=x+140) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img3;
        img3 = loadImage("data/Hyundai.jpg");
        image(img3, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[3], 200, 50);
        text(name[3], 200, 60);
      }
      if (mouseX>144 && mouseX<=x+176) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img4;
        img4 = loadImage("data/Ford.jpg");
        image(img4, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[4], 200, 50);
        text(name[4], 200, 60);
      }
      if (mouseX>180 && mouseX<=x+202) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img5;
        img5 = loadImage("data/nissan.jpg");
        image(img5, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[5], 200, 50);
        text(name[5], 200, 60);
      }
      if (mouseX>206 && mouseX<=x+238) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img6;
        img6 = loadImage("data/Honda.jpg");
        image(img6, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[6], 200, 50);
        text(name[6], 200, 60);
      }
      if (mouseX>242 && mouseX<=x+274) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img7;
        img7 = loadImage("data/PSA.jpg");
        image(img7, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[7], 200, 50);
        text(name[7], 200, 60);
      }
      if (mouseX>306 && mouseX<=x+338) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img8;
        img8 = loadImage("data/suzuki.jpg");
        image(img8, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[8], 200, 50);
        text(name[8], 200, 60);
      }
      if (mouseX>342 && mouseX<=x+374) {
        fill(255);
        rect(200, 20, 200, 50);
        PImage img9;
        img9 = loadImage("data/renault.gif");
        image(img9, 200, 70, 200, 200);
        fill(255, 40, 40);
        text(total[9], 200, 50);
        text(name[9], 200, 60);
      }
    }
    else {
      fill(50);
    }


    //we need to make the data range fit in out window so we can use map 
    // we take the upper bound as a little larger our biggest value
    // and the lower bound as a little lower than our lowest value
    float h = map(total[i], 2700000, 8600000, 0, 400);

    // as y increaces posativly from top to bottom we need to fiddle around
    // where the top of our box is to make it look like they grow from bottom to top
    rect(x+4, height-h, 32, h);

    // after we have drawn a bar we need to incriment our x position so
    // they don't draw on top of each other
    x+=40;
  }
}


