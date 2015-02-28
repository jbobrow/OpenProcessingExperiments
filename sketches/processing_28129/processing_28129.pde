
int numfoods = 5;
Food[] foodDrop = new Food[numfoods];

//--------------------Varibles

//--Images
PShape bg;
PShape elephant;
PShape mouse;
PShape curtain;
PShape curtain2;
PShape peanut;

float elephantX;

float d; // distance between the food and elephant
int range = 50; //range of detection
int score = 0;

//--------------------Stage
void setup() {
  size(700, 559);
  smooth();
  noStroke();

  //--Images Dir 
  bg = loadShape("bg.svg");
  curtain = loadShape("curtain.svg"); 
  curtain2 = loadShape("curtain2.svg");   
  elephant = loadShape("elephant.svg"); 
  mouse = loadShape("mouse.svg"); 
  peanut = loadShape("peanut.svg"); 
  shapeMode(CENTER);

  for (int i = 0; i < numfoods; i++) {
    float speed = i * 0.3;
    float initialSpeed = speed;
    foodDrop[i] = new Food(int(random(100, 850)), 0, speed, random(0.05, 0.2), initialSpeed);
  }
}

//--------------------Drawing
void draw() { 
  background(255);


  shape(bg, width/2, height/2 );
  shape(curtain2, width/2, height/2);
  
  elephantX = constrain(map(mouseX, 0, width, 45, width-45),45,600);
  shape(elephant, elephantX, 330, 260,270);

  for(int i = 0; i < numfoods; i++) {
    foodDrop[i].display();
    foodDrop[i].update();
  }
  println(mouseY);
  for(int i = 0; i < numfoods; i++) {
    d = abs(foodDrop[i].x - elephantX); //distance between peanut and middle of elephant
    if (foodDrop[i].y > 220 && foodDrop[i].y < 320 && d < 130 ) {
      foodDrop[i].x = int(random(100, 850));
      foodDrop[i].y = 0;
      foodDrop[i].speed = foodDrop[i].intialSpeed;
      foodDrop[i].fade = 255;
      score++;
    }
    if (foodDrop[i].fade == 0) {
      foodDrop[i].x = int(random(100, 850));
      foodDrop[i].y = 0;
      foodDrop[i].speed = foodDrop[i].intialSpeed;
      foodDrop[i].fade = 255;
      score--;
    }
  }
  
  shape(curtain, width/2, height/2);
  fill(0);
  text("Score: " + score, 20, height-20);
}


class Food
{
  int x;
  int y;
  int fade = 255;
  float g;
  float speed;
  float intialSpeed;
  boolean show = true;

  Food (int tempx, int tempy, float tempspeed, float tempg, float tempinitial) {
    x = tempx;
    y = tempy;
    g = tempg;
    speed = tempspeed;
    intialSpeed = tempinitial;
  }

  void display() {
    if ( show == true) {
      fill(#ff0000, fade); //fade is opacity
      shape(peanut,x,y,15,23); //manually scale
    }
  }

  void update() {
    speed += g;
    y += speed;
    
    if (y >= 535) { // if peanut has reached the bottom
      speed = 0;
      fade -= 10;
      if (fade <= 0) {
        fade = 0;
      }
    }
  }
}


