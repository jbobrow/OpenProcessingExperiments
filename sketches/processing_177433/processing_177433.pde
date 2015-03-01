
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;

//import ixagon.renderer.*;
//import oldp3d.*;


Minim minim;
AudioPlayer chimes;
AudioPlayer station_background;

PImage bg_image;
float bg_image_width, bg_image_height, bg_image_x, bg_image_y;

PShape  bowl_shape;
int scale_factor = 5;
int train_scale_factor = 25;
float y = 100;
float bell_height = 37.5 * scale_factor;
float bell_width=25 * scale_factor;
int bell_ring_cnt = 0;
int sketch_width = 800;
int sketch_height = 600;
float bell_start_x = (sketch_width / 2) - (bell_width / 2);
float bell_start_y = -15;//sketch_height / 100 ;

int total_bogeys = 2;
float engine_stopping_pos_x = train_scale_factor * 2;
float engine_start_x = engine_stopping_pos_x;
float engine_start_y = sketch_height - train_scale_factor;// * 100;
float frame_rate = 3;
int flag_accelerating = 0;
int flag_deccelerating = 0;

int flag_leaving = 0;
int flag_entering = 0;
int flag_stopping = 1;

float train_travel_away_distance = 2 * train_scale_factor;

float x1 = bell_start_x + 2.5 * scale_factor;
float y1 = bell_start_y + 35 * scale_factor;

float x2 = bell_start_x + 5 * scale_factor;
float y2 = bell_start_y + 35 * scale_factor;

float x3 = bell_start_x + 10 * scale_factor;
float y3 = bell_start_y + 15 * scale_factor;

float x4 = bell_start_x + 20 * scale_factor;
float y4 = bell_start_y + 15 * scale_factor;

float x5 = bell_start_x + 25 * scale_factor;
float y5 = bell_start_y + 35 * scale_factor;

float x6 = bell_start_x + 27.5 * scale_factor;
float y6 = bell_start_y + 35 * scale_factor;



// hanger
float x7 = bell_start_x + 15 * scale_factor;
float y7 = bell_start_y;

float x8 = x7;
float y8 = y7 + 7.5 * scale_factor;

float x9 = x7;
float y9 = y8 + 2.5 * scale_factor;

float x10 = x9;
float y10 = y9 + 5 * scale_factor;

float hanger_radius = 2.5 * scale_factor;
float hanger_x1 = bell_start_x + 15 * scale_factor;
float hanger_y1 = bell_start_y + 10 * scale_factor;

float hanger_x2 = hanger_radius * 2;
float hanger_y2 = hanger_radius * 2;

//clapper
float clapper_orig_x = x7;
float clapper_orig_y = y10 + 2.5 * scale_factor;

float clapper_rad = 2.5 * scale_factor;
float clapper_height = 27.5 * scale_factor;


//float x11 = clapper_orig_x - 2.5 * scale_factor;
//float y11 = clapper_orig_y + 27.5 * scale_factor;

float x12 = clapper_orig_x - 2.5 * scale_factor;
float y12 = clapper_orig_y;

float clapper_x1 = x12;
float clapper_y1 = clapper_orig_y;

//float clapper_x2 = clapper_x1 + 

//float x13 = clapper_orig_x + 2.5 * scale_factor;
//float y13 = y12;

//float x14 = x13;
//float y14 = y11;

float clapper_sphere_orig_x = clapper_orig_x;
float clapper_sphere_orig_y = clapper_orig_y + 27.5 * scale_factor;

float clapper_sphere_rad = 10 * scale_factor;

float  gap_between_bogey, train_wheel_rad, x13, y13, x14, y14, x15, y15, 
    x16 , y16 , x17, y17, x18 , y18 , x19, y19, x20, y20, wheel1_x, wheel1_y, wheel2_x, wheel2_y, engine_window_x, engine_window_y,
    engine_width, engine_height, chimney_x, chimney_y, chimney_height, chimney_width, bogey_start_x, bogey_start_y,
    x21, y21, x22, y22, x23, y23, window1_orig_x, window1_orig_y, window2_orig_x, window2_orig_y, bogey_width, bogey_height,
    bogey_door_width, bogey_door_height, bogey_wheel1_orig_x, bogey_wheel1_orig_y, bogey_wheel2_orig_x, bogey_wheel2_orig_y,
    coupling_engine_x, coupling_engine_y, coupling_front_x, coupling_front_y, coupling_back_x, coupling_back_y, coupling_height, coupling_width,
    coupling_arc_height, coupling_arc_width, coupling_arc_orig_x, coupling_arc_orig_y, train_color1_red_val, train_color1_green_val, train_color1_blue_val,
    train_color2_red_val, train_color2_green_val, train_color2_blue_val, bell_color_val;

float engine_window_size = 1 * train_scale_factor;
float bogey_window_size = 1 * train_scale_factor;

int train_numb;// = random(10000);

float bell_color_red_val = 255;
float bell_color_green_val = 140;
float bell_color_blue_val = 0;
//float stroke_opac = random(

float flag_bell_ringing = 0, flag_bell_move_clockwise = 0, flag_bell_move_anticlockwise = 0, bell_idle = 1; 

void value_incre()
{
if(flag_accelerating == 1)  
    frame_rate++;  
if(flag_deccelerating == 1 && frame_rate > 1)
  frame_rate--;
frameRate(frame_rate);
if(flag_leaving == 1)
  engine_start_x--;
if(flag_entering == 1)
  engine_start_x--;
//train
train_wheel_rad = 2 * train_scale_factor;
gap_between_bogey = 1 * train_scale_factor;

//train engine
x13 = engine_start_x;// * train_scale_factor ;
y13 = engine_start_y;// * train_scale_factor ;

x14 = x13;
y14 = y13 - 2 * train_scale_factor ;

x15 = x14+1 * train_scale_factor ;
y15 = y14;

x16 = x15;
y16 = y15 - 2 * train_scale_factor ;

x17 = x16;
y17 = y16 - 1 * train_scale_factor ;

x18 = x17 + 6 * train_scale_factor ;
y18 = y17;

x19 = x18;
y19 = y18 + 1 * train_scale_factor ;

x20 = x19;
y20 = y19 + 4 * train_scale_factor ;

engine_window_x = x15 + 1 * train_scale_factor;
engine_window_y = y15 - 1 * train_scale_factor;

wheel1_x = x20 - 5 * train_scale_factor;
wheel1_y = y20;

wheel2_x = wheel1_x + 3 * train_scale_factor;
wheel2_y = wheel1_y;

engine_width = (x20 - x13);// * train_scale_factor;
engine_height = (y17 - y13);// * train_scale_factor;

chimney_x = x14 + 0.333 * train_scale_factor;
chimney_y = y14;

chimney_height = 1 * train_scale_factor;
chimney_width = 0.333 * train_scale_factor;

//bogey
bogey_start_x = engine_start_x + engine_width + gap_between_bogey;
bogey_start_y = engine_start_y;

x21 = bogey_start_x;
y21 = bogey_start_y;

x22 = x21 + 1 * train_scale_factor;
y22 = y21;

x23 = x21 + 7 * train_scale_factor;
y23 = y21;

window1_orig_x = x21 + 3 * train_scale_factor;
window1_orig_y = y21 - 3 * train_scale_factor;

window2_orig_x = x21 + 5 * train_scale_factor;
window2_orig_y = window1_orig_y;

bogey_width = 9 * train_scale_factor;
bogey_height = 5 * train_scale_factor;

bogey_door_width = 1 * train_scale_factor;
bogey_door_height = 4 * train_scale_factor;

//gey_window_size = 1 * train_scale_factor;

bogey_wheel1_orig_x = x21 + 1.2 * train_scale_factor;
bogey_wheel1_orig_y = y21;

bogey_wheel2_orig_x = x21 + 7.8 * train_scale_factor;
bogey_wheel2_orig_y = bogey_wheel1_orig_y;

//coupling engine backside
coupling_engine_x = x20;
coupling_engine_y = y20 - 1 * train_scale_factor;

//coupling front
coupling_front_x = x21 - gap_between_bogey / 2;
coupling_front_y = coupling_engine_y;

//couplings back
coupling_back_x = coupling_engine_x + gap_between_bogey + bogey_width;
coupling_back_y = coupling_engine_y;

coupling_height = 0.33 * train_scale_factor;
coupling_width = (1 * train_scale_factor) / 2;

coupling_arc_height = 0.66 * train_scale_factor;
coupling_arc_width = 0.33 * train_scale_factor;

coupling_arc_orig_x = x20 + 0.5 * train_scale_factor;
coupling_arc_orig_y = y20 - 1.125 * train_scale_factor;

float train_rear_x = engine_start_x + engine_width + gap_between_bogey + ((total_bogeys * bogey_width) + ((total_bogeys - 1) * gap_between_bogey)) + coupling_width;

if(flag_leaving == 1 && train_rear_x <= -train_travel_away_distance)
{
  flag_leaving = 0;
  flag_entering = 1;
  flag_stopping = 0;
  
  flag_accelerating = 0;
  flag_deccelerating = 1;
  
  //frame_rate = 200;
  
  
  new_train();
  
}
if(flag_entering == 1 && engine_start_x <= engine_stopping_pos_x)
{
   train_stop();
}

if(flag_entering == 1 && engine_start_x == sketch_width - 50)
{
   new_train_children_cheer();
}

  
//bell_color_effect();
//println(train_rear_x);
//println(train_travel_away_distance);
//println(engine_start_x);
//println(window2_orig_x);

}

void new_train_children_cheer()
{
  station_background.loop(0);
}
void bell_color_effect()
{
  //if(chimes != NULL)
    if(!chimes.isPlaying())
    {
      bell_color_red_val = 255;
      bell_color_green_val = 140;
      bell_color_blue_val = 0;
    }
    else
    {
      bell_color_red_val = random(255);
      bell_color_green_val = random(255);
      bell_color_blue_val = random(255);
    }
      //fill(bell_color_red_val, bell_color_green_val, bell_color_blue_val); 
}

void new_train()
{
  engine_start_x = sketch_width + train_travel_away_distance;
  //set_train_color();
  train_numb = (int) random(10000);
  //train_numb = train_numb + 100;
  frame_rate = frame_rate * 1.1;
  frameRate(frame_rate);
}

void train_start()
{
   
   flag_stopping = 0;
   flag_leaving = 1;
   flag_entering = 0;
   flag_accelerating = 1;
   flag_deccelerating = 0;
   //frame_rate = 0;
   loop();
   
   station_background.loop(0);
}

void train_stop()
{
  flag_stopping = 1;
   flag_leaving = 0;
   flag_entering = 0;
   flag_accelerating = 0;
   flag_deccelerating = 0;
   
   bell_ring_cnt = 0;
   //frame_rate = 0;
   //noLoop();
   
   station_background.loop(0);
}



//float _bogeys = bogey_width + 1 * train_scale_factor;

void setup() {
  size(sketch_width, sketch_height);
  
  train_numb = (int) random(10000);
  
  bg_image = loadImage("children_bg.jpg");
  bg_image_width = bg_image.width;
  bg_image_height = bg_image.height;
  
  bg_image_x = (sketch_width - bg_image_width) / 2;
  bg_image_y = (sketch_height - bg_image_height) / 2;
  
  engine_start_y = bg_image_y + bg_image_height - train_wheel_rad * train_scale_factor - train_scale_factor;
  
  stroke(255);
  strokeWeight(2);
  
  frameRate(frame_rate);
  
  //bell_color_val = random(255);
  //set_train_color();
  //
  
  //bowl_shape = createShape();
  //bowl_shape.beginShape();
  //bowl_shape.fill(204,102,0);
  //bowl_shape.vertex(x1,y1);
  //bowl_shape.vertex(x2,y2);
  //bowl_shape.vertex(x3,y3);
  //bowl_shape.vertex(x4,y4);
  //bowl_shape.vertex(x5,y5);
  //bowl_shape.vertex(x6,y6);
  //bowl_shape.endShape();
  
  minim = new Minim(this);
  chimes = minim.loadFile("my_sounds_bell.wav");
  station_background = minim.loadFile("KidsCheering.wav");
  
  
  // the indefinete looping is not working, hence made it loop 1000 times...
  
  //station_background.play();
  
  //noLoop();
}

void draw() {
  
  background(0);
  image(bg_image,bg_image_x,bg_image_y);
  
  bell_color_effect();
  fill(bell_color_red_val, bell_color_green_val, bell_color_blue_val);
  
  
  //clapper
  rect(x12,y12,clapper_rad*2,clapper_height);
  arc(clapper_sphere_orig_x, clapper_sphere_orig_y, clapper_sphere_rad, clapper_sphere_rad, -PI/3, PI + PI / 3);

  //bowl
  quad(x2, y2, x3, y3, x4, y4, x5, y5);
  
  
  //hanger
  noFill();
  line(x7,y7,x8,y8);
  line(x9,y9,x10,y10);
  arc(hanger_x1, hanger_y1, hanger_x2, hanger_y2, -HALF_PI, PI);
  
  
 
  if(flag_stopping != 1);
    value_incre();
    //translate(1,0);
  
  //engine
  
  randomSeed(train_numb + 50);
  stroke(255,0);
  fill(random(0,255),random(0,255),random(0,255),200);
  rect(x14,y14,7 * train_scale_factor,2 * train_scale_factor);
  rect(x16,y16,6 * train_scale_factor, 2 * train_scale_factor);
  stroke(255);

  line(x13,y13,x14,y14);
  line(x14,y14,x15,y15);
  line(x15,y15,x17,y17);
  line(x17,y17,x18,y18);
  line(x18,y18,x20,y20);
  line(x20,y20,x13,y13);
  
  //fill(204, 102, 0);
  //noFill();
  
  
  //100 for IDing engine
  randomSeed(train_numb + 100);
  fill(random(0,255), random(0,255), random(0,255));
  quad(x16, y16, x17, y17, x18, y18, x19, y19);
  rect(engine_window_x, engine_window_y, engine_window_size * 3, engine_window_size);
  rect(chimney_x,chimney_y, chimney_width,-chimney_height);
  arc(wheel1_x, wheel1_y, train_wheel_rad, train_wheel_rad, 0, 2*PI);
  arc(wheel2_x, wheel2_y, train_wheel_rad, train_wheel_rad, 0, 2*PI);
  
  //coupling
  noFill();
  rect(coupling_engine_x, coupling_engine_y, coupling_width, -coupling_height);
  fill(random(255), random(255), random(255));
  arc(coupling_arc_orig_x, coupling_arc_orig_y, coupling_arc_width, coupling_arc_height, 0, 2*PI);
  
  //loop to draw 4 bogies bogeies
 
  int bogey_numb = 1 ;
  
  while(bogey_numb <= total_bogeys)
  {
  //noFill();
  //200 for IDying bogey from engine
  float offset_val = (bogey_numb - 1) * (gap_between_bogey + bogey_width); 
  
  randomSeed(bogey_numb + train_numb + 150);
  fill(random(0,255), random(0, 255), random(0,255),200);
  rect(x21 + offset_val, y21,bogey_width,-bogey_height);
  
  randomSeed(bogey_numb + train_numb + 200);
  fill(random(0,255), random(0,255), random(0,255));
  rect(x22 + offset_val,y22,bogey_door_width,-bogey_door_height);
  rect(x23 + offset_val,y23,bogey_door_width,-bogey_door_height);
  rect(window1_orig_x + offset_val,window1_orig_y,bogey_window_size,-bogey_window_size);
  rect(window2_orig_x + offset_val,window2_orig_y,bogey_window_size,-bogey_window_size);
  
  arc(bogey_wheel1_orig_x + offset_val, bogey_wheel1_orig_y, train_wheel_rad, train_wheel_rad, 0, 2*PI);
  arc(bogey_wheel2_orig_x + offset_val, bogey_wheel2_orig_y, train_wheel_rad, train_wheel_rad, 0, 2*PI);
  
  //coupling front
  noFill();
  rect(coupling_front_x + offset_val, coupling_front_y, coupling_width, -coupling_height);
  
  //coupling back
  rect(coupling_back_x + offset_val, coupling_back_y, coupling_width, -coupling_height);
  randomSeed(bogey_numb + train_numb + 200);
  fill(random(0,255), random(0,255), random(0,255));
  arc(coupling_arc_orig_x + offset_val, coupling_arc_orig_y, coupling_arc_width, coupling_arc_height, 0, 2*PI);
  bogey_numb++;
  }
  
 // println(engine_start_x);
  //frameRate(frame_rate);
  
}

void keyPressed()
{
   //println(key);
   if(key == 'b' || key =='B')
   {
     chimes.play(0);
     bell_ring_cnt++;
     
     if(bell_ring_cnt >= 3 && flag_stopping == 1)
       train_start();
   }
   else if(key == 's' || key =='S')
   {
     if(chimes.isPlaying())
       chimes.pause();
   }
}



