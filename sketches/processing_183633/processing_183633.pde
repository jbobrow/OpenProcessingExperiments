
float circle_x= 0;
float circle_z=0;
float circle_q=0;
void setup (){
size(400, 400);
//stroke(#FFBC03);
stroke(#A3F5BF);
 background(#C0E1EA);


fill(#B6FF00);
 }

void draw (){

 
  fill(#DBD1FC);

float circle_size=150;

if(random(10) > 8) {
  circle_size =100; }
ellipse(circle_x, 200, circle_size, circle_size);

circle_x=circle_x + 2;

if(circle_x > 400)
  circle_x=0;
  

ellipse(circle_z,100,50,50);

circle_z=circle_z+4;

if (circle_z >400)
circle_z=0;

  fill (#FF7474);
  
 
  
ellipse(circle_q, 300,250,250);

circle_q=circle_q+0.5;

if (circle_q >400)
circle_q=0;

}
