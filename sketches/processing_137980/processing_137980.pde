
boolean up=false;
boolean down=false;
boolean lefth=false;
boolean right=false;

float x,y;

void setup(){
    size(500,500);
    background(0);
    x=width/2;
    y=height/2;
}

void draw(){

  ellipse(x,y,80,80);
  fill(random(2*y),random(75*x),random(x+y),5);
  stroke(random(y),random(x),random(x+y),5);
  strokeWeight(0);
    
  if(up) y--;
  if(down) y++;
  if(right) x++;
  if(lefth) x--; 
}
void keyPressed(){
 if(key==CODED){
  if(keyCode==UP) up =true;
  if(keyCode==DOWN) down =true;
  if(keyCode==RIGHT) right =true;
  if(keyCode==LEFT) lefth= true;
}
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) up = false; 
    if (keyCode == DOWN) down = false; 
    if (keyCode == LEFT) lefth = false; 
    if (keyCode == RIGHT) right = false; 
  }
}
