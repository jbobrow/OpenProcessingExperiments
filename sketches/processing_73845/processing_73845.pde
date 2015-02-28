
void setup() {
  background(0);
  size(500, 500);
  smooth(); 
  noStroke();
}

void draw(){
  
  if(keyPressed) {
    if (key == '1') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String s = "1";
textSize(14);
text(s, mouseX, mouseY, 15, 15);
    }
  }
  
   if(keyPressed) {
    if (key == '2') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String t = "2";
textSize(14);
text(t, mouseX, mouseY, 15, 15);
    }
  }
  
 if(keyPressed) {
    if (key == '3') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String u = "3";
textSize(14);
text(u, mouseX, mouseY, 15, 15);
    }
  }
  
   if(keyPressed) {
    if (key == '4') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String v = "4";
textSize(14);
text(v, mouseX, mouseY, 15, 15);
    }
  }
  
   if(keyPressed) {
    if (key == '5') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String w = "5";
textSize(14);
text(w, mouseX, mouseY, 15, 15);
    }
  }
  
   if(keyPressed) {
    if (key == '6') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String x = "6";
textSize(14);
text(x, mouseX, mouseY, 15, 15);
    }
  }
  
   if(keyPressed) {
    if (key == '7') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String y = "7";
textSize(14);
text(y, mouseX, mouseY, 15, 15);
    }
  }
  
   if(keyPressed) {
    if (key == '8') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String z = "8";
textSize(14);
text(z, mouseX, mouseY, 15, 15);
    }
  }
  
   if(keyPressed) {
    if (key == '9') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String a = "9";
textSize(14);
text(a, mouseX, mouseY, 15, 15);
    }
  }
  
   if(keyPressed) {
    if (key == '0') {
      
  PFont font;
font = loadFont("Courier-48.vlw");
fill(91, 188, 63);
textFont(font); 
String b = "0";
textSize(14);
text(b, mouseX, mouseY, 15, 15);
    }
  }
  
 
}




void mousePressed(){
   x = mouseX;
   y = mouseY;
}

float i = 0;
float j = 255;
float k = -510;
float l = 1020;
float m = -1275;
float n = 1785;
float o = -2040;
float p = 2550;
float q = -2805;
float r = 3315;

float s = 0;



void mouseDragged(){
  i = i + 1;
  j = j - 1;
  k = k + 1;
  l = l - 1;
  m = m + 1;
  n = n - 1;
  o = o + 1;
  p = p - 1;
  q = q + 1;
  r = r - 1;
  
  s = 0 + 7.65;
  
 

  if(j>-255) {
  stroke(j, 0, 0);
  } else if(j>-510){
  stroke(0, k, 0);
  } else if(j>-765){
  stroke(0, l, 0);
  } else if(j>-1275){
  stroke(0, 0, m);
  } else if(j>-1530){
  stroke(0, 0, n);
  } else if(j>-2040){
  stroke(o, 0, o);
  } else if(j>-2295){
  stroke(p, 0, p);
  } else if(j>-2805){
  stroke(q, q, 0);
  } else {
  stroke(r, r, 0);
  }
  
  strokeWeight(40);
  line(mouseX, mouseY, pmouseX, pmouseY); 
   x = mouseX;
   y = mouseY;
}

    float x,y;
    
    void keypressed(){
      if (key == ' '){
      fill(0);
      rect(0, 0, 500, 500);
      }
    }
    
    void clear() {
  size(500, 500);
  background(0);
    }
    
    void keyPressed () {
  if (key == ' ') {
    clear();
  }
}

      

 










