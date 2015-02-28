
float circle_x = 0;
float circle_y = 20;
float move_x = 2;
float move_y = 2;




void setup(){

  size(700,700);
  stroke(400,200);
  strokeWeight(4);
  
}





void draw(){
  background(0,95,0);
  noSmooth();
  ellipse(circle_x, circle_y, 40,40);
  fill(90,0,0);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y; 
  int i =40;
  while (i < 200); {
  rect(i,i,40,40);
  smooth();
  fill(random(0,50), random(0,158), random(0,532));


}



if (circle_x > width){

  circle_x = width;   //up to here it stops when it reaches right

  move_x = -move_x;   //this flips the sign. Ex. from 1 to -1

     println("too far right");

}




if (circle_y > height){

  circle_y = height;

    move_y = -move_y;

     println("too far down");

}




if (circle_x < 0){

  circle_x = 0;

  move_x = -move_x;

  println("too far left");

}




if (circle_y < 0){

  circle_y = 0;

    move_y = -move_y;

        println("too far top");

}




}



