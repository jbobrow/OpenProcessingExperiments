
PFont myFont;
int i = 0;

void setup() {
 
 size(400, 400, P2D);
 smooth();
 background(0);
 
 myFont = loadFont("Gota-48.vlw");
 
 textFont(myFont);
  
}

void draw() {
  
  if(i==0) {
    
    if(mousePressed) { 
      
      fill(random(255));
      textSize(96);
      text("Disco", 30, 200);
    
    } else {
      
      fill(random(255));
      textSize(random(24,48));
      textLeading(random(10,67));
      text("Disco", random(-150,400), random(-50,400), 400, 400);
    
    }
    
    fill(0,5);
    rect(0,0,400,400);
  
  }
  
}

