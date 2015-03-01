
boolean blink;

void setup() {
  size(500, 500);
}


void draw() {
  background(125);
  int x = width/2;
  int y = height/2;

  int s = second();

  if (s%3 == 0) {
    blink = true;
  } else {
    blink = false ;
  }


  noStroke();
  fill(255, 255, 0);
  ellipse(x, y, 130, 120);
  rectMode(CENTER);
  rect(x, y+50, 100, 100);
  rect(x, y+35, 150, 20);
  ellipse(x+40, y-50, 30, 150);
  ellipse(x-40, y-50, 30, 150);
  ellipse(x, y+50, 120, 120);

  fill(0);
  if ( blink == false) {
    ellipse(x-30, y-10, 10, 10);
    ellipse(x+30, y-10, 10, 10);
  } else {
    rect(x-30, y-10, 10, 2);
    rect(x+30, y-10, 10, 2);
  }

  triangle(x, y+5, x-5, y, x+5, y);
  ellipse(x+40, y-110, 20, 30);
  ellipse(x-40, y-110, 20, 30);

  fill(255, 0, 0);
  ellipse(x-50, y, 20, 20);
  ellipse(x+50, y, 20, 20);

  fill(127, 0, 0);
  triangle(x-60, y+50, x-60, y+60, x-30, y+55);
  triangle(x-57, y+70, x-53, y+80, x-30, y+65);
  triangle(x+60, y+50, x+60, y+60, x+30, y+55);
  triangle(x+57, y+70, x+53, y+80, x+30, y+65);
  if (keyPressed) {
    if(key == 's'){
        fill(255);
        ellipse(x+130, y-50, 120, 100);
        triangle(x+70, y-10, x+110, y-50, x+140, y-10);
        fill(0);
        textSize(32);
        text("Pika!", x+80, y-50);
      }
  }
  if(keyPressed){
  if(key == 'a'){
  
        stroke(255,255,0);
        strokeWeight(10);
       fill(255,255,0,100);
        ellipse(x,y,300,300);
        
        noStroke();
        fill(255);
        ellipse(x+130, y-50, 120, 100);
        triangle(x+70, y-10, x+110, y-50, x+140, y-10);
        fill(0);
        textSize(32);
        text("CHUU!", x+80, y-50);
  }
  }
}



