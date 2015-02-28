
char[] input = new char[0];
String[] fontList = PFont.list();
int step = 20;

void setup() {
  size(400, 900);
}


void draw() {
  background(0);
  textAlign(LEFT);
  
  String matchName = new String(input);
  int count = 2;  //  Count fonts that contain matchName string
  if(input.length >= 2) {
    noStroke();
    for(int i=0; i<fontList.length;i++) {
      // Case-insensitive "(?i)" match to the input[] array
      if(match(fontList[i], "(?i)" + new String(input)) != null) {
        textFont( createFont(fontList[i], step) );
        text(fontList[i], 10, count*step);
        count++;
      }
    }
  }

  textFont( createFont("Arial", step) );

  text(matchName, 10, step);
  textAlign(RIGHT);
  text("...browse fonts", width, step);
  stroke(255);
  line(0,step,width,step);
  noLoop();
}

void keyPressed() {
  //BACKSPACE removes last character
  //Non-coded keys will append to the input array.
  if(key == ENTER || key == RETURN) {}
  else if(key == BACKSPACE) { if(input.length > 0) {input = shorten(input);} }
  else if(key != CODED) { input = append(input, char(key)); }
  loop();
}

