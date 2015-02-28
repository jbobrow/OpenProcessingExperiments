
float x;
float y;
int colorValue;
int A;
PFont fontA;

void setup() {

  size(600, 600);
  background(224, 225, 150);
  smooth();
  x=0;
  y=0;
  A=50;
}

void draw() {
  noFill();
  stroke(colorValue);
  strokeWeight(0.8);

  if (mousePressed)
  {
    x += 10;
    y += 20;
    ellipse(mouseX, mouseY, x, y);
    fill(130, 213, 214, 50);
    if (mouseX<300 && mouseY < 300) {
      colorValue = color(255);
    }
    if (mouseX<300 && mouseY >300) {
      colorValue = color(255, 191, 69);
    }
    if (mouseX>300 && mouseY <300) {
      colorValue = color(84, 194, 183);
    }
    if (mouseX>300 && mouseY > 300) {
      colorValue = color(228, 172, 207);
    }
  }

  noFill();
  stroke(255);
  strokeWeight(1);
  //first box
  noStroke();
  fill(184, 31, 31);//dark red
  ellipse(385, 470, 30, 50);//back right
  ellipse(300, 530, 30, 50);//front right


  fill(255, 46, 46); //red
  ellipse(400, 470, 30, 50);//back right
  ellipse(315, 530, 30, 50);//front right
  ellipse(115, 530, 30, 50);//front left


  fill(255);//white
  ellipse(400, 470, 15, 30);//back right
  ellipse(315, 530, 15, 30);//front right



  fill(255, 200, 20);//face
  rect(100, 350, 200, 200);
  fill(255, 227, 20); //top
  quad(100, 350, 250, 250, 420, 250, 300, 350);
  fill(255, 170, 20);//side
  quad(300, 350, 420, 250, 420, 450, 300, 550);
  fill(255, 200, 20);
  rect(175, 275, 50, 20);
  rect(275, 275, 50, 20);
  ellipse(300, 295, 50, 20);
  ellipse(200, 295, 50, 20);
  fill(255, 235, 220);//light
  ellipse(200, 275, 50, 20);//small ellipse on top
  ellipse(300, 275, 50, 20);

  fill(117, 76, 36);//brown
  ellipse(130, 420, 50, 35);
  ellipse(270, 420, 50, 35);
  fill(236, 28, 36);
  ellipse(200, 450, 50, 35);
  fill(255, 235, 220);
  ellipse(190, 445, 15, 10);
  noFill();//smile
  strokeWeight(2);
  stroke(117, 76, 36);
  //line(170,480,150,525);
  //line(230,480,250,525);
  bezier(170, 480, 150, 525, 250, 525, 230, 480);
  stroke(255, 145, 20);//side squa
  strokeWeight(3);
  stroke(117, 76, 36);//blue
  fill(45, 121, 240);
  quad(300, 375, 420, 275, 420, 300, 300, 405);
  fill(255, 69, 69);//red
  quad(300, 425, 420, 325, 420, 350, 300, 455);
  fill(48, 167, 106);//green
  quad(300, 475, 420, 375, 420, 400, 300, 500);
}
void mousePressed() {
  fill(colorValue);
  fontA = createFont("Arial", A);
  textFont(fontA, A);
  text("Always Smile", mouseX, mouseY);
  fill(224, 225, 150, 100);
  noStroke();
  rect (0, 0, 600, 600);
}
void mouseReleased() {
  x= 0;
  y= 0;
}


                
                
