
//
// generatore controllabile di colori casuali in modalitÃ�ï¿½Ã�Â  HSB
//
// codice da ripulire
// 

int hueMin = 0;
int hueMax = 360;
int satMin = 0;
int satMax = 100;
int briMin = 0;
int briMax = 100;

int counterWait = 60;
int counter = 0;

int parameterN = 0;   

float functionX;
float random1X, random2X, random3X;
float randomW;
float[] parametersX = new float[6];
float parameterW;

void setup() 
{
  size(950, 250);  
  noStroke();
  colorMode(HSB, 360, 100, 100);

  // font
  PFont font = createFont("Courier New", 16);
  textFont( font );

  // misure delle stringhe con le funzioni
  String functionStr = "fill( random(000,000), random(000,000), random(000,000) );";
  float functionW = textWidth(functionStr); 
  functionX = width - functionW - 26;

  // misure degli evidenziatori dei parametri
  
  float charW = functionW / functionStr.length();  
  
  randomW = charW*15;
  random1X = functionX + charW*6 - 2;
  random2X = random1X + charW*17;
  random3X = random2X + charW*17;
  
  parameterW = charW*3;  
  parametersX[0] = functionX + charW*13;  
  parametersX[1] = parametersX[0] + charW*4;  
  parametersX[2] = parametersX[1] + charW*13;  
  parametersX[3] = parametersX[2] + charW*4;  
  parametersX[4] = parametersX[3] + charW*13;  
  parametersX[5] = parametersX[4] + charW*4;
}


void draw() 
{
  if (counter == 0)
  {
    counter = counterWait;

    // area dei colori
    fill(360);
    noStroke();
    rect(0, 0, width-1, height-40);

    // quadrati colorati
    noStroke();
    for (int i=0; i<10; ++i) {
      float hue = random(hueMin, hueMax);
      float sat = random(satMin, satMax);
      float bri = random(briMin, briMax);
      fill(hue, sat, bri);
      float x = i*90 + 30;
      rect(x, 60, 80, 80);
    }
  } 
  --counter;

  // area delle funzioni
  noStroke();
  fill(140);
  rect(0, height-40, width, 40);

  // area avvertimento
  fill(360);
  rect(0, height-70, width, 30);
  if (!focused) {
      fill(0);
      textAlign(CENTER);
      text("click here before using the arrow keys", width/2, height-50);
  }
  
  // evidenziatori delle funzioni random() 
  fill(110);
  rect(random1X, height-10, randomW, 4);   
  rect(random2X, height-10, randomW, 4);   
  rect(random3X, height-10, randomW, 4);   

  // evidenziatore del parametro corrente
  fill(0);
  rect(parametersX[parameterN], height-11, parameterW, 5);   

  // testi delle funzioni
  fill(320);
  textAlign(LEFT);
  text( "colorMode(HSB,360,100,100);", 29, height-17);

  String strHueMin = ((hueMin<10)? "  " : (hueMin<100)? " " : "") + hueMin;
  String strHueMax = ((hueMax<10)? "  " : (hueMax<100)? " " : "") + hueMax;
  String strSatMin = ((satMin<10)? "  " : (satMin<100)? " " : "") + satMin;
  String strSatMax = ((satMax<10)? "  " : (satMax<100)? " " : "") + satMax;
  String strBriMin = ((briMin<10)? "  " : (briMin<100)? " " : "") + briMin;
  String strBriMax = ((briMax<10)? "  " : (briMax<100)? " " : "") + briMax;

  String strRandomHue = "random("+strHueMin+","+strHueMax+")";
  String strRandomSat = "random("+strSatMin+","+strSatMax+")";
  String strRandomBri = "random("+strBriMin+","+strBriMax+")";

  String strFill = "fill( "+strRandomHue+", "+strRandomSat+", "+strRandomBri+" );";
  textAlign(RIGHT);
  text( strFill, width-26, height-17);

  // contorno complessivo
  noFill();
  stroke(0);
  rect(0, 0, width-1, height-1);
}


void keyPressed()
{
  switch (keyCode) {
    case LEFT:   if (parameterN>0) --parameterN;  break;
    case RIGHT:  if (parameterN<5) ++parameterN;  break;
    case UP:
      switch(parameterN) {
        case 0:  if (hueMin<358)  hueMin+=3;  break;  
        case 1:  if (hueMax<358)  hueMax+=3;  break;  
        case 2:  if (satMin<100)  ++satMin;  break;  
        case 3:  if (satMax<100)  ++satMax;  break;  
        case 4:  if (briMin<100)  ++briMin;  break;  
        case 5:  if (briMax<100)  ++briMax;  break;
      }
      if (hueMin > hueMax)  hueMax = hueMin;
      if (satMin > satMax)  satMax = satMin;
      if (briMin > briMax)  briMax = briMin;
      break;  
    case DOWN:
      switch(parameterN) {
        case 0:  if (hueMin>2)  hueMin-=3;  break;  
        case 1:  if (hueMax>2)  hueMax-=3;  break;  
        case 2:  if (satMin>0)  --satMin;  break;  
        case 3:  if (satMax>0)  --satMax;  break;  
        case 4:  if (briMin>0)  --briMin;  break;  
        case 5:  if (briMax>0)  --briMax;  break;
      }
      if (hueMax < hueMin)  hueMin = hueMax;
      if (satMax < satMin)  satMin = satMax;
      if (briMax < briMin)  briMin = briMax;
      break;
  }
}

