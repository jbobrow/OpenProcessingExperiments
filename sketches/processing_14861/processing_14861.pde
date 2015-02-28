
String phrase = "";
int a = 0;
int b = 0;


void setup() {
  size(800,800);
  background (0);
}

void draw() {
}







void keyPressed() {
  phrase = phrase + key;


  if(key == ENTER) {
   
   
      a = int(random (20,80));
  b = int(random (800));
    textSize(a);
    fill(random(255),random(255), random(255));
    text(phrase,b,b);
    
      phrase = "";
    
      }
}
