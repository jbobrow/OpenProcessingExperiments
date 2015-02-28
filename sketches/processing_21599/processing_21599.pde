
int x = 225;
int y = 150;

Walker[] walkers = new Walker[50];
color[] colors = new color[5];


void setup(){
  size(200,200);
  background(200);
  
  colors[0] = color(x);
  colors[1] = color(y);
  colors[2] = color(x,y,0);
  colors[3] = color(0,x,y);
  colors[4] = color(x,0,y);
  
  for(int i=0; i< walkers.length; i++){
    walkers[i] = new Walker();
  }
}

void draw(){
  for(int i=0; i < walkers.length; i++) {
  walkers[i].update();
  walkers[i].display();
  }
}

class Walker{
  float Xpos = random(50,150);
  float Ypos = random(50,150);
  color col = colors[floor(random(0,4))];
  
  Walker(){
  }
  
  void update(){
    
    this.Xpos = Xpos + random(-1,1);
    this.Ypos = Ypos + random(-1,1);
  }
  
  void display(){
    stroke(col);
    point(Xpos,Ypos);
  }
}
  
  

