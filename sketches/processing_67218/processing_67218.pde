
PFont myFont;

int[] posXArray;
int[] randomNumArray;
int posY;

void setup() {
  size(500, 500);
  myFont = loadFont("Arial-ItalicMT-48.vlw"); 
  textFont(myFont, 48);
  posXArray = new int[6];
  randomNumArray = new int[6];
  posY = 250;

  for (int i = 0; i < posXArray.length; i++) {
    posXArray[i] = 30 + i * 70;
  }

  for (int i = 0; i < randomNumArray.length; i++) {
    randomNumArray[i] = (int)random(0, 10);
    println(randomNumArray[i]);
  }
}

void draw() {
  background(54, 69, 79);

  for (int i = 0; i < posXArray.length; i++) {
    fill(255);
    rect(posXArray[i], posY, 50, 50);
    fill(0);
    text(randomNumArray[i], posXArray[i] + 10, posY + 43);
  }

  for(int i = 0; i < posXArray.length; i++){
    if(mouseX > posXArray[i] && mouseX < posXArray[i] + 50
    &&mouseY > posY &&mouseY < posY + 50 && mousePressed){
     increaseNumbers(i); 
    }
  }

}

void increaseNumbers(int arrayLocation) {
  //do something
  randomNumArray[arrayLocation] += 1;
  
  if(arrayLocation > 0){
  randomNumArray[arrayLocation - 1] += 1;
  }
  if(arrayLocation < posXArray.length - 1){
  randomNumArray[arrayLocation + 1] += 1;
  }
}



