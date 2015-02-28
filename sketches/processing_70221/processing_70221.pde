

int x = 40;
color black = color (0, 0, 0);
color white = color (255, 255, 255);
color pink = color (255, 153, 204);

void setup (){
  size (600, 300);
}

void draw (){
  noStroke ();
  smooth ();
  background (0, 191, 255);
  
  if (mousePressed){
    fill (black);
    rect (0, 0, 600, 300);
}
  
  if (keyPressed && (key == CODED)) {
    if (keyCode == LEFT) {
      x--;
    } else if (keyCode == RIGHT) {
      x++;
    } 
  }
  
  /*tree 1*/
  fill (139, 69, 19);
  rect (x/-1+450, 115, 10, 100);
  
  fill (34, 139, 34);
  triangle (x/-1+475, 150, x/-1+455, 100, x/-1+435, 150);
  triangle (x/-1+475, 175, x/-1+455, 125, x/-1+435, 175);
  triangle (x/-1+475, 200, x/-1+455, 150, x/-1+435, 200);
  
  /*tree 2*/
  fill (139, 69, 19);
  rect (x/-1+475, 115, 10, 100);
  
  fill (0, 128, 0);
  triangle (x/-1+500, 150, x/-1+480, 100, x/-1+460, 150);
  triangle (x/-1+500, 175, x/-1+480, 125, x/-1+460, 175);
  triangle (x/-1+500, 200, x/-1+480, 150, x/-1+460, 200);
  
  /*tree 3*/
  fill (139, 69, 19);
  rect (x/-1+500, 115, 10, 100);
  
  fill (0, 108, 0);
  triangle (x/-1+525, 150, x/-1+505, 100, x/-1+485, 150);
  triangle (x/-1+525, 175, x/-1+505, 125, x/-1+485, 175);
  triangle (x/-1+525, 200, x/-1+505, 150, x/-1+485, 200);
  
  fill (255, 239, 213); 
  rect (0, 215, 600, 75); //sidewalk
  
  fill (100, 100, 100);  
  rect (0, 225, 600, 75); //street
  
  /*Ice Cream Truck*/
  fill (white);
  rect (x, 150, 140, 80);
  rect (x-10, 160, 140, 80);
  fill (white);
  rect (x, 200, 165, 50);
  fill (pink);
  rect (x-10, 210, 175, 3);
  rect (x-10, 215, 165, 25);
  rect (x, 215, 165, 35);
  ellipse (x, 240, 20, 20);
  fill (100, 100, 100);
  ellipse (x+40, 250, 28, 25);
  ellipse (x+140, 250, 28, 25); 
  fill (black);
  ellipse (x+40, 250, 20, 20);
  ellipse (x+140, 250, 20, 20);
  fill (white); 
  ellipse (x+40, 250, 10, 10);
  ellipse (x+140, 250, 10, 10);
  triangle(x+165, 200, x+140, 200, x+100, 175);
  triangle(x+155, 210, x+100, 150, x+145, 150);
  ellipse (x, 160, 20, 20);
  rect (x+15, 165, 90, 30);
  fill (black);
  rect (x+120, 160, 20, 37);
  fill (210, 105, 30);
  triangle (x+53, 200, x+95, 220, x+65, 185);
  fill (139, 69, 19);
  ellipse (x+63, 195, 22, 22);
  fill (255, 99, 71);
  ellipse (x+58, 191, 23, 23);
  fill (144, 238, 144);
  ellipse (x+54, 188, 23, 23);
}

