
float r;
float g;
float b;
float diam;
float x = -10;
float y = 10;
int count;
int state;

void setup() {
  count = 0;
  state = 0;
  size(500,500); 
  background(255);
  smooth();
}

void draw() {

  count++;
  if(count > 10){
    count = 0;
    state++;
    if(state > 60){
       state = 0;
       background(255);
       x = -10;
       y = 10;
    } 
 
  }
  
  diam = 20;
  r = state * 10; 
  g = state * 5;
  b = state * 10;
  x = x + 20; //moves new circles to the right
  
  if (x > 500){
  x = x - 500; //resets x once the row is filled
  }
  
  noStroke();
  fill(r,g,b);
  ellipse(x,y,diam,diam);
  if((x % 490) == 0){ //checks if current row is full
    y = y + 20; //moves the the next row
  }
}



