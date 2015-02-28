
//put 7 objects around the mouse equally spaced!! 

int number_of_obj = 10;
int distance = 50;
float angle_increment = TWO_PI/number_of_obj;
float current_angle =0;

void setup() {
  size(600, 540); 
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);
  //distance = int(sin(millis()*.01)*50);
  current_angle+=.2;
  for (int i=0;i<number_of_obj; i+=1) {
    fill(map(angle_increment*i, 0, TWO_PI, 0, 360), 100, 100);
    float offsetX = cos(current_angle+angle_increment*i)*distance; //cos is for the X's
    float offsetY = sin(current_angle+angle_increment*i)*distance; //sin is for the Y's
    ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);

    offsetX = cos(current_angle+angle_increment*i+PI)*distance+20; //cos is for the X's
    offsetY = sin(current_angle+angle_increment*i+PI)*distance+20; //sin is for the Y's
    ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);

   // distance += 20; to move as spirals!! 
  }
}

/*  
 float offsetX = cos(PI*.25)*distance; //cos is for the X's
 float offsetY = sin(PI*.25)*distance; //sin is for the Y's
 ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
 
 offsetX = cos(current_angle)*distance;
 offsetY = sin(current_angle)*distance; 
 ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
 
 offsetX = cos(current_angle + angle_increment)*distance; 
 offsetY = sin(PI*.25)*distance; 
 ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
 
 offsetX = cos(current_angle + 2*angle_increment)*distance;
 offsetY = sin(current_angle + 2*angle_increment)*distance; 
 ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
 
 offsetX = cos(current_angle + 3*angle_increment)*distance;
 offsetY = sin(current_angle + 3*angle_increment)*distance; 
 ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
 
 offsetX = cos(current_angle + 4*angle_increment)*distance;
 offsetY = sin(current_angle + 4*angle_increment)*distance; 
 ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
 
 offsetX = cos(current_angle + 4*angle_increment)*distance;
 offsetY = sin(current_angle + 4*angle_increment)*distance; 
 ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
 
 offsetX = cos(current_angle + 5*angle_increment)*distance;
 offsetY = sin(current_angle + 5*angle_increment)*distance; 
 ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
 
 offsetX = cos(current_angle + 6*angle_increment)*distance;
 offsetY = sin(current_angle + 6*angle_increment)*distance; 
 ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
 */

