
Graph myGraph1;
Graph myGraph2;
Graph myGraph3;
Graph myGraph4;
Graph myGraph5;
Graph myGraph6;
Graph myGraph7;
Graph myGraph8;
Graph myGraph9;
Graph myGraph10;
Graph myGraph11;
Graph myGraph12;
Graph myGraph13;
Graph myGraph14;
Graph myGraph15;
Graph myGraph16;







void setup() {
  size(350, 500);


  myGraph1= new Graph(mouseX, mouseY, 1, 2);
  myGraph2= new Graph(mouseX, mouseY, 2, 3);
  myGraph3= new Graph(mouseX, mouseY, 3, 5);
  myGraph4= new Graph(mouseX, mouseY, 4, 2);
  myGraph5= new Graph(mouseX, mouseY, 2, 3);
  myGraph6= new Graph(mouseX, mouseY, 1, 3);
  myGraph7= new Graph(mouseX, mouseY, 0, 4);
  myGraph8= new Graph(mouseX, mouseY, 4, 8);
  myGraph9= new Graph(mouseX, mouseY, 1, 2);
  myGraph10= new Graph(mouseX, mouseY, 6, 3);
  myGraph11= new Graph(mouseX, mouseY, 3, 2);
  myGraph12= new Graph(mouseX, mouseY, 1, 3);
  myGraph13= new Graph(mouseX, mouseY, 7, 3);
  myGraph14= new Graph(mouseX, mouseY, 5, 3);
  myGraph15= new Graph(mouseX, mouseY, 1, 3);
  myGraph16= new Graph(mouseX, mouseY, 4, 1);
}

void draw() {
  background(100);


  fill(200);
  rect(0, 0, 5, height);
  rect(0, 0, width, 5);
  rect(width, 0, -5, height);
  rect(0, height, width, -5);

  for (int i=0; i<width;  i=i+40) {
    for (int y=0; y<height; y=y+6) {

      fill(i, mouseY, random(y));
      ellipse(i+15, y, 5, 5);
    }
  }

  myGraph1.move();
  myGraph1.drawGraph();
  myGraph2.move();
  myGraph2.drawGraph();
  myGraph3.move();
  myGraph3.drawGraph();
  myGraph4.move();
  myGraph4.drawGraph();
  myGraph5.move();
  myGraph5.drawGraph();
  myGraph6.move();
  myGraph6.drawGraph();
  myGraph7.move();
  myGraph7.drawGraph();
  myGraph8.move();
  myGraph8.drawGraph();
  myGraph9.move();
  myGraph9.drawGraph();
  myGraph10.move();
  myGraph10.drawGraph();
  myGraph11.move();
  myGraph11.drawGraph();
  myGraph12.move();
  myGraph12.drawGraph();
  myGraph13.move();
  myGraph13.drawGraph();
  myGraph14.move();
  myGraph14.drawGraph();
  myGraph15.move();
  myGraph15.drawGraph();
  myGraph16.move();
  myGraph16.drawGraph();
}


// adding things here like "sring file" for image
class Graph {
  float x;
  float y;
  float xspeed;
  float yspeed;



  Graph( float temptX, float tempY, float temptxSpeed, float temptySpeed) {
    x=temptX;
    y=tempY;
    xspeed=temptxSpeed;
    yspeed=temptySpeed;
  }


  void move() {
    x+=xspeed;
    y+=yspeed;
    if ((x>= width) || (x<= 0)) {
      xspeed *= -1;
    }
    if ((y>= height) || (y<= 0)) {
      yspeed *= -1;
    }
  }

  void drawGraph() {


    fill(57, 189, 247);

    ellipse(x-30, y+10, 20, 50);
    fill(245, 227, 67, x);
    stroke(255);
    triangle(mouseX, mouseY, x+20, y+10, x+10, y+10);

    fill(0);
    stroke(0);
    rect(x-40, y+5, 20, 1);
    rect(x-40, y+2, 20, 1);
    rect(x-40, y-1, 20, 1);
    fill(90, 193, 194);
    stroke(0);
    triangle(x-38, y+25, x-35, y+5, x-30, y+35);
    triangle(x-30, y+35, x-27, y+5, x-22, y+25);
    rect(x-38, y+25, 15, 1);
    rect(x-40, y+14, 20, 1);
  }
}
                
