
void setup(){
size(600,600); 
background(225);
frameRate(5);
}

void draw(){
  
float x, y;
int a = 15;
PVector[] pts = new PVector[a];

for (int i = 0; i < a; i++) {
x = random(width);    
y = random(height);
pts[i] = new PVector(x, y);
}


for (int i = 0; i < a; i++) {
for (int j = 0; j < a; j++) {
if ( j != i ) {
stroke(random(232),random(21),134,8);
line(pts[i].x,  pts[i].y, pts[j].x, pts[j].y );
}
}
}
}
