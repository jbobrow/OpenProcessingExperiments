
//Homework 4.1.1

void setup(){
  size(300,300);
  background(88);
  smooth();
}

void draw(){
  
  strokeWeight(0);
  noFill();
  
//this controls the diamonds  
for (int x = 0; x<width; x+=60){ 
  stroke(255,197,3);  
  quad(x,height/10,x+30,(height/10)+30,x+60,(height/10),x+30,(height/10)-30);
}

for (int y = 0; y<width; y+=60){ 
  stroke(200); 
  quad(y,height/2,y+30,(height/2)+30,y+60,(height/2),y+30,(height/2)-30);
}

for (int z = 0; z<width; z+=60){ 
  stroke(255,197,3);
  quad(z,height/1.11,z+30,(height/1.11)+30,z+60,(height/1.11),z+30,(height/1.11)-30);
}

//this controls the bounding lines
for (int x=60; x<width-50; x+=60) {
  stroke(120);
  line(x,0,x,width);
  line(0,x,height,x);
}
}

