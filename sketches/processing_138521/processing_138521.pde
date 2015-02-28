
float segLength = 10;
ArrayList<Triangle> triangles;
color c;
int h,s;
int n = 32;
boolean pressed, help;

float mx,my;
float rr;
float theta;

void setup() {
  size(600,600);
  colorMode(HSB);
  h = (int) random(255);
  s = (int) random(255);
  noStroke();
  rr = .5*(sqrt(width*width+height*height));
  background(0);
  theta = 2*PI/n;
  triangles = new ArrayList<Triangle>();
  for (int j=0;j<n;j++) {
    triangles.add(new Triangle(j*theta,color((h+6*j)%255,255,255,255))); 
  } 
}
 
void draw() {
  if (help) {
    fill(255,255,255); 
    text("HELP:",60,60);    
    text("click on canvas to generate new drawing, keep mouse clicked and move to modify",60,90); 
    text("KEYS:",60,120);
    text("h: help",90,150);
    text("p: print (to procImg<..>.jpg",90,180);
    text("<space>: restart",90,210);
  }
  else { 
    for (int i=0;i<n;i++) {
      if(pressed) {  
         mx = mouseX;
         my = mouseY;
         triangles.get(i).display(mx,my);
      }
    } 
  }
}

void showHelp() {
    fill(255,255,255); 
    text("HELP:",60,60);    
    text("click on button to change color randomly",60,90); 
    text("KEYS:",60,120);
    text("h: help",90,150);
    text("s: save current drawing (to procImg<..>.jpg",90,180);
    text("<space>: generate new drawing",90,210);
}

void mousePressed() {
  background(0);
  help = false;
  pressed=true;
}

void mouseReleased() {
  pressed = false;
}

class Triangle {
  PVector end1 = new PVector();
  PVector end2 = new PVector();
  color col;
  Triangle(float angle,color col) {
  
    this.end1.x = rr*cos(angle)+.5*width;
    this.end1.y = rr*sin(angle)+.5*height;
    this.end2.x = rr*cos(angle+theta)+.5*width;
    this.end2.y = rr*sin(angle+theta)+.5*height;
    this.col = col;
  }
 
  void display(float X1,float Y1) {
    fill(col);
    triangle(X1,Y1,end1.x,end1.y,end2.x,end2.y);
  }
}

void keyPressed() {
  switch(key) {
  case ' ': 
    help = false;
    setup();  
    break;
  case 'h': 
    help = true;
    break;
  case 's':
    save("procImg"+str(millis())+".jpg");
    break;
  default:
    println("unknown key");   // Does not execute
    break;
  }
}
