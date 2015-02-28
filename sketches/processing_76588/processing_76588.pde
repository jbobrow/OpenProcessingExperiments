
PImage png_version;

//sketch, add file

Letter[] all_letters = new Letter[26];
int master_order = 0;
void setup() {
  size(400, 400);
  png_version = loadImage("ABC.png");
  for (int i = 0; i<26; i++) {
    all_letters[i] = new Letter('a');
  }
}
void draw() {
  background(200);
  image(png_version, 30, 20);
  for (int i = 0; i<26; i++) {
    if (all_letters[i].isSetup == true) {
      all_letters[i].update();
      all_letters[i].display();
    }
  }
}
void keyPressed() {
  if (key == 'a') {
    Letter temp = new Letter('a');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[0] = temp;
  }
  if (key == 'b') {
    Letter temp = new Letter('b');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[1] = temp;
  }
  if (key == 'c') {
    Letter temp = new Letter('c');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[2] = temp;
  }
   if (key == 'd') {
    Letter temp = new Letter('d');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[3] = temp;
  } 
  if (key == 'e') {
    Letter temp = new Letter('e');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[4] = temp;
  } 
  if (key == 'f') {
    Letter temp = new Letter('f');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[5] = temp;
  }
   if (key == 'g') {
    Letter temp = new Letter('g');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[6] = temp;
  }
   if (key == 'h') {
    Letter temp = new Letter('h');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[7] = temp;
  }
   if (key == 'i') {
    Letter temp = new Letter('i');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[8] = temp;
  }
   if (key == 'j') {
    Letter temp = new Letter('j');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[9] = temp;
  }
   if (key == 'k') {
    Letter temp = new Letter('k');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[10] = temp;
  }
   if (key == 'l') {
    Letter temp = new Letter('l');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[11] = temp;
  }
   if (key == 'm') {
    Letter temp = new Letter('m');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[12] = temp;
  }
   if (key == 'n') {
    Letter temp = new Letter('n');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[13] = temp;
  }
   if (key == 'o') {
    Letter temp = new Letter('o');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[14] = temp;
  }
   if (key == 'p') {
    Letter temp = new Letter('p');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[15] = temp;
  }
   if (key == 'q') {
    Letter temp = new Letter('q');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[16] = temp;
  }
   if (key == 'r') {
    Letter temp = new Letter('r');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[17] = temp;
  }
   if (key == 's') {
    Letter temp = new Letter('s');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[18] = temp;
  }
    if (key == 't') {
    Letter temp = new Letter('t');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[19] = temp;
  }
    if (key == 'u') {
    Letter temp = new Letter('u');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[20] = temp;
  }
    if (key == 'v') {
    Letter temp = new Letter('v');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[21] = temp;
  }
    if (key == 'w') {
    Letter temp = new Letter('w');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[22] = temp;
  }
    if (key == 'x') {
    Letter temp = new Letter('x');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[23] = temp;
  }
    if (key == 'y') {
    Letter temp = new Letter('y');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[24] = temp;
  }
    if (key == 'z') {
    Letter temp = new Letter('z');
    temp.isSetup = true;
    temp.order = master_order;
    all_letters[25] = temp;
  }

  
  if (key == ' ') {
    //reset everything
    for (int i = 0; i<26; i++) {
      all_letters[i].isSetup = false;
    }
    master_order = 0;
  }
  master_order = master_order + 1;
}

class Letter {
  float start_x, start_y, end_x, end_y;
  char letter;
  Boolean isSetup = false;
  int order = 0;
  Letter (char _l) {
    start_x = 50;
    start_y = 50;
    end_y = 200;
    letter = _l;
  }
  void update() {
    end_x = order * 20 + 200;
    if ((start_y > end_y+2) || (start_y < end_y-2)) {
      float d = 0;
      if (start_y > end_y) {
        d = start_y - end_y; //distance
        d = d * .05;
      }
      if (start_y < end_y) {
        d = start_y - end_y; //distance
        d = d * .05;
      }
      start_y -= d;
    }
    if ((start_x > end_x+2) || (start_x < end_x-2)) {
      float d = 0;
      if (start_x > end_x) {
        d = start_x - end_x; //distance
        d = d * .05;
      }
      if (start_x < end_x) {
        d = start_x - end_x; //distance
        d = d * .05;
      }
      start_x -= d;
    }
  }//end update loop
  void display() {
    text(letter, start_x, start_y);
  }
}


