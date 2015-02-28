
//yi-ting sie
//課程練習：fractals
//透過碎形的衍生方式，讓點與點相互連接，並產生分支。
//Sheng-Fen Nik Chien (2011), Complexity - fractals, 數位學習平台─數位資訊創作 http://moodle.ncku.edu.tw/course/view.php?id=43022。  

int _numChildren = 15;  
int _maxLevels = 3;  
Branch _trunk;     

void setup() {  
  size(600, 600);  
  background(255);  
  noFill();  
  smooth();  
  newTree();  
}    

void draw() {  
  background(255);  
  _trunk.updateMe(width/2, height/2);  
  _trunk.drawMe();  
}  
   
void newTree() {  
  _trunk = new Branch(1, 0, width/2, 100);  
  _trunk.drawMe();  
}  

class Branch {
float level, index;
float x, y;
float endx, endy;
float strokeW, alph; // line style
float len, lenChange; // length
float rot, rotChange; // rotation
Branch[] children = new Branch[0];

Branch(float lev, float ind, float ex, float why) {
level = lev;
index = ind;
strokeW = (1/level)*10;
alph = 255/level;
len = (1/level)*random(200);
lenChange = random(10)-5;
rotChange = random(10)-5;
updateMe(ex, why);

if (level < _maxLevels) {
children = new Branch[_numChildren];
for (int x=0; x<_numChildren; x++) {
children[x] = new Branch(level+1, x, endx, endy);
}
}
}

void updateMe(float ex, float why) {
x = ex;
y = why;
rot += rotChange;
len -= lenChange;
if (len<0 || len>200) { lenChange *= -1; }
float radian = radians(rot);
endx = x+(len*cos(radian));
endy = y+(len*sin(radian));
for(int i=0; i<children.length; i++) {
children[i].updateMe(endx, endy);
}
}

void drawMe() {
strokeWeight(strokeW);
stroke(100,150,20,100);
fill(255,100,50,250);
line(x, y, endx, endy);
ellipse(endx, endy, len/15, len/5);
for(int i=0; i<children.length; i++) {
children[i].drawMe();
}
}
}

void keyPressed(){
saveFrame("fractals002-####.png");
}

