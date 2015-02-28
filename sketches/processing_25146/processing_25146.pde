
// using a sine wave (sin()) to animate some text. 

void setup() {
  size(300, 200);  
  PFont font = createFont("HelveticaCY-Bold", 96);
  textFont(font);
}

void draw() {
  background(255); 
  fill(0);
  
  String message = "turbulence";
  char[] letters = message.toCharArray();
  
  // set a starting position for drawing the letters
  float x = 10;
  
  for (int i=0; i < letters.length; i++) {    
    
    // calculate a font size between 26 and 96 point using a sinewave and map()
    float angle = radians( 3*(frameCount+10*i) );
    float sine = sin(angle);
    float fs = map(sine, -1, 1, 26, 96);
    textSize(fs);
    
    // map the size 'fs' to an alpha value --> smaller letters will be dimmer
    //fill(0, map(fs, 45, 96, 128, 255));
    
    text(letters[i], x, height-60);
    x += textWidth(letters[i]);      
  }
}

