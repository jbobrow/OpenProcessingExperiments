
//Gina DeMatteo
//September 13,2011
//Loop & Control


void setup() {
  size(400, 300);
  smooth();
}

//Variables
int spacing = 1;
int a;
int g;
int h;
int x;
int y;

float linex;
float liney;


void draw() {
  background(0);

  //Sets up dotted line at bottom of composition
  for (int a=0;a<width;a+=5) { 
    point(a, 285);  

    //Establishes ellipse in bottom corner; ellipse is offsetand bounded by horizontal lines
    for (float g = 0; g < width; g = g+50) {
      for (float h = 0; h < height; h = h+50) { 
        noFill();
        strokeWeight(.03);
        stroke(x, 255, y);
        ellipse(390, 290, h, h);
      }
    }

    //Horizontal lines; form boundary for ellipse & squares are centered between these lines; they serve as the main parameter for the composition
    for (float linex = 65; linex <400; linex +=50) {
      for (float liney = 65; liney <400; liney +=50) {

        stroke(255);
        line(0, liney, 400, liney);
      }
    }


    //Rectangles on left side; enforce the order of composition;establish a balance
    strokeWeight(1);
    for (int x=10;x<100;x+=50) {
      for (int y=30;y<250;y+=50) { 
        fill(0);
        stroke(255);

        rect(x, y, 20, 20); //
      }
    }



    //Lines on top of composition; establish idea of where vertical lines of grid would run
    for (int x = 0; x <= 400; x+=5) {
      stroke(x,255,y);
      line(x, 10, x, 20);
      
    }
  }
}


