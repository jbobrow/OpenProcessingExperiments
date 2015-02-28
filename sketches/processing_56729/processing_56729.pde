
int x = 250;
int y = 300;
int w = 100;
int h = 100;


PImage img; //image

void setup() {
  size(500, 600);
  img= loadImage("Snowing_background_by_Computerinkt.jpg");
}

void draw() {
  
  image(img, 0, 0); //image




  if (keyPressed && (key == CODED)) { 
    if (keyCode == LEFT) {
      x -- ;
    }
    else if (keyCode == RIGHT) {
      x++;
    }
  }



  //head

  fill(196, 111, 0);
  ellipse(x, y, w, h);
  fill(124, 72, 5);
  


  //ear
  fill(124, 72, 5);
  ellipse(x + 50, y - 50, w-60, h-60);
  ellipse(x - 50, y- 50, w - 60, h - 60);



  //mouth
  fill(224, 98, 14);
  ellipse(x, y + 35, w - 88, h - 80);

  //body
  fill(196, 111, 0);
  rect(x - 50, y + 50, w, h + 30);

  //hands
  fill(229, 59, 16);
  ellipse(x + 120, y + 75, w- 80, h - 90);
  ellipse(x - 120, y + 75, w- 80, h- 90);


  //arms
  fill(124, 72, 5);
  rect(x + 50, y + 70, w - 30, h - 90);
  rect(x - 120, y + 70, w - 30, h - 90);


  //feet
  fill(229, 59, 16);
  ellipse(x + 30, y + 220, w - 80, h - 70);
  ellipse(x - 30, y + 220, w - 80, h - 70);

  //legs
  fill(124, 72, 5);
  rect(x + 20, y + 180, w - 80, h - 60);
  rect(x - 40, y + 180, w - 80, h - 60);



//eye
if (mousePressed){
line(x-20,y,x-10,y);
line(x+20,y,x+10,y);
}else{
 
  //eyes
  fill(0); 
  ellipse(x - 20, y, w- 85, h- 85);
  ellipse(x + 20, y, w- 85, h- 85 ); 
  
}
  //belly

  if ((mouseX > x) && (mouseX < x+w) &&
    (mouseX > y) && (mouseY < y+h)) {
    fill(124, 72, 5);
  } 
  else {
    fill (234, 156, 207);
  }

  ellipse(x, y + 120, w- 30, h);
}




