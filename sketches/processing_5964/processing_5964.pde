
int x;
int y;
float yerim;

void setup(){
  size(800,800);
}

void draw(){

  background(82,247,224);
  noStroke();
    yerim= random(80);
 
  y=0; 
  while (y<840){
     x=0;
    while(x<840){
      fill(random(255),60);
      ellipse(x,y,yerim,yerim);
      x=x+80;
    }
    y=y+80;
  }
}



