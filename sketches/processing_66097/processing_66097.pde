

int center = 250;
float heightDecrease = 1.3;
float widthDecrease = 1.3;
int height = 70;
int width = 50;




void setup() {

  size(500, 500);
  background(0);
  smooth();


  stroke(255);
  strokeWeight(2);
  noFill();
}



void draw () {
  background(0);


  drawShape(center, center, height, width, true);
}


void keyPressed() {
  if (key == 'a') {
    height -= 4;
    println(height);
  }
  if (key == 'q') {
    height += 4;
     println(height);
  }
  if (key == 's') {
    width -= 4;
     println(width);
  }
  if (key == 'w') {
    width += 4;
     println(width);
  }
  if (key == 'd') {
    heightDecrease += 0.1;
    println(heightDecrease);
  }
  if (key == 'e') {
    heightDecrease -= 0.1;
    println(heightDecrease);
  }
  if (key == 'f') {
    widthDecrease += 0.1;
    println(widthDecrease);
  }
  if (key == 'r') {
    widthDecrease -= 0.1;
        println(widthDecrease);

  }
  //saveFrame();
  
}

void drawShape(int x, int y, int height, int width, boolean horizontal) {


  line(x, y-(height/2), x+(width/2), y);
  line(x+(width/2), y, x, y+(height/2));
  line(x, y+(height/2), x-(width/2), y);
  line(x-(width/2), y, x, y-(height/2));


  if (height > 4 && width > 4 && height < 200 && width < 200) {

    if (horizontal) {    
      drawShape(x+(width/2), y, (int)(height*heightDecrease), (int)(width*widthDecrease), false);
      drawShape(x-(width/2), y, (int)(height*heightDecrease), (int)(width*widthDecrease), false);
    }
    else {
      drawShape(x, y-(height/2), (int)(height*heightDecrease), (int)(width*widthDecrease), true);
      drawShape(x, y+(height/2), (int)(height*heightDecrease), (int)(width*widthDecrease), true);
    }
  }
} 


