
color BgColor = #FFFFFF;
color RectColor = #CCCCCC;
color TextColor1 = #000000;
color TextColor2 = #FF3B3B;
PFont font;
char  type;
float typeW;

int col = 23;
int row = 4;
float Margin;
float X[];
float Y[];

void setup () {
  size(900, 200);
  font = loadFont("AmericanTypewriter-50.vlw");
  textFont(font, 50);

  type = '0';
  typeW = textWidth(type);
  Margin = typeW;
  
  X = new float[col+1];
  Y = new float[row+1];
  
  for(int i = 0; i <= col; i++) {
    for(int j = 0; j <= row; j++) {
    X[i] = map(i, 0, col, Margin, width - Margin);  
    Y[j] = map(j, 0, row, Margin, height - Margin);
    }
  }
  smooth();
}



void draw () {
  background(BgColor);
for(int i = 0; i <= col; i++) {
  for(int j = 0; j <= row; j++) {
    pushMatrix();
      translate(X[i], Y[j]);
        textAlign(CENTER, CENTER);
        fill(TextColor1);
          text(type, -typeW/4, 0);
         rotate(radians(180));
         fill(TextColor2);
          text(type, -typeW/4, 0);
    popMatrix();

    }
  }
}



void keyPressed() {
    type = key;
}



