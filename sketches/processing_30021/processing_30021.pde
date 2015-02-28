
//QUESTION 2

int wh = 20;        //Width and height
float x1 = 10;      //Starting point for Green ball
float x2 = 290;     //Starting point for Red ball
float speed1 = 1;   //The different speeds
float speed2 = 2;
int direction1 = 1; //Helps determine which direction the ball moves
int direction2 = 1;
int counter = 0;

void setup(){
  size(300,100);
  smooth();
}

void draw(){
  background(200);
  Green();
  Red();
  Counter();
}

void Green(){
  fill(0,255,0);
  x1 += speed1 * direction1; 
  ellipse(x1,50,wh,wh);
  if (x1 > 95){
  direction1 =-direction1;
  }
  if (x1 <= 10){
    direction1= direction1 *-1;
  }
}

void Red(){
    fill(255,0,0);
  x2 += -speed2 * direction2;
  ellipse(x2,50,wh,wh);
  if (x2 < 120){
  direction2 =-direction2;
  }
  if (x2 >= 290){
    direction2= direction2 *-1;
  }
}

void Counter(){ 
  fill(0,0,0);
  text(counter,40,20);
  if (x2 < 120){  
    counter += 1;
  }
}

