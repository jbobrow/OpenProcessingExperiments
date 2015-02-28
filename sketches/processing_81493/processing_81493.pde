
 int x=250;
  int y=250;
void setup(){
  size(500,500);
  background(5,5,5);
  
}
void bear(){
fill(175, 121, 2);
strokeWeight(4);
stroke(118, 63, 2);
ellipse(x-70, y-65, 120, 120);

fill(175, 121, 2);
strokeWeight(4);
stroke(118, 63, 2);
ellipse(x+170, y-65, 120, 120);
//inside ears
fill(203, 169, 43);
stroke(118, 63, 2, 100);
ellipse(x-65, y-60, 90, 90);

fill(203, 169, 43);
stroke(118, 63, 2, 100);
ellipse(x+175, y-60, 90, 90);

fill(175, 121, 2);
strokeWeight(4);
stroke(118, 63, 2);
ellipse(x+50, y+50, 250, 250);

fill(255, 255, 255);
stroke(255, 255, 255);
ellipse(x, y+10, 60, 60);

fill(255, 255, 255);
stroke(255, 255, 255);
ellipse(x+100,y +10, 60, 60);

fill(0);
stroke(255, 255, 255);
ellipse(x, y+10, 40, 50);

fill(0);
stroke(255, 255, 255);
ellipse(x+100, y+10, 40, 50);

fill(255, 255, 255);
stroke(255, 255, 255);
ellipse(x+5, y, 15, 15);

fill(255, 255, 255);
stroke(255, 255, 255);
ellipse(x+105, y, 15, 15);

fill(229, 161, 32);
strokeWeight(4);
stroke(118, 63, 2);
ellipse(x+50, y+100, 120, 120);

fill(118, 63, 2);
stroke(118, 63, 2);
triangle(x+50, y+110, x+15, y+70, x+85, y+70);

noFill();
arc(x+80, y+110, 60, 60, HALF_PI, PI);

noFill();
arc(x+20, y+110, 60, 60, 0, HALF_PI);
}
void draw(){
  background(5,5,5,5);
  bear();
  if (mousePressed==true){
  x=x+int(random(-9,8));
  y=y+int(random(-9,8));
  }
}


