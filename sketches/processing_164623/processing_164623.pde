

float angle;// function
float jitter; //funtion of square

void setup() {
  size(600, 600); //this line will tell how big the box will be
}

void draw() {
  if (key == 'q' || key == 'Q') {
    group();
  }

  if (key == 'w' || key == 'W') {
    groupTwo();
  }

  if (key == 'e' || key == 'E') {
    groupThree();
  }
}

void group() {
    if (mousePressed) { //this is where the mouse is told to be pressed
    fill(10,30,90);//when you press down on the mouse the square will be a different color
  } else {//im not sure
    fill(134,56,300); //the color of the square
  }
  ellipse(mouseX, mouseY, 80, 80); //this is the placement of the square and that it will follow the mouse while the size is 80x80
}

void groupTwo(){
    fill(3,33,1);//changes color of circle
  background(123,34,232); //changes background
  rectMode(CENTER);//centers object
  translate(width/2,height/2); //not sure
  rotate(mouseX, mouseY,80,80); //not working
  line(-50,0,50,0);//placement of line
  ellipse(50,0,8,8);//placement of circle
  ellipse(-50,0,8,8);//placement of circle
}
void groupThree(){
    background(51,34,222);//backgroundcolor

  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 10 == 0) {  //when it rotates
    jitter = random(-0.4, 0.4); //randomly rotating
  }
   angle = angle + jitter;//movement of square
  float c = cos(angle);//where the square rests
  translate(width/2, height/2);//angle at where it rests
  rotate(c);// command so it rotates
  rect(0, 0, 180, 180);   //size of square
  
  println(second() % 10);
}





