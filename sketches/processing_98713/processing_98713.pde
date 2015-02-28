
// Alive
//
// 'r' - clear screen

int[] years;
int born=1990, now=23, start=1980, total=100, c, R;
float s=100, r;

void setup() {
  c = start;
  size(600,400);
  background(0);
  textAlign(CENTER,CENTER);
  years = new int[total];
  for (int i=0; i<total; i++) {
   years[i] = c+i;    
  }
  R = round(random(1));
  if (R==0) {R=-1;}
  r = random(0.1);
}

void draw() {
  noStroke();
  fill(0,0,0,5);
  textSize(s);
  if (c>=born && c<=born+now) { fill(255,255,0,20); } else {fill(255,255,255,10);}
  translate( (s-100)*r*(c-start), (s-100)*r*(c-start) );
  rotate(R*s/10);
  text(str(years[c-start]),100,100);
  s+=0.1;
  if (c<start+total-1 && frameCount%5==0) { c++; } 
  if (c>=start+total-1) { c=start; }
  if (s>300) { 
    s=100;
    R = round(random(1));
    if (R==0) {R=-1;} else {R=1;}
    r = random(0.1);
  }  
}

void keyPressed() {
 if (key == 'r') { background(0); } 
}


