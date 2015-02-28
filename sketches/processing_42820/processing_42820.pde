
void setup() {
  size(1920, 1080);
  background(0, 0, 0);
}
 
int x = 1;//primary rotation
int y = 90;//rotatation at the radius
 
void draw() {
  noFill();
  
  //white ellipse
  stroke(140, 140, 140, 50);//цвет линии
  pushMatrix();
  translate(width/2, height/2); //установка новых местных координат(центр)
  rotate(radians(x));
  translate(300, 0);//radius
  rotate(radians(y + 90));//rotates the ellipse
  ellipse(0, 0, 350, 450);//grey ellipse
  popMatrix();
  y+=6;//rotation через 6
  x++;//keeps it rotating
  
  //red line
  stroke(255, 0, 0, 70);
  pushMatrix();
  translate(width/2, height/2);//установка новых местных координат(центр)
  rotate(radians(x));
  translate(300, 0);//radius
  rotate(radians(y + 30));//rotates the line
  line(150, 150, 15, 15);//red line
  popMatrix();
  
  //green line
  stroke(0, 255, 0, 70);
  pushMatrix();
  translate(width/7, height/5);//установка новых местных координат(центр)
  rotate(radians(x));
  translate(100, 0);//radius
  rotate(radians(y + 30));//rotates the line
  line(50, 50, 15, 15);//line
  popMatrix();
  
  //green ellipse
  stroke(0, 255, 0, 50);//цвет линии
  pushMatrix();
  translate(width/7, height-200); //установка новых местных координат(центр)
  rotate(radians(x));
  translate(100, 0);//radius
  rotate(radians(y + 90));//rotates the ellipse
  ellipse(0, 0, 100, 150);//ellipse
  popMatrix();
  
  
}                           
