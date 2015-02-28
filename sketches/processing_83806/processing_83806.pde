
PImage png_version;
PImage cat1; 
PImage cat2;
PImage bowl;

//sketch, add file

Letter[] all_letters = new Letter[26];
ArrayList word = new ArrayList();

int master_order = 0;
void setup() {
  size(500, 500);
  bowl = loadImage("drawing3.png");
  cat1 = loadImage ("drawing1.png");
  cat2 = loadImage ("drawing2.png");
  for (int i = 0; i<26; i++) {
    all_letters[i] = new Letter(char('a'+i));
  }
}
void draw() {
   background(140, 112, 174);
  image(bowl, 240, 20);
  for (int i = 0; i<26; i++) {
    if (all_letters[i].isSetup == true) {
      all_letters[i].update();
      all_letters[i].display();
    }
 
    
  }
  for(int i = 0; i<word.size(); i++) {
      Letter temp = (Letter) word.get(i);
      temp.update();
      temp.display();
  }
  
   //if key pressed, have image change
  if(keyPressed) {
   image(cat2, 30, 10); 
} else {
  image(cat1, 30, 10); 
}
}
void keyPressed() { 
  Letter temp = new Letter(key);
  temp.isSetup = true;
  temp.order = master_order;
  word.add(temp);
  
  
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
    start_x = 300;
    start_y = 50;
    end_y = 200;
    letter = _l;
  }
  void update() {
    end_x = order * 10 + 200;//sets up tracking
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


