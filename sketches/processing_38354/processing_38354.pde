
int x_position=1;
int x_speed=10;
int y_position=0;
int y_speed=10;


void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  x_position=x_position+x_speed;
  fill(0,255,0);
  ellipse(x_position, 200, 50, 50);


  //if the green ball reached the right side of the screen
  if (x_position>400) {
    //then the ball changes direction
    x_speed=-10;
    ellipse(x_position, 200, 50, 50);
  }
  //if the green ball reached the left side of the screen
  if (x_position<0) {
    //then the ball changes direction
    x_speed=10;
    ellipse(x_position, 200, 50, 50);
  }

y_position=y_position+y_speed;
fill(255,0,0);
ellipse(200,y_position,50,50);

//if the red ball reach the bottom of the screen
if(y_position>400) {
//then the red ball change direction
y_speed=-10;
ellipse(200,y_position,50,50);
}

//if the red ball reached the top of the screen
if(y_position<0){
//then the red ball changes direction
y_speed=10;
ellipse(200,y_position,50,50);
}


}
       
