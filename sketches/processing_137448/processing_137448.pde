
String []lineas;
PFont [] all = new PFont [5];
int c = 0; 
void setup() {
  lineas= loadStrings ("jaime sabines.txt");
  size (2000, 2000);
  background (#B6D7FA);
  for (int i=0; i<all.length;i++) {
    all[i]= loadFont (i+".vlw");
  }
}
void draw () {
  background(#DEC84E);
  if (c<all.length-1) {
    c++;
  }
  else {
    c = 0;
  }

  textFont (all[c]);

  for (int i=0; i<lineas.length; i++) {
    text (lineas[i], 1*100, i*30, 1500, 1800);


    fill (#0C4E93);
  }
}

