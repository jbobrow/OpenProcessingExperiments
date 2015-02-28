
//Karam Byun 09.16.2013
//Daniel Shiffman Tuesday Class
//Ordered Patterns & mouse Drag for messiness

int x = 0;
int y = 0;
int a = 0;
int b = 0;
int lenTri = 20; // Length of small Triangle sides
int lenTria = 120; // Length of Big Triangle sides

void setup() {
  size(748, 800);
  background(0);
  stroke(255);
    
  line(0, height/2, width, height/2);
  noStroke();
}

void draw() {
  
  stroke(255);
  line(0, height/2, width, height/2);
  noStroke();
    
  //background drawing
  smallTri();
  bigTri();
  
}

void mouseDragged() {
  
  //moves small triangle alignment depending on mouse location
  //fill(200,0,0,50);
  //ellipse(mouseX,height/2,20,20);
  x+=lenTri*map(mouseX, 0, width, 0, 10);
}


void bigTri() {

  noStroke();
  if (random(1) > 0.5) {
    //fill(b+100,0,a, 10);
    fill(200,0,a+50,10);
    triangle(a, b+lenTria, a+lenTria/2, b, a+lenTria, b+lenTria);
  }
  else {
    //fill(b, a+100, 0, 10);
    fill(1,100,a+100,10);
    triangle(a, b, a+lenTria/2, b+lenTria, a+lenTria, b);
  }

  a+=lenTria;
  if (a>width) {
    a=0;
    b+=lenTria;
  }
  if (b >= height) {
    a=0;
    b=0;
  }
}



void smallTri() {
  stroke(200, 40);
  line(x, y, width/2, height/2);
  noStroke();
  if (random(1) > 0.52) {
    fill(x+100, 0, y, 100);
    triangle(x, y+lenTri, x+lenTri/2, y, x+lenTri, y+lenTri);
  }
  else {
    fill(x, y+100, 0, 50);
    triangle(x, y, x+lenTri/2, y+lenTri, x+lenTri, y);
  }
  x+=lenTri+lenTri*6;
  if (x>width) {
    x=0;
    y+=lenTri;
  }
  if (y >= height) {
    background(random(0, 25));
    x=0;
    y=0;
  }
}


