
int clicks = 1;
int g = 0;
float a;
 float b;
void setup(){
 size(1000,1000);
 background (0,0,0);
PFont font;
font = loadFont("18thCentury-48.vlw");
textFont(font, 14);
}
void draw(){
  if (clicks==1) {
    text("You think I'm boring and cold?", 15, 50);
  }
  else if (clicks==2) {
    text("I assure you I'm just distracted by the cacaphony of thoughts in my head!", 30, 100);
  }
  else{
       
       for (int i =0; i<2; i++){
       a = random(1, 1000);
       b = random(1, 1000);
       }
       text("THOUGHTS!",a,b);
    }
}
void mousePressed() {
  clicks =clicks+1;
}

