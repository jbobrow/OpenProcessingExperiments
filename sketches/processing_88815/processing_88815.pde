
// int for rectangles
int x = 50;
int y = 170;
int w = 150;
int h = 150;

//ellipse
int i= 350;
int rw=160;
int rh=160;
int rad;


void setup() {
  size(500, 500);
}    

void draw() {
  background(0);

  float d = dist(mouseX*2, mouseY, x, y);


  //rectangle
  if ((mouseX > x) && (mouseX < x+w) &&
    (mouseY > y) && (mouseY < y+h)) {
    fill(#aeeedb, 50);
  } 
  else {
    fill(255);
  }

  noStroke();
  rect(x, y, w, h);

  ellipse(x+75, d, rw-50, rh-50);
  

//ellipse 
if ((mouseX > i-30) && (mouseX < i+rw) && 
(mouseY > y) && (mouseY < y+rh-10)) {
  fill(#fc054b,50);
} 
else {
  fill(#fc054b);
}


ellipse(i, y+70, rw, rh);

ellipse(i, y+70, rw-50, rh-50);

}



