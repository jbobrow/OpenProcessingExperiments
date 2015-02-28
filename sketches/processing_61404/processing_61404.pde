
String[] headlines = {
  "HAIR   NAILS   WAXING  HAIR   NAILS   WAXING  HAIR   NAILS   WAXING",
};

PFont f;
float x;  // horizontal location of headline
int index = 0;

void setup() {
  size(600,600);
  f=loadFont("CorsivaHebrew-48.vlw");
}

void draw() {
background(230,40,210);
textFont(f,40);
fill(random(177),247,10);
text("Erotic",300,300);
fill(random(177),247,10);
text("Erotic",100,100);
fill(random(177),247,10);
text("Erotic",140,140);
fill(random(177),247,10);
text("Erotic",240,340);
fill(random(177),247,10);
text("LASER HAIR REMOVAL",20,410);

textFont(f, 20);        
  textAlign(LEFT);
  text(headlines[index], x, 180); 

  // Decrement x
  x = x - 3;

  // If x is less than the negative width, 
  // then it is off the screen
  float w = textWidth(headlines[index]);
  if (x < -w) {
    x = width; 
    index = (index + 1) % headlines.length;
    
    
    
    
  }


}



