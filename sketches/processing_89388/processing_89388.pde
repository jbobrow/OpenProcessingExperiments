
String word = "breathe";
float distance;
float maxDistance;
float breathRate;
float fontSize;
float fontMax;
float breath;
PFont font;
int i;
int j;

void setup() {
  size(640, 480);
  frameRate(60);
  
  breathRate = 45;
  maxDistance = dist(0, 0, width/2, height/2);
  i = 0;
  j = 0;
  
  fill(88, 116, 224);
  
  font = createFont("Forte", 90);
  fontSize = 70;
  fontMax = 90;
  textFont(font, fontSize);
  textAlign(CENTER);
  
  smooth();
}

void draw() {
  background(220, 10);
  
  distance = dist(width/2, height/2, mouseX, mouseY);
  breathRate =+ map(distance, 0, maxDistance, 5, 10);
  
  if (i < breathRate) {
    text(word, width/2, height/2);
    i++;
  }
  else {
    if (j < 10) {
      breath = lerp(fontSize, fontMax, j/10.0);
      textSize(breath);
      text(word, width/2, height/2);
      j++;
    }
    else if (j >= 10 && j < 19) {
      breath = lerp(fontMax, fontSize, (j-10)/10.0);
      textSize(breath);
      text(word, width/2, height/2);
      j++;
    }
    else if (j == 19) {
      breath = lerp(fontMax, fontSize, 1);
      textSize(breath);
      text(word, width/2, height/2);
      j = 0;
    }
    
    i = 0;
  } 
}


