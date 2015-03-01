
PFont textfont;

//x coordinates for each line of text
float xc = -65;
float xhw = -65;
float xmx = -400;
float xny = -800;
 
void setup() {
  size(500, 250);
  textfont = loadFont("Monaco-36.vlw");
 
  noLoop();
 
  xc=width/2;
}


void draw() { 
  
  background(250);
  
  textAlign(CENTER);
  fill(0);
  text("click me", xc, height/2);
  xc=800;
  
  textAlign(LEFT);
  fill(0,300,70);
  text("hello world", xhw, 50);
  
  fill(300,0,100);
  text("merry christmas", xmx, 125);
  
  fill(0,100,300);
  text("and a       happy new year!", xny, 200);
  
  xhw++;
  xmx++;
  xny++;
  
  if (xhw >= width) { 
    xhw = -65; 
  }
 
 if (xmx >= width) { 
    xmx = -90; 
  }
 
 if (xny >= width) { 
    xny = -130; 
  }
  
} 

void mousePressed() {
  loop();
}
