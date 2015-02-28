
float x,y,angle,radius;

void setup(){
 size (500,500);
 smooth();
 x=0;
 y=0;
 angle=0;
 radius=0;
 
}

void draw(){
 beginShape();
 for(int i=0;i<=370;i+=36){
  x=cos(radians(i))*radius+ width/2;
  y=sin(radians(i))*radius + height/2;
  stroke(242,229,83);
  fill(201,222,112,10);
  vertex(x,y);
  radius+=.2;
  
 }
 for(int i=0;i<=370;i+=60){
  x=cos(radians(i))*radius+ width/2;
  y=sin(radians(i))*radius + height/2;
  stroke(245,155,64);
  fill(222,209,112,20);
  vertex(x,y);
  radius+=.1;
  
 }
 for(int i=0;i<=370;i+=15){
  x=cos(radians(i))*radius+ width/2;
  y=sin(radians(i))*radius + height/2;
  stroke(245,155,64);
  fill(222,187,112,30);
  vertex(x,y);
  radius+=.1;
  
 }
 for(int i=0;i<=370;i+=10){
  x=cos(radians(i))*radius+ width/2;
  y=sin(radians(i))*radius + height/2;
  fill(222,134,112,20);
  strokeWeight(1);
  stroke(242,229,83);
  vertex(x,y);
  radius+=.1;
  
 }
for(int i=0;i<=370;i+=5){
  x=cos(radians(i))*radius+ width/2;
  y=sin(radians(i))*radius + height/2;
  strokeWeight(3);
  stroke(242,229,83);
  fill(222,90,112,20);
  vertex(x,y);
  radius+=.1;
 }
 endShape();
 beginShape();
 for(int i=0;i>=370;i-=100){
  x=cos(radians(i))/radius+ width;
  y=sin(radians(i))/radius+ height;
  stroke(242,229,83);
  fill(242,229,83);
  vertex(x,y);
  radius+=.2;
  }
endShape();
 
}

