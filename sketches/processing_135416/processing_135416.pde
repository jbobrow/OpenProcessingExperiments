
int width = 1;
int height = 1;
 
void setup(){
size(400, 400);
}
 
void draw(){
 
width = width + 1;
height = height +1;

ellipse(width/2, height/2, width/2, height/2);
line(width*0.5, 0, width*0.5, height);
line(0, height*0.5, width, height*0.5);


 
}



