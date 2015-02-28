
Graph [] graphs =new Graph [50];



void setup() {
  size(350, 500);

  for (int i=0; i< graphs.length; i++ ) {
    graphs[i]= new Graph(mouseX, mouseY, i/30.0, i/20.0);
  }
}

void draw() {
  background(230);

  fill(0);
  rect(0, 0, 5, height);
  rect(0, 0, width, 5);
  rect(width, 0, -5, height);
  rect(0, height, width, -5);

  


    for (int i=0; i< graphs.length ; i++) {
      graphs[i].move();
      graphs[i].drawGraph();
    }
  }





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
      fill(100);
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


                
                                
