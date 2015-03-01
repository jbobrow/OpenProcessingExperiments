
// initial position for our circle
float circle_x = 300;
float circle_y = 20;
// how much to move the circle on each frame
float move_x = 2;
float move_y = -4;

void setup() {
    size(580, 440);
  background(#000000);
    stroke(#D60DFF);
  strokeWeight(7);
  noFill();
}
void draw() {
  stroke(10, random(255), 100); // R, G, B
  line(1000, 1000, random(200), random(200) );

  stroke(50, random(255), 100); // R, G, B
  random(200); line(0, 0, random(200), random(200) );
    stroke(100, random(255), 100); // R, G, B
  random(200); line(500, 500, random(200), random(200) );

  background(#000000);
  ellipse(circle_x, circle_y, 100, 100);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;
  
  if(circle_x > width) {
    circle_x = width;
    move_x = -move_x;
    println("too far right");
  }
  if(circle_y > height) {
    circle_y = height;
    move_y = -move_y;
    println("too far bottom");
  }
  if(circle_x < 0) {
    circle_x = 0;
    move_x = -move_x;
    println("too far left");
  }
  if(circle_y < 0) {
    circle_y = 0;
    move_y = -move_y;
    println("too far top");
  }
  
  
String[] nouns = {"hello", "tree", "love", "sky", "excitement", "rectangle"}; 
String[] adjectives = {"happy", "restless", "red", "fear", "elastic", "fire", "movement", "infinite"};

int n = int(random(6)); // random number between 0 and 5
int m = int(random(8));

text(nouns[n], 150, 150);
text(adjectives[m], 150, 140);
  
}




