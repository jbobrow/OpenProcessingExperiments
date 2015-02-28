
int circle_x=250;
int circle_y=300;
int circle_radius= 30;
int circlex_speed = 2;
int circley_speed = 5;

int circle2_x=150;
int circle2_y=400;
int circle2_radius= 20;
int circlex2_speed = 4;
int circley2_speed = 6;

int circle3_x=250;
int circle3_y=320;
int circle3_radius= 40;
int circlex3_speed = 1;
int circley3_speed = 2;



void setup() {
size(560, 420);


};

void draw() {
background(255);
noStroke();

//circle1
ellipse(circle_x, circle_y, circle_radius*2,circle_radius*2);
fill(random(255),random(255),200);
circle_x = circle_x + circlex_speed;

//bounce off the side
if((circle_x+circle_radius > width)||(circle_x-circle_radius < 0)){
circlex_speed=circlex_speed*-1;
};

circle_y = circle_y + circley_speed;
if((circle_y+circle_radius > height)||(circle_y-circle_radius < 0)){
circley_speed=circley_speed*-1;
};

//circle2
ellipse(circle2_x, circle2_y, circle2_radius*2,circle2_radius*2);
circle2_x = circle2_x + circlex2_speed;

if((circle2_x+circle2_radius > width)||(circle2_x-circle2_radius < 0)){
circlex2_speed=circlex2_speed*-1;
};

circle2_y = circle2_y + circley2_speed;
if((circle2_y+circle2_radius > height)||(circle2_y-circle2_radius < 0)){
circley2_speed=circley2_speed*-1;
};
fill(200,random(255),random(255));

//circle3
ellipse(circle3_x, circle3_y, circle3_radius*2,circle3_radius*2);
circle3_x = circle3_x + circlex3_speed;

if((circle3_x+circle3_radius > width)||(circle3_x-circle3_radius < 0)){
circlex3_speed=circlex3_speed*-1;
};

circle3_y = circle3_y + circley3_speed;
if((circle3_y+circle3_radius > height)||(circle3_y-circle3_radius < 0)){
circley3_speed=circley3_speed*-1;
};
fill(random(255),200,random(255));


};
