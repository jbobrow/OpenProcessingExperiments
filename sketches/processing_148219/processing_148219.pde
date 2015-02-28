
float x,y; 
float x_velocity, y_velocity; 
float gravity; 
float radius; 
void setup() 
{ 
size(200,300); 
x = 20; 
y = 10; 
x_velocity = 7; 
y_velocity = 7; 
gravity = .6; 
radius = 7; 
} 
void draw() 
{ 
background(500); 
y_velocity += gravity; 
x += x_velocity ; 
y += y_velocity ; 
if ( y>(height-radius)) 
{ 
y = height-radius; 
y_velocity *= -0.6; 
} 
if ( x<radius ) 
{ 
x = radius; 
x_velocity *= -0.4; 
} 
if ( x>(width-radius) ) 
{ 
x = width-radius; 
x_velocity *= -0.4; 
} 
ball(x, y); 
} 
void ball(float x,float y) 
{ 
pushMatrix(); 
translate(x,y); 
ellipseMode(RADIUS); 
ellipse(0, 0, radius, radius); 
popMatrix(); 
} 



