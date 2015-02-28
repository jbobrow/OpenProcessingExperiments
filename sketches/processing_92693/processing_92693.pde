
boolean reset;
boolean first;
boolean colored;

void setup() {
  first = true;
  size(800, 800);
  background(255);
  colored = true;
}

void draw() {
  fill(10, 5);
  if(mousePressed){
    if(!reset && mouseX > 390 && mouseX < 410 && mouseY > 390 && mouseY < 410) {
      if(colored){
        background(0);
        colored = false;
      } else {
        background(255);
        colored = true;
      }
    }
    if(mouseX != 400 && mouseY != 400){
      drawLightning(mouseX, mouseY);
      stroke(255, 15);
      strokeWeight(2);
    }
    reset = true;    
  } else {
    if(!first) {
      ellipse(395, 400, 20, 20);
      fill( 100 , 121, 20 );
    }
    first = false;
    reset = false;
  }
}

void drawLightning(int x, int y){
  
   colorMode(HSB, 360, 100,100);
  
   int a = x + round(random(100) -50);
   int b = y + round(random(100) -50);
 
   for(int i = 0; i < 2; i++){
    
   stroke(180*int(random(5)), 30, 50+random(75));
   ellipse(a, b, 5, 5);
   if(colored){
     stroke(0);
   } else {
     stroke(255);
   }
   line(x, y, a, b);
   
   x = a;
   y = b;
   
   a = x + round(random(100) -30);
   b = y + round(random(100) -30);
   }  
}

