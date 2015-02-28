
Snake[] array;
int path = 1;
int snakeBody = 4;
int end = 0;
int biggery = int(random(30));
int biggerx = int(random(30));
void setup() {
  size(500, 500);
smooth();

  frameRate(10);
  
  array = new Snake[1500];
  
  for (int i = 0; i < snakeBody; i++) {
    
    array[i] = new Snake(i, i);
  } 
}

void draw() {
  
  println("click around");

  println("arrow keys as direction");
    println("if stops eating boxes, please refresh");

  fill(255);
  rect(0, 0, 500, 500);
  
  fill(0);
  
  rect(15*biggerx, 15*biggery, 15, 15);
  
  if (end==0) {
    
    for (int i = snakeBody-1; i > 1; i-=1) {
      
      array[i].trackSnake(array[i-1].x, array[i-1].y, i-1);
      
      if (array[i-1].x%(100)==biggerx && array[i-1].y%(100)==biggery) {
        //if snake is in the same position as the apple
        //grow the fsna
        growth();
      }
    }
  }
}



void keyPressed() {
  if (end == 0) {
    
    if (key == CODED) {
     
      if (keyCode == LEFT) {
        
        path = 3;
        
      }
      if (keyCode == RIGHT) {
        
        path = 1;
        
      }
      if (keyCode == UP) {
        
        path = -3;
        
      }
      if (keyCode == DOWN) {
        
        path = -1;
        
      }
      if (keyCode == ' ') {
        fill(255);
      rect(0,0,500,500);        
      }
    }
  }
}


void growth() {

  array[snakeBody] = new Snake(+1, + 1);
  
  snakeBody++;
  
  biggerx = int(random(30));
  
  biggery = int(random(30));
}

 void mousePressed() {


  if(mousePressed==true) {
   
     background(random(255),random(255),random(255));
     size(500,500);


ellipse(250,250,100,100);
fill(random(255),random(255),random(255));


fill(1);
ellipse(235,240,20,23);
ellipse(265,240,20,23);
strokeWeight(2);
beginShape();
curveVertex(230,260);
curveVertex(230,260);
curveVertex(250,285);
curveVertex(270,260);
curveVertex(270,260);
endShape();
fill(random(FFFF00));
beginShape();
curveVertex(247,285);
curveVertex(247,285);
curveVertex(250,270);
curveVertex(253,285);
curveVertex(253,285);
endShape();



  }
 }


class Snake {
  int x;
  int y;

  Snake(int x, int y) {
    x = x;
    y = y;
  }

  void trackSnake(int lastx, int lasty, int last) {
    fill(random(255), random(255), random(255));
    if (x<0) {//if snake goes off left
    x+=30;
    }
    if (y<0) {//if snake goes off top
    y+=30;

      
    }
 
    rect(15*x%(480), 15*y%(480), 15, 15,10);

    if (last != 1) {      x = lastx;
      y = lasty;
    }
    if (last == 1) {
      
      if (path > 0 ) {
        
        if (path == 1 ) { 
          
          x +=1;
        }
        else { 
          x-=1;
        }
      }
      else {
        if (path == -1 ) { 
          
          y +=1;
        }
        else { 
          y-=1;
        }
      }
    }
  }
}



