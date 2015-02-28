
//inspired by
//http://www.openprocessing.org/visuals/?visualID=31190
//http://www.openprocessing.org/visuals/?visualID=31092


int rValueOne = 0;
int rValueTwo = 255;

int gValueOne = 0;
int gValueTwo = 255;

int bValueOne = 0;
int bValueTwo = 255;

int aValueOne = 255;
int aValueTwo = 255;

float d = 0;
float c = 0;
int lastX = 200;
int lastY = 200;



void setup() {
  size(500, 500);
  background(0);
  smooth();
}

void draw()
{
}

//keycode call
void keyPressed() {

  //top raw
  if (key == 'q') {
    noStroke();
    println("q");
    rValueOne = 0;
    rValueTwo = 10;

    gValueOne = 100;
    gValueTwo = 255;

    bValueOne = 0;
    bValueTwo = 10;

    fill(255, 0, 255, random(10, 30));  
    ellipse(mouseX, mouseY, 100, 100);
  }
  else if (key == 'w') {
    println("w");
    rValueOne = 100;
    rValueTwo = 255;

    gValueOne = 0;
    gValueTwo = 10;

    bValueOne = 0;
    bValueTwo = 10;

    fill(0, 0, 255, random(10, 30));  
    ellipse(mouseX, mouseY, 100, 100);
  }

  else if (key == 'e') {
    println("e");
    rValueOne = 0;
    rValueTwo = 10;

    gValueOne = 0;
    gValueTwo = 10;

    bValueOne = 100;
    bValueTwo = 255;

    fill(255, 0, 0, random(10, 30));  
    ellipse(mouseX, mouseY, 100, 100);
  }


  else if (key == 'r') {

    rValueOne = 200;
    rValueTwo = 255;

    gValueOne = 200;
    gValueTwo = 255;

    bValueOne = 0;
    bValueTwo = 10;

    fill(0, 255, 255, random(10, 30));  
    ellipse(mouseX, mouseY, 100, 100);
  }

  else if (key == 'a') {
    println("a");
    strokeWeight(1);
    for (int i =0;i<1000;i+=50) {
      for (int j=0;j<800;j+=30) {
        for (int k=100;k<850;k+=150) {

          stroke(mouseX, mouseY+ i*.25, 10, 10);
          line(mouseX, mouseY, k, j);
        }
      }
    }
  }

  else if (key == 's') {
    println("s");
    d = dist(width/2, height/2, mouseX, mouseY);
    c = map(d, 0, width/2, 0, 255);
    strokeWeight(random(10));
    stroke(random(0, 255), random(0, 255), random(0.255));
    noFill();
    //line(width/2,height/2,mouseX,mouseY);
    triangle(pmouseX, pmouseY, mouseX, mouseY, lastX, lastY);
    lastX = mouseX;
    lastY = mouseY;
  }


  // third raw
  else if (key == 'z') {
    println("z");
    stroke(0, 255, 0, random(100));
    line(mouseX, mouseY, mouseX+80, mouseY);  
    line(mouseX, mouseY+40, mouseX+80, mouseY+40);      
    line(mouseX+15, mouseY-20, mouseX+15, mouseY+60);   
    line(mouseX+60, mouseY-20, mouseX+60, mouseY+60);
  }

  else if (key == 'x') {
    println("x");
    stroke(0, 255, 255, random(100));
    noFill();
    ellipse(mouseX, mouseY, 50, 50);
  }
  else if (key == 'c') {
    println("c");
    stroke(0, 0, 255, random(100));
    noFill();
    triangle(mouseX, mouseY, mouseX+60, mouseY-60, mouseX+120, mouseY);
  }


  //change backgrounds
  else if (key == 'v') {
    println("v");
    background(0);
  } 
  else if (key == 'b') {
    println("b");
    background(255);
  } 
  else if (key == 'n') {
    println("n");
    background(230);
  } 
  else if (key == 'm') {
    println("m");
    background(245, 245, 220);
  }
}

void mouseDragged() {

  drawLines();
}

void drawLines () {

  noStroke();
  fill(random(rValueOne, rValueTwo), random(gValueOne, gValueTwo), random(bValueOne, bValueTwo), random(0, 30) );
  ellipse(mouseX, mouseY, 50, 50);
}




