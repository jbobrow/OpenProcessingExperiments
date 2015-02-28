
float hueOffset = 0.0;
float xOffset = 0.0;
float yOffset = 0.0;

void setup() {
  size(600, 600);
  colorMode(HSB);
}

void draw() {
  background(255);
  noStroke();
  
  textFont(loadFont("Sawasdee-Bold-100.vlw"));
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  String[] chars = split("A B C D E F G H IJ K L M N O P Q R S T U V W X Y Z", ' ');
  
  for (int i = 0; i < chars.length; i++) {
    letter(chars[i], i / 5, i % 5);
  }
  
  hueOffset += 0.008;
}

void letter(String letter, int row, int col) {
  
  float x = (col * (width / 5.0)) + (width / 10.0);
  float y = (row * (height / 5.0)) + (height / 10.0);
  
  float letterNoiseIndex = (col * 5) + row;
  
  float letterHueNoise = noise(hueOffset + letterNoiseIndex);
  float backgroundHueNoise = letterHueNoise + 0.6;
  float letterHue = letterHueNoise * 255;
  float backgroundHue = (255 * backgroundHueNoise) % 255;
  
  fill(backgroundHue % 255, 170, 255);
  rect(x, y, width / 5.3, height / 5.3);
  
  fill(letterHue, 200, 255);
  text(letter, x, y);
}

