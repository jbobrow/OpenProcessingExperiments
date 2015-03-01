
//What I had problems with was the mix of the counter function while moving the balls.

//So I tried combining coutner and state functions
float diam;
int count;
int state;

int x = 0;
int speed = 1;

void setup() {
  count = 0;
  state = 0;
  
  size(400,400);
  background(0);  
}
//I combined the counter by having it in draw as original examples
void draw() {
  move(); 
  bounce();
  display();
 
  count++;
  if(count > 30){
    count = 0;
    state++;
    if(state > 8){
       state = 0;
       //for some reason the circle dissapears after the cycle though??
    } 
  }
}
//but later on added the other functions to house the state function
void move () {
  x=x + speed;
}

void bounce () {
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
}
  
void display() {
  background (0);
  fill(20,220,80);
  diam = state * 20;
  ellipse(x,width/2,diam,diam);
}

//so while it isnt perfect, if I tinkered enough with it (though this is hours of tinkering alone)
//then i could try to make multiple circles affected by count and state to make the question from the test (vertical movement)
