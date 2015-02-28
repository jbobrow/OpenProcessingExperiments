
float y=50.0;
float speed = 20;
float radius = 10.0;
int direction=1;

void setup(){

    size (250, 250);

for(int y=20; y<=280; y+=5){
  for(int x=20; x<=280; x+=5){
    strokeWeight (2);
    point (x-20, y-20);
  }
}

for(int y=20; y<=280; y+=2){
  for(int x=20; x<=280; x+=2){
    strokeWeight (1);
    point (x-20, y-20);
    //repetitive points to create a rough patter
  }}
  
  
smooth();
noStroke();
ellipseMode(RADIUS);
}

void draw(){
y+=speed*direction;
fill (245,241,124,60);
ellipse(random(2,245),random (2,245),radius, radius);
fill (247,172,216,60);
ellipse(random(2,245),random (2,245),radius, radius);
fill (98,193,125,60);
ellipse(random(2,245),random (2,245),radius, radius);
fill (67,93,255,50);
ellipse(random(2,245),random (2,245),radius, radius);
fill (255,28,28,40);
ellipse(random(2,245),random (2,245),radius, radius);
//circles to move randomly to create a soft patter

if((y>height-radius) ||(y<radius)) {
direction = -direction;
}
}



  
  

