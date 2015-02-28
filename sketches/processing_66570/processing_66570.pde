
void setup() {
 size(300, 331); 
 background(255);
}

void draw() {
  noStroke();
  rectMode(CORNERS);
//Red
  fill(200, 36, 9);
    rect(0, 0, 18, 71);
    rect(0, 174, 18, 194);
    rect(262, 150, 288, 176);
//Blue
  fill(33, 74, 175);
    rect(98, 0, 128, 28);
    rect(262, 321, 300, 331);
//Yellow
  fill(254, 196, 11);  
    rect(98, 122, 128, 194);
//Black
  fill(0);
    rect(18, 0, 26, 202);
    rect(0, 194, 300, 202);
    rect(90, 0, 98, 331);
    rect(128, 0, 136, 202);
    rect(0, 28, 300, 36);
    rect(18, 114, 300, 122);
    rect(90, 313, 330, 321);  
    rect(202, 0, 210, 331);
    rect(215, 0, 223, 331);
    rect(231, 0, 239, 313);
    rect(254, 0, 262, 331);
    rect(288, 0, 296, 202);
}

