
//789 lines

//Lines start at y = 50px and end at y = 750px
int y1 = 50;
int y2 = 750;
float x1, x2;

//Drawing 789 lines
int i = 0;
int n = 789;

void setup(){
  //Drawing is 900, 800
  size(900,800);
  smooth();
  noFill();
  strokeWeight(1);
  //Dark background, light lines
  background(0);
  stroke(255,50);
}

void draw(){

  if (i < n){
    //Left edge of drawing is at 50px
    //Right edge of drawing is at 850px
    x1 = random(50, 850);
    x2 = random(50, 850);
    line(x1, y1, x2, y2);
  }
    
  i = i + 1;
}
