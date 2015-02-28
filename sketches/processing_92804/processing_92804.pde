
PFont font;
char a;
char [] alphabet = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 
  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
}; 

int[] alphnumbers = {
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 
  20, 21, 22, 23, 24, 25, 26
};


void setup() {
  size (600, 600);
  background(255); 
  font = loadFont ("Circuit-48.vlw");
  textFont(font, 100);
}

void draw() {
  for (int i=0; i < 7; i++) {
    char a= alphabet[i];
    fill(0, 0, 0);
    text (a, 100*i, 100); 


    if (i > 6) {
      char b= alphabet[i];
      fill(0, 0, 0);
      text (b, 200, 200);
    }
  }
}



