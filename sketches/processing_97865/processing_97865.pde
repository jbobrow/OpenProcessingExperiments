
float t =0;
float ty =1;
void setup (){
   background (#F50056);
  smooth();
  size (600,400);
 
}


void draw (){
//background (0);



t = t + 0.01;
ty = ty + 0.011;

float y = noise (ty);
float x = noise (t);

x = map (x,0,1,0,width);
y = map (y,0,1,0,height);
fill (255);

noStroke ();
ellipse ( x,y,2,2);
}
