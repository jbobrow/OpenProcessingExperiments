
 
float a;
float b;
float c;
float d;
float x;
float y;
int value = 60;
int state;
int count;

 
void setup() {
  state = 0;
  size(800,800);
  background(255);
  smooth();   
}
 
void draw() {

  
   count++;
  if(count > 10){
    count = 0;
    state++;
    if(state > 8){
       state = 0;
       background(255);
       frameRate(value);
       value++;
    }
  }
   
  a = random(255);
  b = random(255);
  c = random(255);
  d = random(255);
  x= random(800);
  y= random(800);

 


  noStroke();
  fill(a,b,c,d);
  rect(x,y,x,y);
}

void mousePressed() {
if (value > 0) {
value = value/2;
}
}



