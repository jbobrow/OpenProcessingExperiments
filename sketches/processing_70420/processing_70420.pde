
void setup () {
  size(500,500);

};

void draw(){
  background(0);
  fill(10,250,10);
  ellipse(mouseX, mouseY, 100, 100);
  fill(100,30,40);
  ellipse(mouseX+20, mouseY-100,50,50);
  
  println(mouseX+mouseY);
};




//if the mouse is within a circle
//if the distance from the mouse to a circle is less thans the circle's radius
//if (the distance bw mouse and circle < radius)
ellipse(circle_x,circle_y,circle_radius*2,circle_radius*2);
if ( dist(mouseX,mouseY,circle_x, circle_y) < circle_radius){background(30,100,30);
};
