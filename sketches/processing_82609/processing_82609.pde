
Mac[] bots;
PImage macImage;
void setup() {
  size(1500, 1000);
  macImage = loadImage ("mac.png");

  bots = new Mac[20];

  /*for (int i=0; i< bots.length; i++) {
    float x = random(-40, width-40);
    float y = map(i, 0, bots.length, -100, height-200);
    bots[i] = new Mac(macImage, x, y);

  }*/
  bots[0] = new Mac(macImage, 1000, 520, 1.62, "India");
  bots[1] = new Mac(macImage, 820, 430, 2.11, "Ukraine");
  bots[2] = new Mac(macImage, 200, 100, 2.12, "Hong Kong");
  bots[3] = new Mac(macImage, 300, 100, 2.34, "Malaysia");
  bots[4] = new Mac(macImage, 200, 100, 2.44, "China");
  bots[5] = new Mac(macImage, 300, 100, 2.45, "South Africa");
  bots[6] = new Mac(macImage, 200, 100, 2.46, "Thailand");
  bots[7] = new Mac(macImage, 300, 100, 2.46, "Indonesia");
  bots[8] = new Mac(macImage, 200, 100, 2.50, "Taiwan");
  bots[9] = new Mac(macImage, 300, 100, 2.55, "Sri Lanka");
  bots[10] = new Mac(macImage, 200, 100, 2.55, "Russia");
  bots[11] = new Mac(macImage, 300, 100, 2.57, "Egypt");
  bots[12] = new Mac(macImage, 800, 600, 2.58, "Poland");
  bots[13] = new Mac(macImage, 800, 580, 2.63, "Hungary");
  bots[14] = new Mac(macImage, 880, 520, 2.67, "Saudi Arabia");
  bots[15] = new Mac(macImage, 1140, 500, 2.68, "Philippines");
  bots[16] = new Mac(macImage 
  
  
  smooth();
}

void draw() {
  background(204);
//  for (int i =0; i <bots.length; i++) {
  for (int i =0; i <11; i++) {
    bots[i].update();
    bots[i].display();
  }
}

class Mac {
  float xpos;
  float ypos;
  float angle;
  PImage botImage;
  float yoffset = 0.0;
  float price;
  String name;

  Mac(PImage s, float tempX, float tempY, float _price, String _name) {
    botImage = s;
    xpos = tempX;
    ypos = tempY;
    angle = random(0, TWO_PI);
    price = _price;
    name = _name;
  }

  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
  }

  void display () {
    text(name, xpos, ypos + yoffset);
    float w = map(price, 0, 10, 20, 200);
    image(botImage, xpos, ypos + yoffset, w, w);
  }
}
