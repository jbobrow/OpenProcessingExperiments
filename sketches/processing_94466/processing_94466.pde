
//Brennda e Daniela Meira (em aula)
int counter;
void setup() {  
  size(300, 200);
  background(0);  
  colorMode(HSB);   
  counter = 0;
  font = loadFont("CalifornianFB-Reg-25.vlw");
textFont (font,30);
  }
void draw() {  
  counter++;
  noStroke();
  fill(random(255),100,255);
  
  if(mousePressed == true) { 
    ellipse(mouseX, mouseY, 25, 25);
  }
fill(0);
text(dan, 30,100);
}

PFont font;
String dan= "Brennda e Daniela";
