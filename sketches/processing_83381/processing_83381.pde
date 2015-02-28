
Mac[] bots;
PImage macImage;

void setup() {
  size(1900, 1500);
  macImage = loadImage ("mac.png");

  bots = new Mac[44];

  /*for (int i=0; i< bots.length; i++) {
   float x = random(-40, width-40);
   float y = map(i, 0, bots.length, -100, height-200);
   bots[i] = new Mac(macImage, x, y);
   
   }*/
  textSize (20);
  fill (281, 281, 281);
  bots[0] = new Mac(macImage, 1000, 520, 1.62, "India");
  bots[1] = new Mac(macImage, 820, 430, 2.11, "Ukraine");
  bots[2] = new Mac(macImage, 1160, 500, 2.12, "Hong Kong");
  bots[3] = new Mac(macImage, 1100, 600, 2.34, "Malaysia");
  bots[4] = new Mac(macImage, 1040, 400, 2.44, "China");
  bots[5] = new Mac(macImage, 750, 830, 2.45, "South Africa");
  bots[6] = new Mac(macImage, 1060, 540, 2.46, "Thailand");
  bots[7] = new Mac(macImage, 1158, 630, 2.46, "Indonesia");
  bots[8] = new Mac(macImage, 1220, 470, 2.50, "Taiwan");
  bots[9] = new Mac(macImage, 1020, 613, 2.55, "Sri Lanka");
  bots[10] = new Mac(macImage, 1200, 240, 2.55, "Russia");
  bots[11] = new Mac(macImage, 740, 480, 2.57, "Egypt");
  bots[12] = new Mac(macImage, 800, 600, 2.58, "Poland");
  bots[13] = new Mac(macImage, 800, 580, 2.63, "Hungary");
  bots[14] = new Mac(macImage, 880, 520, 2.67, "Saudi Arabia");
  bots[15] = new Mac(macImage, 1140, 500, 2.68, "Philippines");
  bots[16] = new Mac(macImage, 180, 510, 2.70, "Mexico");
  bots[17] = new Mac(macImage, 800, 300, 2.87, "Lithuania");
  bots[18] = new Mac(macImage, 1000, 550, 2.89, "Pakistan");
  bots[19] = new Mac(macImage, 780, 250, 3.00, "Latvia");
  bots[20] = new Mac(macImage, 1300, 480, 3.19, "South Korea");
  bots[21] = new Mac(macImage, 900, 580, 3.27, "UAE");
  bots[22] = new Mac(macImage, 780, 440, 3.45, "Czech Republic");
  bots[23] = new Mac(macImage, 760, 450, 3.54, "Turkey");
  bots[24] = new Mac(macImage, 300, 750, 3.71, "Peru");
  bots[25] = new Mac(macImage, 1200, 710, 3.75, "Singapore");
  bots[26] = new Mac(macImage, 700, 250, 3.82, "Britain");
  bots[27] = new Mac(macImage, 270, 550, 4.02, "Costa Rica");
  bots[28] = new Mac(macImage, 1460, 850, 4.05, "New Zealand");
  bots[29] = new Mac(macImage, 250, 780, 4.05, " Chile");
  bots[30] = new Mac(macImage, 900, 480, 4.13, "Israel");
  bots[31] = new Mac(macImage, 1380, 450, 4.16, "Japan");
  bots[32] = new Mac(macImage, 200, 400, 4.20, "United States");
  bots[33] = new Mac(macImage, 730, 360, 4.43, "Euro area");
  bots[34] = new Mac(macImage, 310, 580, 4.54, "Colombia");
  bots[35] = new Mac(macImage, 710, 870, 4.63, "Uruguay");
  bots[36] = new Mac(macImage, 180, 280, 4.63, "Canada");
  bots[37] = new Mac(macImage, 615, 780, 4.64, "Argentina");  
  bots[38] = new Mac(macImage, 1280, 760, 4.94, "Australia");
  bots[39] = new Mac(macImage, 680, 290, 5.37, "Denmark");
  bots[40] = new Mac(macImage, 480, 730, 5.68, "Brazil");
  bots[41] = new Mac(macImage, 800, 150, 5.91, "Sweden");
  bots[42] = new Mac(macImage, 770, 190, 6.79, "Norway");
  bots[43] = new Mac(macImage, 780, 310, 6.81, "Switzerland");


  smooth();
}

void draw() {

  background(0);
  //  for (int i =0; i <bots.length; i++) {
  for (int i =0; i <43; i++) {
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

    text(name, xpos -90, ypos + yoffset-110);
    float w = map(price, 0, 10, 20, 200);
    image(botImage, xpos-100, ypos + yoffset - 100, w, w);
  }
}


