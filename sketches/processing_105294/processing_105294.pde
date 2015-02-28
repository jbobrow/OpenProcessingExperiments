
int bg = 0;
int bg2 = 255;


void setup(){
size(400, 400);
}



void draw(){
  fill(bg2);
  rect(200, 200, 200, 200); // lower right big
  fill(bg);
  rect(200, 200, 100, 100); // lower right small
  fill(bg2);
  rect(0, 0, 200, 200); //top left big
  fill(bg);
  rect(100, 100, 100, 100);// top left small
  fill(bg);
  rect(200, 0, 200, 200); // right right big
  fill(bg2);
  rect(200, 100, 100, 100);//top rgiht small
  fill(bg);
  rect(0, 200, 200, 200);
  fill(bg2);
  rect(100, 200, 100, 100);
/* if (bg == 0 & bg2 == 255) {
  bg = 255;
  bg2 = 0;
}
  else {
  bg = 0;
  bg2 = 255;
} */

/* if (mouseX > 100 & mouseX < 300 & mouseY > 100 & mouseY < 300) {
  bg = 255;
  bg2 = 0;
}
  else {
  bg = 0;
  bg2 = 255;
} */

 if (mouseX > 0 & mouseX < 200 & mouseY > 0 & mouseY < 200 || mouseX > 200 & mouseX <400 & mouseY >200 & mouseY <400) {
  bg = 255;
  bg2 = 0;
}
  else {
  bg = 0;
  bg2 = 255;
} 
}


