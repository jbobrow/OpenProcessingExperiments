
class Robot {
  float x = mouseX; //xposition
  float y = mouseY+45; //yposition
  float easing = 0.04; 
  int d = 15; //diameter
  int l = 15; //length

  Robot() {
  }

  void move() {
    int targetX = mouseX; 
    x += (targetX - x) * easing;
    if (mousePressed == true) {
      //antenna
      line(x+190, y+94, x+240, y+50); //longest
      line(x+240, y+50, x+175, y+35); //middle
      line(x+175, y+35, x+199, y-10); //shortest
      float r = random (0, 255);
      float g = random (0, 255);
      float b = random (0, 255);
      fill(r, g, b);
      ellipse(x+195, y-10, d+20, d+20); //tip
      //eyes
      noStroke();
      fill(30); //dark grey
      ellipse(x+145, y+132, d-30, d-30); //right
      ellipse(x+220, y+136, d-18, d-18); //left
      //mouth
      stroke(0);
      fill(0); //black
      quad(x+135, y+160, x+225, y+158, x+227, y+189, x+137, y+186); 
      fill(255); //white
      quad(x+133, y+145, x+225, y+142, x+226, y+159, x+134, y+160); //top
      quad(x+135, y+180, x+227, y+178, x+229, y+209, x+137, y+206); //bottom
      line(x+165, y+145, x+172, y+206); //teeth 1st line
      line(x+203, y+143, x+210, y+209); //teeth 2nd line
      //text
      font = loadFont("Code-Bold-40.vlw");
      textFont(font);
      textSize(40);
      fill(255);
      text(quote, x-110, 230);
    } 
    else {
      //antenna
      line(x+190, y+94, x+210, y+70); //longest
      line(x+210, y+70, x+195, y+60); //middle
      line(x+195, y+60, x+199, y+48); //shortest
      float r = random (0, 255);
      float g = random (0, 255);
      float b = random (0, 255);
      fill(r, g, b);
      ellipse(x+202, y+40, d+5, d+5); //tip
      //eyes
      fill(30); //dark grey
      ellipse(x+145, y+132, d-50, d-50); //right
      ellipse(x+220, y+136, d-28, d-28); //left
      //mouth
      fill(255); //white
      quad(x+135, y+160, x+225, y+158, x+227, y+189, x+137, y+186);
      line(x+170, y+160, x+172, y+187); //teeth 1st line
      line(x+208, y+159, x+210, y+188); //teeth 2nd line
    }
  }
  void display() {
    shape(s, x-300, 25);
    //legs
    fill(200);
    triangle(x+140, y+260, x+160, y+270, x+155, y+320); //left 
    triangle(x+230, y+290, x+255, y+280, x+245, y+340); //right
    //left arm
    fill(200); //light grey
    triangle(x+145, y+187, x+148, y+205, x+100, y+250); //arm
    quad(x+98, y+235, x+120, y+244, x+106, y+264, x+95, y+258); //hand
    //body
    fill(200); //light grey
    quad(x+144, y+187, x+229, y+190, x+240, y+300, x+135, y+275); //main
    fill(80); //dark grey
    quad(x+229, y+189, x+265, y+160, x+280, y+246, x+240, y+300); //side
    float r = random (0, 255);
    float g = random (0, 255);
    float b = random (0, 255);
    fill(r, g, b);
    quad(x+150, y+200, x+205, y+205, x+208, y+275, x+148, y+260); //door
    fill(180); //lighter grey
    ellipse(x+198, y+240, d, d); //door handle
    //robot head
    fill(200); //light grey
    quad(x+100, y+100, x+260, y+90, x+260, y+190, x+110, y+185); //main
    fill(80); //dark grey
    quad(x+260, y+90, x+300, y+120, x+300, y+160, x+260, y+190); //side
    //right arm
    fill(200); //light grey
    triangle(x+240, y+195, x+260, y+190, x+300, y+260); //arm
    quad(x+285, y+255, x+305, y+245, x+305, y+266, x+293, y+275); //hand
  }

  void draw() {
    stroke(0);
    background(100);
    image(img, 0, 0);
    shape(s, x-300, 25);
    rb.display();
    rb.move();
  }
}


