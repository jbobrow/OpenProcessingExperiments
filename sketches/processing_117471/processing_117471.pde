
//

Eye e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15, e16, e17, e18,e19,e20;

void setup() {
  size(700, 700);
  noStroke();
  e1 = new Eye(280, 320, 40);
  e2 = new Eye(420, 320, 40);  
  e3 = new Eye(600, 290, 50);
  e4 = new Eye(600, 530, 68);
  e5 = new Eye(100, 630, 45);
  e6 = new Eye(400, 570, 30);
  e7 = new Eye(520, 630, 42);
  e8 = new Eye(80, 420, 87);
  e9 = new Eye(200, 160, 36);
  e10 = new Eye(100, 230, 39);
  e11 = new Eye(450, 660, 10);
  e12 = new Eye(600, 420, 30);
  e13 = new Eye(520, 180, 15);
  e14 = new Eye(120, 120, 25);
  e15 = new Eye(70, 300, 15);
  e16 = new Eye(350, 130, 27);
  e17 = new Eye(120, 540, 25);
  e18 = new Eye(280,600, 52);
    e19 = new Eye(650,170, 60);
      e20 = new Eye(440,120, 32);
      

  background(0);
}


void draw() {
  //face
  noStroke();
  ellipseMode(RADIUS);
  fill(255, 238, 216);
  ellipse(350, 350, 150, 180);

  textSize(100);
  fill(250, 10, 0);
  text("I am watching ", 33, 80); 
  textSize(10);
  fill(250, 10, 0);
  text(" you", 350, 680); 
  
  //hair


  //nose1
  ellipseMode(RADIUS);
  noStroke();
  fill(0, 0, 0);
  ellipse(340, 380, 2, 3);


  //nose2
  ellipseMode(RADIUS);
  noStroke();
  fill(67, 51, 50);
  ellipse(360, 380, 2, 3);


  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);
  e4.update(mouseX, mouseY);
  e5.update(mouseX, mouseY);
  e6.update(mouseX, mouseY);
  e7.update(mouseX, mouseY);
  e8.update(mouseX, mouseY);
  e9.update(mouseX, mouseY);
  e10.update(mouseX, mouseY);
  e11.update(mouseX, mouseY);
  e12.update(mouseX, mouseY);
  e13.update(mouseX, mouseY);
  e14.update(mouseX, mouseY);
  e15.update(mouseX, mouseY);
  e16.update(mouseX, mouseY);
  e17.update(mouseX, mouseY);
  e18.update(mouseX, mouseY);
  e19.update(mouseX, mouseY);
  e20.update(mouseX, mouseY);
  e1.display();
  e2.display();
  e3.display();
  e4.display();
  e5.display();
  e6.display();
  e7.display();  
  e8.display();  
  e9.display();
  e10.display();
  e11.display();
  e12.display();
  e13.display();
  e14.display();
  e15.display();
  e16.display();
  e17.display();
  e18.display();
    e19.display();
      e20.display();

  //teeth
  fill(255, 255, 255);
  stroke(0);
  rect(305, 430, 30, 30, 3, 3, 12, 18);

  //teeth1
  fill(255, 255, 255);
  stroke(0);
  rect(335, 430, 30, 30, 3, 3, 12, 12);

  //teeth2
  fill(255, 255, 255);
  stroke(0);
  rect(365, 430, 30, 30, 3, 3, 12, 12);


  //teeth3
  fill(255, 255, 255);
  stroke(0);
  rect(395, 430, 30, 30, 3, 3, 18, 12);

  //teeth4

  fill(255, 255, 255);
  stroke(0);
  rect(305, 460, 30, 30, 18, 12, 3, 3);

  //teeth5

  fill(255, 255, 255);
  stroke(0);
  rect(335, 460, 30, 30, 12, 12, 3, 3);

  //teeth6
  rectMode(CENTER);
  fill(255, 255, 255);
  stroke(0);
  rect(365, 460, 30, 30, 12, 12, 3, 3);


  //teeth7
  rectMode(CENTER);
  fill(255, 255, 255);
  stroke(0);
  rect(395, 460, 30, 30, 12, 18, 3, 3);
}

class Eye {
  int x, y;
  int size;
  float angle = 0.0;

  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
  }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    fill(255, 255, 255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(2, 162, 245);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}



