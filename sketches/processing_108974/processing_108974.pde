
float x;
float y;
float diam;
int count;
int state;
 
void setup(){
  size(1200,300);
  background(0);
}
 
void draw(){
 
diam = 1;
 
x = random(width);
y = random(height);
 
count++;
if(count > 30){
  count = 10;
  state++;
   
  if(state > 3000){
    state = 100;
    background(0);
  }
   
  }
 
diam = 2;
count = count + 1;
rect(x,y,diam,diam);
}




