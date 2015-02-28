
/*

This is the basis for my monster sketch
matt richard 2013 February

*/

void setup(){
  size( 600, 600);
  smooth();
  rectMode(CENTER);
}

void draw(){
  background(0);
  
  //shoulders
  stroke(80, 50, 45, 128);
  strokeWeight(4);
  fill(60, 100, 50);
  rect(280, 500, 500, 700);
  
  //left breast
  fill(60, 100, 50);
  ellipse(width/2 - 120, height - 50, 240, 300);
  
  //right breast
  fill(60, 100, 50);
  ellipse(width/2 + 100, height - 50, 200, 300);
  
  // cover clevage
  fill(60, 100, 50);
  noStroke();
  rect(width/2 - 20, height - 170, 460, 150);
  
  //beard
  fill(225, 170, 140, 128);
  strokeWeight(2);
  stroke(45, 40, 25, 128);
  triangle(width/2 - 145, height/2 - 50, width/2 + 145, height/2 - 50, width/2, height - 40);
  
  //head
  fill(150, 140, 100);
  stroke(15, 14, 10, 128);
  ellipse(width/2, height/2 - 50, 300, 300);
  
  //left eye
  fill(40, 35, 30);
  stroke(10, 90, 100);
  strokeWeight(20);
  ellipse(240, 200, 50, 50);
  
  //right eye
  fill(40, 35, 30);
  stroke(10, 90, 100);
  strokeWeight(20);
  ellipse(360, 200, 50, 50);
  
  //nose
  // style
  fill(165, 155, 115);
  noStroke();
  triangle(width/2, 210, 330, 280, width/2, 280);
  
  //mouth
  fill(60, 35, 30);
  stroke(120, 75, 73, 128);
  strokeWeight(24);
  ellipse(width/2 + 30, 340, 20, 10);
  
  //hair
  
  
  float x_center = width/2;
  float y_center = 120;
  float number_of_hairs = 300;
  float hair_radius_max = 222;
  float hair_radius_min = 50;
  float hair_radius_adjust = (hair_radius_max - hair_radius_min)/(number_of_hairs / 2);
  float hair_radius = hair_radius_max;
  float angle_begin = 40;
  float angle_end = 320;
  float angle_incr = (angle_end - angle_begin)/number_of_hairs;
  
  noFill();
  //stroke(50,128);
  stroke(85, 45, 25, 128);
  
  for(int i = 0; i < number_of_hairs; i++){
  hair_radius -= hair_radius_adjust;
  if( hair_radius <= hair_radius_min ){
      hair_radius_adjust *= -1;
      hair_radius -= hair_radius_adjust;
  }
  
  float angle = angle_begin + ( i * angle_incr);
  float x = (sin( radians( angle ) ) * hair_radius) + x_center;
  float y = (cos( radians( angle ) ) * hair_radius) + y_center;
  line(x_center, y_center, x, y);
  angle += angle_incr;
  }
 
  noFill();
  strokeWeight(12);
  stroke(200, 120, 80, 100);
  //stroke(50, 100);
  
  x_center = width/2;
  y_center = 120;
  number_of_hairs = 100;
  hair_radius_max = 232;
  hair_radius_min = 60;
  hair_radius_adjust = (hair_radius_max - hair_radius_min)/(number_of_hairs / 2);
  hair_radius = hair_radius_max;
  angle_begin = 40;
  angle_end = 320;
  angle_incr = (angle_end - angle_begin)/number_of_hairs;
  
  for(int i = 0; i <= number_of_hairs; i++){
  hair_radius -= hair_radius_adjust;
  if( hair_radius <= hair_radius_min ){
      hair_radius_adjust *= -1;
      hair_radius -= hair_radius_adjust;
  }
  
  float angle = angle_begin + ( i * angle_incr);
  float x = (sin( radians( angle ) ) * hair_radius) + x_center;
  float y = (cos( radians( angle ) ) * hair_radius) + y_center;
  line(x_center, y_center, x, y);
  angle += angle_incr;
  }
}
