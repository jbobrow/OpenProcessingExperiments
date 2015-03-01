


//INSTRUCTIONS
//Type letters to bring up different words.  Move the mouse the change the text size and colour (text size controlled by mouse Y, colour controlled by mouse X).
//Press 1 to save the image, or press 2 to clear the canvas.


String[] letterCalled = {
  "",
  "ages", 
  "blissful",
  "calm",
  "dream",
  "ending", 
  "far",
  "gone",
  "hope",
  "illusion", 
  "joy",
  "keep",
  "lies",
  "memories", 
  "near",
  "opaque",
  "past",
  "quaint", 
  "regret",
  "sand",
  "tide",
  "under", 
  "vague",
  "wane",
  "xanadu",  
  "years",
  "zephyr", 
  };

int keyNum = 0;

void setup() {
  size(800, 800);
  background(#FFFFFF);
  colorMode(HSB,width,100,100,100);
}

void draw() {
  fill(mouseX,50,50,40);
  textSize(10+(mouseY)/20);
  text(letterCalled[keyNum], random(width),random(height));
  keyNum = 0;
}

void keyPressed() {
  if (key == 49) {
    saveFrame("screenshotcanvaswords.png");
  }
  else if (key == 50){
    background(#ffffff);
  }
  else if (key <= 64) {
    keyNum = 0;
  }
  else if (key <= 90) {
    keyNum = key-64;
  }
  else if (key <= 96) {
    keyNum = 0;
  }
  else if (key <= 122) {
    keyNum = key-96;
  }
   else keyNum = 0;
}

