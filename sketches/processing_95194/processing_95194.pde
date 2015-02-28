
int x = 0; //defines x
int dir = 1; //defines dir
int r = 255; int b = 255;int temp; //defines r                                                                                                                                             

void setup(){ //Void Setup
  size (400, 400); //Size
  background(255); //background color
  stroke(0, 227, 255); //noStroke
}

void draw(){ //Void Draw
  line(0,0, mouseX, mouseY); //position
  line(0, 400, mouseX, mouseY); //position
  line(400, 0, mouseX, mouseY); //position
  line(400, 400, mouseX, mouseY); //position


}


