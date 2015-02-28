
float diam = 300;
float a = 0;

int i,x,y,w=250;
void setup(){
size(500,500);
}

float a_radius = 100;
float a_angle = 0;
float a_x = cos(a_angle*PI/180)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;
 
float b_radius = 150;
float b_angle = 0;
float b_x = cos(b_angle*PI/180)*b_radius;
float b_y = sin(b_angle*PI/180)*b_radius;
 
float c_radius = 80;
float c_angle = 0;
float c_x = cos(c_angle*PI/180)*c_radius;
float c_y = sin(c_angle*PI/180)*c_radius;

void draw(){
  
   float x = noise(a, 100) * width;
  float y = noise(a, 500) * height;
  float d = dist(x , y, mouseX , mouseY );
  
   if(d > diam){
    strokeWeight(1);
  } else{
    strokeWeight(random(3));
  }
  
  x=mouseX +1; y=mouseY;
  fill(mouseX,mouseY,mouseX/3,mouseY*1);
  noStroke();
  stroke(10);
  translate(w+10,w+5);
  for(i=0;i<y;i++,rotate(y*PI/360),scale(.9))
  ellipse(mouseX+20,mouseY+15,50,50);

  
  a_angle = a_angle + 20;
float a_x = cos(a_angle*PI/80)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;
strokeWeight(7);
stroke(50,100,250);
line(-50+a_x,-90+a_y, 300, 300);

}
  

  



