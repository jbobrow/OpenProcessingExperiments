
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

void setup() {  
  size(250, 250);
}

void draw(){
ellipse(x,y,20,20);


if (mousePressed){
fill(0,255,0);
}
else{
fill(255,0,0);
}

if (keyPressed){
fill(0,0,255);

if(key == 'd'){
fill(255,255,0);
dx = 1;
dy = 0;
}
else if (key == 'a'){
dx = -1;
dy = 0;
}

else if (key == 'w'){
dy = -1;
dx = 0;
}

else if (key == 's'){
dy = 1;
dx = 0;
}
else {
dx = 0;
dy = 0;
}

}
 y = y + dy;
 x = x + dx;
 
}
