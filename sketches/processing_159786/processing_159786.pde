
//supposed to be matrix-esque text

//declare variables

float r;
float g;
float b;
float a;

float y;
float x;

int count;
int state;

//make background and declare state

void setup (){
  size (500,500);
  background (10);
  smooth ();
  
  count = 0;
  state = 0;
}

//code looping

void draw (){
  //start 1st sequence of blocks
  if (count<=50){
    float b = random(20);
    float r = random(200);
    float g = random(20);
    float a = random(190);
    x = random(width);
    y = random(height);
    
    count++;
    if (count > 50){
      count = 0;
      state = state+10;
    }
    fill (b,r,g,a);
    y = state*2;
    rect (y, x, 10, 10);
    
    
    if (state >=250) {
      background (10);
      state = 0;
   }
  }
}
