
// Warhol T-Rex!!!1!!1

ArrayList trexSquares;

void setup()
{
  trexSquares = new ArrayList();
  size(1000, 1000);
  frameRate(60);
  smooth();
  background(255);
  noStroke();
  
  PopulateList();
}

void draw()
{
  background(255);
  for(int i = 0; i < trexSquares.size(); i++)
  {
    TRexSquare s = (TRexSquare)trexSquares.get(i);
    
    s.Render();
  }
}

void PopulateList()
{
  for(int y = 0; y < 10; y++)
  {
    for(int x = 0; x < 10; x++)
    {
      int posX = x * 100;
      int posY = y * 100;
      
      MakeTRexSquare(posX, posY);
    }
  }
}

void MakeTRexSquare(int posX, int posY)
{
  int backR = int(random(0, 5)) * 255 / 4;
  int backG = int(random(0, 5)) * 255 / 4;
  int backB = int(random(0, 5)) * 255 / 4;
  int frontR = int(random(0, 5)) * 255 / 4;
  int frontG = int(random(0, 5)) * 255 / 4;
  int frontB = int(random(0, 5)) * 255 / 4;
  
  boolean hasEyeshadow = false;
  int eyeshadowR = 0;
  int eyeshadowG = 0;
  int eyeshadowB = 0;
  boolean hasLipstick = false;
  int lipstickR = 0;
  int lipstickG = 0;
  int lipstickB = 0;
  
  int rand = int(random(0, 7));
  if(rand > 5)
  {
    hasEyeshadow = true;
    eyeshadowR = int(random(100, 150));
    eyeshadowG = int(random(150, 255));
    eyeshadowB = int(random(150, 255));
  }
  
  rand = int(random(0, 7));
  if(rand > 5)
  {
    hasLipstick = true;
    lipstickR = int(random(150, 255));
    lipstickG = int(random(150, 255));
    lipstickB = int(random(0, 80));
  }
  
  TRexSquare newSquare = new TRexSquare(posX, posY, backR, backG, backB, frontR, frontG, frontB, hasEyeshadow, eyeshadowR, eyeshadowG, eyeshadowB, hasLipstick, lipstickR, lipstickG, lipstickB);
  
  trexSquares.add(newSquare);
}

class TRexSquare {
  int posX;
  int posY;
  int backR;
  int backG;
  int backB;
  int frontR;
  int frontG;
  int frontB;
  boolean hasEyeshadow;
  int eyeR;
  int eyeG;
  int eyeB;
  boolean hasLipstick;
  int lipstickR;
  int lipstickG;
  int lipstickB;
  
  TRexSquare(int pX, int pY,
    int bR, int bG, int bB,
    int fR, int fG, int fB,
    boolean hEyeshadow, int eR, int eG, int eB,
    boolean hLipstick, int lR, int lG, int lB)
  {
    posX = pX;
    posY = pY;
    backR = bR;
    backG = bG;
    backB = bB;
    frontR = fR;
    frontB = fB;
    frontG = fG;
    hasEyeshadow = hEyeshadow;
    eyeR = eR;
    eyeG = eG;
    eyeB = eB;
    hasLipstick = hLipstick;
    lipstickR = lR;
    lipstickG = lG;
    lipstickB = lB;
  }
  
  void Render()
  {
    //quad(posX, posY, posX + 100, posY, posX + 100, posY + 100, posX, posY + 100);
    
    pushMatrix();
    translate(posX, posY);
    
    // Background
    fill(backR, backB, backG, 255);
    quad(0, 0, 100, 0, 100, 100, 0, 100);
    
    // Outline
    fill(frontR, frontG, frontB, 255);
    beginShape();
    curveVertex(28, 16);
    curveVertex(28, 16);
    curveVertex(30, 18);
    curveVertex(36, 19);
    curveVertex(40, 20);
    curveVertex(40, 20);
    curveVertex(44, 25);
    curveVertex(44, 25);
    curveVertex(48, 25);
    curveVertex(48, 25);
    curveVertex(54, 31);
    curveVertex(63, 35);
    curveVertex(72, 38);
    curveVertex(75, 38);
    curveVertex(83, 42);
    curveVertex(92, 48);
    curveVertex(95, 52);
    curveVertex(96, 57);
    curveVertex(97, 62);
    curveVertex(96, 63);
    curveVertex(95, 64);
    //vertex(95, 64);
    vertex(92, 67);
    vertex(92, 63);
    vertex(90, 66);
    vertex(90, 63);
    vertex(87, 66);
    vertex(86, 62);
    vertex(83, 65);
    vertex(83, 61);
    vertex(81, 65);
    vertex(80, 61);
    vertex(77, 66);
    vertex(76, 61);
    vertex(72, 65);
    vertex(72, 60);
    vertex(69, 64);
    vertex(70, 60);
    vertex(66, 64);
    vertex(66, 59);
    vertex(63, 62);
    vertex(63, 58);
    vertex(61, 59);
    vertex(60, 57);
    vertex(58, 58);
    vertex(58, 56);
    vertex(56, 57);
    vertex(56, 55);
    vertex(53, 56);
    vertex(53, 53);
    vertex(50, 54);
    vertex(49, 52);
    curveVertex(47, 54);
    curveVertex(47, 58);
    curveVertex(47, 58);
    curveVertex(49, 60);
    curveVertex(52, 63);
    curveVertex(55, 67);
    curveVertex(56, 68);
    vertex(58, 67);
    vertex(59, 70);
    vertex(60, 67);
    vertex(62, 72);
    vertex(64, 72);
    vertex(64, 69);
    vertex(66, 73);
    vertex(67, 71);
    vertex(69, 73);
    vertex(71, 69);
    vertex(74, 75);
    vertex(75, 72);
    vertex(77, 76);
    vertex(79, 73);
    vertex(80, 77);
    vertex(81, 74);
    vertex(82, 77);
    vertex(85, 75);
    vertex(83, 78);
    vertex(84, 79);
    curveVertex(84, 80);
    curveVertex(79, 84);
    curveVertex(72, 86);
    curveVertex(64, 83);
    curveVertex(56, 81);
    curveVertex(51, 79);
    curveVertex(47, 78);
    curveVertex(39, 78);
    curveVertex(32, 77);
    curveVertex(25, 76);
    curveVertex(21, 72);
    curveVertex(19, 67);
    curveVertex(15, 62);
    curveVertex(11, 56);
    curveVertex(7, 54);
    curveVertex(5, 55);
    curveVertex(5, 55);
    curveVertex(3, 54);
    curveVertex(3, 51);
    curveVertex(4, 49);
    curveVertex(6, 46);
    curveVertex(9, 44);
    curveVertex(10, 46);
    vertex(12, 46);
    curveVertex(11, 44);
    curveVertex(13, 38);
    curveVertex(12, 36);
    curveVertex(15, 29);
    curveVertex(20, 23);
    curveVertex(26, 20);
    endShape(CLOSE);
    
    // Back hole
    fill(backR, backB, backG, 255);
    beginShape();
    vertex(20, 29);
    curveVertex(22, 26);
    curveVertex(27, 24);
    curveVertex(31, 25);
    curveVertex(33, 27);
    curveVertex(31, 30);
    curveVertex(32, 33);
    curveVertex(30, 38);
    curveVertex(29, 42);
    curveVertex(26, 42);
    curveVertex(24, 40);
    curveVertex(24, 42);
    curveVertex(21, 42);
    curveVertex(20, 41);
    curveVertex(24, 36);
    curveVertex(29, 31);
    curveVertex(29, 31);
    curveVertex(24, 29);
    endShape(CLOSE);
    
    // Middle hole
    beginShape();
    curveVertex(41, 27);
    curveVertex(45, 31);
    curveVertex(45, 35);
    curveVertex(43, 39);
    curveVertex(42, 41);
    vertex(43, 43);
    curveVertex(39, 41);
    vertex(35, 36);
    curveVertex(39, 38);
    curveVertex(42, 36);
    curveVertex(44, 34);
    curveVertex(40, 33);
    curveVertex(38, 32);
    curveVertex(39, 28);
    endShape(CLOSE);
    
    if(hasEyeshadow)
    {
      fill(eyeR, eyeG, eyeB, 255);
      beginShape();
      curveVertex(63, 50);
      curveVertex(64, 49);
      curveVertex(65, 41);
      curveVertex(62, 37);
      curveVertex(54, 33);
      curveVertex(51, 33);
      curveVertex(47, 36);
      curveVertex(47, 39);
      curveVertex(47, 41);
      endShape(CLOSE);
      
      fill(backR, backB, backG, 255);
    }
    
    // Eye socket
    beginShape();
    curveVertex(52, 34);
    curveVertex(60, 38);
    curveVertex(61, 40);
    curveVertex(64, 43);
    curveVertex(65, 47);
    curveVertex(60, 50);
    curveVertex(55, 49);
    curveVertex(52, 47);
    curveVertex(50, 47);
    curveVertex(50, 44);
    curveVertex(48, 42);
    curveVertex(48, 38);
    curveVertex(50, 36);
    endShape(CLOSE);
    
    // Front hole
    beginShape();
    vertex(69, 45);
    vertex(72, 49);
    vertex(69, 49);
    vertex(68, 49);
    vertex(68, 46);
    endShape(CLOSE);
    
    // Nostril
    beginShape();
    vertex(84, 45);
    vertex(90, 49);
    vertex(93, 54);
    vertex(93, 54);
    vertex(89, 50);
    vertex(84, 47);
    endShape(CLOSE);
    
    if(hasLipstick)
    {
      fill(lipstickR, 0, lipstickB, 255);
      beginShape();
      curveVertex(56, 55);
      curveVertex(62, 58);
      curveVertex(70, 61);
      curveVertex(80, 62);
      curveVertex(87, 63);
      curveVertex(91, 64);
      curveVertex(94, 66);
      curveVertex(95, 66);
      curveVertex(96, 63);
      curveVertex(96, 62);
      curveVertex(94, 61);
      curveVertex(90, 59);
      curveVertex(81, 58);
      curveVertex(67, 57);
      endShape(CLOSE);
      
      beginShape();
      curveVertex(56, 68);
      curveVertex(60, 71);
      curveVertex(69, 74);
      curveVertex(77, 76);
      curveVertex(83, 78);
      curveVertex(84, 79);
      curveVertex(82, 81);
      curveVertex(79, 80);
      curveVertex(69, 77);
      curveVertex(61, 73);
      endShape(CLOSE);
    }
    
    popMatrix();
  }
}

