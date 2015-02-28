
boolean grow;
int w = 40;
int h = 40;

void setup(){
  grow = true;
  size(600,600);
}


void draw(){
  background(0);
  fill(255);
  ellipse(width/2, height/2, w,h);
  if (grow == true){
    w++;
    h++;
  }
  else{
    w--;
    h--;
  }
}


// EVENT HANDLER
void mousePressed() {
  
  if (grow == true) {
    grow=false;
  }
  else {    
    grow=true;
  }
  
}


