
PFont font2;
PFont font1;

void setup(){
  size (250, 250);
  background (0);
  smooth ();
 
char[] charArr = {'L', '5', 'B', '1', 'R', '6'};

font2 = createFont ("Caslon", 10);
font1 = loadFont ("OCRAExtended-48.vlw");
textFont (font2, 24);
textFont (font1, 100);
 
for (int i = 0; i < 90; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    fill (255, 10);
    text (charArr[counter], random(255), random(255));
  };
};
}

void draw () {
  textFont(font1, 25);
  noStroke();
  fill(255,0,0,10);
  text("L5B 1R6", 10,240);
 
}


