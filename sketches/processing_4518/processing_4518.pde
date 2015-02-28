
/* ---------------------------------------------------------------------------------------------- ass1.pde
Intent
~~~~~~
This program is for Ass 1 of comp2720 of 2 semester, 2009

Designed By
~~~~~~~~
Kong Fanyu 
Aug, 2009

*/
// ----------------------------------------------------------------------------------------------- initialisation
// Global (i.e. PApplet-wide) constants and variables

float  high;                                                        // the size of the biggest hexagon
float temp_high;                                                    // the size of hexagon of each circle
float max_height_of_height = 5;
final float min_height = 5;
final float high_changing_speed = 3;

float angle = 0;                                                    // an angle to make the hexagons moving in a circle
final float rotation_speed = 0.05;                                  // the speed of each biggest hexagons move

float delta = 0;                                                    // an angle to make the each circle move round
final float circle_speed = 0.05;                                    // the speed of each circle moves

float color_change = 0;                                             // the speed of colour changes
final float color_changing_speed = 0.15;                            // the speed colour changes 

final int circle_num = 5;                                             
final int hexagon_num_per_circle = 6;
final int layer_per_hexagon = 6;
 
final float up_triangle_angle_one = PI/2;                           // to draw the up-triangle of the hexagon
final float up_triangle_angle_two = PI*7/6;
final float up_triangle_angle_three = PI*11/6; 
final float down_triangle_angle_one = PI/6;                         // to draw the up-triangle of the hexagon                     
final float down_triangle_angle_two = PI*5/6;
final float down_triangle_angle_three = PI*3/2;

int flag = 0;                                                       // use to judge whether the hexagons are too big or too small
final float strokeweight = 2;
final color dark_sky = color(41, 36, 50, 70);                        // the colour of background
draw_pic draw_hexagon= new draw_pic();
  
// ---------------------------------------------------------------------------------------------------

void setup() {
  background(0);
  size(screen.width, screen.height) ;
}

// ------------------------------------------------------------------------------------------------ main methods

void draw() {
   fill(dark_sky);
   rect(0, 0, width, height);
   
    angle += rotation_speed;                                           //to make the hexagons moving in a circle                           
    delta += circle_speed;                                             //to make the each circle move round      
    color_change = color_change + color_changing_speed;                // the colour changes all the time
    
   if(high > height/max_height_of_height && flag == 0)                 // if the hexagons are too big, make them smaller
     flag = 1;
   if(high < min_height && flag == 1)                                  // if the hexagons are too small, make them bigger
     flag = 0;
   if(flag == 1)
     high -= high_changing_speed;
   else high += high_changing_speed;

  
  for(int k = 1; k < circle_num+1; k++){                                // draw different circles
     for(int j = 1; j < hexagon_num_per_circle+1; j++){                 // draw different hexagons in the same circle
         temp_high = high/k;
        for(int i = layer_per_hexagon; i > 0; i--){                     // draw different layers in the same hexagon       
         draw_hexagon.Draw(                                             // draw each hexagon 
         width/2 + height/3/k*cos(TWO_PI/hexagon_num_per_circle * j + pow(-1, k)*delta),    // x of hexagon's position
         height/2 + height/3/k*sin(TWO_PI/hexagon_num_per_circle * j + pow(-1, k)*delta),   // y of hexagon's position
         temp_high ,                                                   // the size of each hexagon
         angle,                                                        // the speed of moving round
         i,                                                            // which layer of the hexagon
         color_change                                                  // it changes color in HSB
         );
          temp_high = temp_high/2;                                     //  the hexagon of next layer's  size will be  half of the bigger one
        }
     }
  }
  
}


// ----------------------------------------------------------------------------------- classes
/*
classes referenced
''''''''''''''''''
<class name> - <filename>
*/
// -------------------------------------------------------------------------------------------


