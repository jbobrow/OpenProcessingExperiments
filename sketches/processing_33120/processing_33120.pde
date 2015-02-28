
int distance_frompoint = 50;
int num_of_circles = 10;
int circle_size= 20;

float degree_step= TWO_PI/num_of_circles;
float angle= 0;
int starting_degree_step = 3;
color r= color(250,0,0);
color b= color(0,0,250);
color j= color(0,250,0);
color a= color(255,10,252);
color h= color(10,122,255);
color c= color(65,196,70);
color d= color(171,237,144);
color e= color(182,144,237);
color f= color(255,133,3);
color g= color(3,228,255);
color[] colors = {            //random selects one of above colors
      a,b,c,d,e,f,g,h,r,j
                     };
int distance_frompoint_change= 2;


void setup() {
  size (400,400);
  frameRate(4);
  noStroke();
}

void draw() {

  if (distance_frompoint > width/2){
    distance_frompoint= int(random(50));
  }
  angle= radians(starting_degree_step);

 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
 angle+= degree_step;
 fill(colors[int(random(10))]);
 distance_frompoint+=distance_frompoint_change;
 
 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
  angle+= degree_step;
  distance_frompoint+= distance_frompoint_change;
  
 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
  angle+= degree_step;
  distance_frompoint+= distance_frompoint_change;
  
 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
  angle+= degree_step;
 
 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
 
 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
   angle+= degree_step;

 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
  angle+= degree_step;

 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
  angle+= degree_step;
  
 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
  angle+= degree_step;
 
 ellipse(width/2 + cos(angle)* distance_frompoint, height/2 + sin(angle)* distance_frompoint, circle_size, circle_size);
 starting_degree_step+= 7; 
}

 

