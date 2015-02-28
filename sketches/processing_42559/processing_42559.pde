

String flee;
int a = 100;
int b = 100;
int clear = 253;
float r = (0);
float g = (0);
float d = (0);
float c = (100);


void setup () {
  size (500, 500);

  
}

void draw () {
  background (r, g, d);
  PFont font;
  
font = loadFont("bauhaus.vlw");
  textFont(font);
  fill(10);
  text("like ripples on a blank shore", 5, 50, 40);

rect( 0, 0, 320, 100);

ellipse (a, b, 80, 80);
  a = 100 + 100;
  b = 300;
if(dist(mouseX, mouseY, 200 ,300) < 40) {
  clear = 253;
  fill(50, 50, d, clear);
  rect( 0, 0, 320, 100);
  }else{  
    clear = 0;
  fill (50,50, d, clear);
  rect (0, 0, 320, 100);
  }

ellipse (400, 200, 40, 40);
if(dist(mouseX, mouseY, 400 ,200) < 20) {
  clear = 253;
 
  r = random (253, 0);
  g = random (253, 0);
  d = random (253, 0);
 
  fill (0, 0, d, clear);
  rect (0, 0, 320, 100);
  font = loadFont("bauhaus.vlw");
  textFont(font);
  fill(20, 80, 80);
  text("like ripples on a blank shore", 3, 50, 40);

  }else{   
    clear = 0;
    d = random (253, 0);
    fill (0,0, d, clear); 
    rect (0, 0, 320, 100);
   
  }

ellipse (400, 200, 40, 40);
if(dist(mouseX, mouseY, 400 ,200) < 20) {
  

  
  }else{   
     c = 50;
  }
}


