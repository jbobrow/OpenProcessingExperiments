
//Coded w/ help from Zac G and David L

float distance = 0;
int maxdist = 10; 
int fallX = 0;

int walk = 0;
PImage[] walkies = new PImage [35];

int fall = 0;
PImage[] falling = new PImage [40];

boolean hasfallen = false;

void setup() {
  noStroke();
  size (1000, 500);
  frameRate(24);

  walkies[0] = loadImage("Walk0001.png");
  walkies[1] = loadImage("Walk0002.png");
  walkies[2] = loadImage("Walk0003.png");
  walkies[3] = loadImage("Walk0004.png");
  walkies[4] = loadImage("Walk0005.png");
  walkies[5] = loadImage("Walk0006.png");
  walkies[6] = loadImage("Walk0007.png");
  walkies[7] = loadImage("Walk0008.png");
  walkies[8] = loadImage("Walk0009.png");
  walkies[9] = loadImage("Walk0010.png");
  walkies[10] = loadImage("Walk0011.png");
  walkies[11] = loadImage("Walk0012.png");
  walkies[12] = loadImage("Walk0013.png");
  walkies[13] = loadImage("Walk0014.png");
  walkies[14] = loadImage("Walk0015.png");
  walkies[15] = loadImage("Walk0016.png");
  walkies[16] = loadImage("Walk0017.png");
  walkies[17] = loadImage("Walk0018.png");
  walkies[18] = loadImage("Walk0019.png");
  walkies[19] = loadImage("Walk0020.png");
  walkies[20] = loadImage("Walk0021.png");
  walkies[21] = loadImage("Walk0022.png");
  walkies[22] = loadImage("Walk0023.png");
  walkies[23] = loadImage("Walk0024.png");
  walkies[24] = loadImage("Walk0025.png");
  walkies[25] = loadImage("Walk0026.png");
  walkies[26] = loadImage("Walk0027.png");
  walkies[27] = loadImage("Walk0028.png");
  walkies[28] = loadImage("Walk0029.png");
  walkies[29] = loadImage("Walk0030.png");
  walkies[30] = loadImage("Walk0031.png");
  walkies[31] = loadImage("Walk0032.png");
  walkies[32] = loadImage("Walk0033.png");
  walkies[33] = loadImage("Walk0034.png");
  walkies[34] = loadImage("Walk0035.png");

  falling[0] = loadImage("Fall0001.png");
  falling[1] = loadImage("Fall0002.png");
  falling[2] = loadImage("Fall0003.png");
  falling[3] = loadImage("Fall0004.png");
  falling[4] = loadImage("Fall0005.png");
  falling[5] = loadImage("Fall0006.png");
  falling[6] = loadImage("Fall0007.png");
  falling[7] = loadImage("Fall0008.png");
  falling[8] = loadImage("Fall0009.png");
  falling[9] = loadImage("Fall0010.png");
  falling[10] = loadImage("Fall0011.png");
  falling[11] = loadImage("Fall0012.png");
  falling[12] = loadImage("Fall0013.png");
  falling[13] = loadImage("Fall0014.png");
  falling[14] = loadImage("Fall0015.png");
  falling[15] = loadImage("Fall0016.png");
  falling[16] = loadImage("Fall0017.png");
  falling[17] = loadImage("Fall0018.png");
  falling[18] = loadImage("Fall0019.png");
  falling[19] = loadImage("Fall0020.png");
  falling[20] = loadImage("Fall0021.png");
  falling[21] = loadImage("Fall0022.png");
  falling[22] = loadImage("Fall0023.png");
  falling[23] = loadImage("Fall0024.png");
  falling[24] = loadImage("Fall0025.png");
  falling[25] = loadImage("Fall0026.png");
  falling[26] = loadImage("Fall0027.png");
  falling[27] = loadImage("Fall0028.png");
  falling[28] = loadImage("Fall0029.png");
  falling[29] = loadImage("Fall0030.png");
  falling[30] = loadImage("Fall0031.png");
  falling[31] = loadImage("Fall0032.png");
  falling[32] = loadImage("Fall0033.png");
  falling[33] = loadImage("Fall0034.png");
  falling[34] = loadImage("Fall0035.png");
  falling[35] = loadImage("Fall0036.png");
  falling[36] = loadImage("Fall0037.png");
  falling[37] = loadImage("Fall0038.png");
  falling[38] = loadImage("Fall0039.png");
  falling[39] = loadImage("Fall0040.png");
}

void draw() {
  distance = mouseX - pmouseX;

  fill(230, 170, 216, 70);
  rect(0, 0, 1000, 500);

  fill(85, 50, 70);
  rect(0, 470, 1000, 30);

  fill(110, 35, 75, 20);
  rect(50, 40, 900, 30);
  rect(50, 40, 600, 30);
  rect(50, 40, 400, 30);
  rect(50, 40, 250, 30);
  rect(50, 40, 100, 30);
  rect(50, 40, 40, 30);
  rect(50, 40, 15, 30);
  rect(50, 40, 5, 30);

  fill(200, 0, 0, 20);
  rect(850, 40, 100, 30); 
  rect(900, 40, 50, 30);
  rect(930, 40, 20, 30);
  rect(945, 40, 5, 30);

  noStroke();

  if (mousePressed == true) {
    if (!hasfallen) {
      if (mouseX > 50 && mouseX < 950 && mouseY > 30 && mouseY < 70) {
        walk += 1;
        walk %= 35;
        image(walkies[walk], mouseX-120, 90);
        
        fill(240, 240, 90);
        rect(mouseX, 40, 20, 30);
      }
      else {
        hasfallen = true;
        fallX = mouseX;
      }
      if (distance > maxdist) {
        hasfallen = true;
        fallX = mouseX;
      }
    } 
    else {
      if (fall != falling.length - 1) {
        fall += 1;
      }
      image(falling[fall], fallX-200, 0);
    }
  }

  if (mousePressed == false) {
    hasfallen = false;
    fall = 0;
    image(walkies[0], -20, 90);
    
    fill(240, 240, 90);
    rect(85, 40, 20, 30);
  }
}


