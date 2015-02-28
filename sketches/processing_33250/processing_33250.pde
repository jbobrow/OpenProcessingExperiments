
//fill the screen with horizontal lines 10 pixels apart.

int line_distance = 10;
int line_space = 10;


void setup() {
//  frameRate(10);
  noLoop();
  size(200, 200);
}

void draw() {
  
  fill( random(256), random(256), random(256) );

  for (int i = 0; i < 10; i=i+1) {
    for (int j = 0; j < 10; j+=1) {
      ellipse( mouseX + (j * 10), mouseY+ (i * 10), 10, 10);
//      ellipse( mouseX + (j * 10), mouseY+ (i * 10), 10, 10);
//      println("i = " + i + " i * 5 = " + i*5);
    }
  }     



//  for (int i = 0; i < 10; i=i+1) {
//    if ( (i == 5) || (i==3)) {
//      //do nothing
//    } else if (i==4){
//      fill(255, 0, 0);
//      rectMode(CENTER);
//      rect(100 - (i*5), 100, 10, 20);
//    } else { 
//      ellipse( 100 - (i * 5), 100, 10, 20);
//    }
//    println("i = " + i + " i * 5 = " + i*5);
//  } 
  
//  for (line_distance = 10; line_distance < height; line_distance += line_space) {
//      line(0, line_distance, width, line_distance);
//  }
//  if (line_distance < height) {
//    line(0, line_distance, width, line_distance);
//    line_distance = line_distance + line_space; 
//  }
}

