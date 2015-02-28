
int x,y;
int xspeed, yspeed;

void setup(){
size(600,600);
smooth();
noStroke();
background(255);
x = width/2;
y = height/2;
}



void draw(){
  x += xspeed;
  y += yspeed;
  for(int i = 0; i<width; i+= 10){
  for (int j = 0; j<height; j+=10){
    line(75, i++, j, mouseX);
    line(432, 43, i, j++);  
    line(43, j++, i, i++);
    fill(mouseX,i,j);
    
  ellipse(j,i,mouseX,75);
}
}
}

