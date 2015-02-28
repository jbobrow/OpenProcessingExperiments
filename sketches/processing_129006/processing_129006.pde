
bug[] bugs;
cell[][] setka;

int ln = 40;
PVector loc;
PVector speed;
float sizeb;
float spd;

int columns = 60;
int rows = 20;
float offset = 30;

void setup() {
  size(900, 300);
  
  bugs = new bug[ln];
  for(int i = 0; i < ln; i++) {
    sizeb = random(10, 40);
    spd = map(sizeb, 10, 40, 3, 0.2);
    loc = new PVector(random(offset, width-offset), random(offset, height-offset));
    speed = new PVector(random(-spd, spd), random(-spd, spd));
    bugs[i] = new bug(loc, speed, sizeb);
  }

  setka = new cell[columns][rows];
for(int i = 0; i < columns; i++) {
for(int j = 0; j < rows; j++) {
float ri = map(i, 0, columns-1, offset, width-offset);
float rj = map(j, 0, rows-1, offset, height-offset);
setka[i][j] = new cell(ri, rj);
}
}
}

void draw() {
  background(#fcfcfc);
  
  for(int i = 0; i < columns; i++) {
for(int j = 0; j < rows; j++) {
setka[i][j].doit();
}
}
  
  for(int i = 0; i < ln; i++) {
    bugs[i].run();
  }
}

class bug {
  
  PVector v1;
  PVector s1;
  float size;
  
  bug(PVector _v1, PVector _s1, float _size) {
    v1 = _v1;
    s1 = _s1;
    size = _size;
    
    
  }
  
  void run() {
    bounce();
    move();
    legs();
    display();
  }
  
  
  
  void bounce() {
if(v1.x < 0) {
s1.x = s1.x*-1;
}
if(v1.x > width) {
s1.x = s1.x*-1;
}
if(v1.y < 0) {
s1.y = s1.y*-1;
}
if(v1.y > height) {
s1.y = s1.y*-1;
}
}
  
  void move() {
    float distm = dist(mouseX, mouseY, v1.x, v1.y);
    PVector mouse = new PVector(mouseX, mouseY);
    if(distm < 50 && mousePressed == true) {
      v1 = mouse;
    } else{
    v1.add(s1);
  }
  }
  
  void display() {
    //mouse
    
    if(mousePressed == true) {
    noFill();
    strokeWeight(4);
    stroke(#E1E8D3);
    ellipse(mouseX, mouseY, 40, 40);
    } else {
   strokeWeight(2);
   noFill();
   stroke(#E1E8D3); 
    ellipse(mouseX, mouseY, 50, 50);
    }


      
    
    //fill(#FAD9A7);
    //stroke(#C3D69B);
    fill(0);
    stroke(180);
    strokeWeight(5);
    ellipse(v1.x, v1.y, size, size);
  }
  
  void legs() {
    for(int i = 0; i < columns; i++) {
      for(int j = 0; j < rows; j++) {
        float dist2 = dist(v1.x, v1.y, setka[i][j].x, setka[i][j].y);
        float xa = v1.x;
        float ya = v1.y;
        //line(v1.x, v1.y, setka[i][j].x, setka[i][j].y);
        if (dist2 > size*0.1 && dist2 < size*1.2) {
          strokeWeight(6);
          line(xa, ya, setka[i][j].x, setka[i][j].y);
          strokeWeight(2);
          ellipse(setka[i][j].x, setka[i][j].y, 6, 6);
        }
      }
    }
  }
  
}
class cell {
float x;
float y;

cell(float _x, float _y){
x = _x;
y = _y;
}

void doit(){
  display();
}

void display() {
  //ellipse(x, y, 2, 2);
}
}

