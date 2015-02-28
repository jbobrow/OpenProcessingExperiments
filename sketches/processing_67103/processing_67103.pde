
int[] posXArray;
int[] randomNumArray;
int posY;
PFont myFont;

void setup() {
  myFont=loadFont("hahaha.vlw");
  textFont(myFont, 48);
  size(500, 500);
  randomNumArray=new int[6];
  posXArray= new int[6];
  posY= 250;
  for (int i=0; i<posXArray.length; i++) {
    posXArray[i] = 30+i*70;
  } 

  for (int i=0; i<randomNumArray.length;i++) {
    randomNumArray[i] = (int)random(0, 10);
    println(randomNumArray[i]);
  }
}

void draw() {
  background(150); 
  for (int i=0; i<posXArray.length;i++) {
    fill(255);
    rect(posXArray[i], posY, 50, 50);
    fill(0);
    text(randomNumArray[i], posXArray[i]+2, posY+47);
  }
  for (int i=0;i<posXArray.length;i++) {
    if (mouseX>posXArray[i] && mouseX<posXArray[i] + 50 && mouseY > posY && mouseY < posY+50 && mousePressed) {
      IncreaseNumbers(i);
    }
  }
}


void IncreaseNumbers(int arrayLocation) {
  randomNumArray[arrayLocation] +=1;
  if (arrayLocation>0) {
    randomNumArray[arrayLocation-1] +=1;
  }
  if (arrayLocation<posXArray.length-1) {
    randomNumArray[arrayLocation+1] +=1;
  }
}


