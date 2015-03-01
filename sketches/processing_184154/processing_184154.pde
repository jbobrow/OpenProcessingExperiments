
/**
 * Assignment #1 (part 1 of 3) : Bezier Curves Exploration <br>
 * 2D Properties<br><br>
 *
 * Michelle Phung<br>
 * Feb 4, 2015<br><br>
 *
 * Introduction to Interactive Data Visualization<br>
 * New York University
 */

color black  = #000000,
      white = #ffffff,
      red = #ED2B2B,
      orange = #FF9217,
      yellow = #F2E060,
      green = #32B51D,
      blue = #586CBB,
      purple = #78379E, 
      pink = #C76BD2;


int start_pt_x = 70,  //coordinate for first anchor point x
    start_pt_y = 250,  //coordinate for first anchor point y

    start_control_x = start_pt_x -170 ,  //coordinate for first control point x
    start_control_y = start_pt_y -180 ,  //coordinate for first control point y

    end_pt_x = 320,  //coordinate for second anchor point y
    end_pt_y = 200,  //coordinate for second anchor point y
    
    end_control_x = end_pt_x +160,  //coordinate for second control point x
    end_control_y = end_pt_y +200;  //coordinate for second control point y  


void setup(){
  size(500, 500);
  noFill();
  strokeWeight(2);

  
  stroke(red);
  b(10);
  stroke(orange);
  b(20);
  stroke(yellow);
  b(30);
  stroke(green);
  b(40);
  stroke(blue);
  b(50);
  stroke(purple);
  b(60);
  stroke(pink);
  b(70);
  stroke(white);
  b(80);  
  line(end_pt_x+80, end_pt_y+80, 330,210);


}

void b (int delta) {
  bezier(  start_pt_x+delta, start_pt_y+delta, 
           start_control_x+delta, start_control_y+delta, //stays relative
           end_control_x+delta, end_control_y+delta, //stays relative
           end_pt_x+delta, end_pt_y+delta
  );
}





