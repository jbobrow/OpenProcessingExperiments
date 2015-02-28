

int num=6;

Squa[] mySquas = new Squa[num];
color[] myColors = new color[3];

void setup(){
  size(300,300);
  
 myColors[0] = color(255,0,0,50);
 myColors[1] = color(0,255,0,50);
 myColors[2] = color(0,0,255,50); 
 rectMode(CENTER);
 for(int i=0;i<mySquas.length;i++){
   mySquas[i]= new Squa();
 }
 noStroke();
 smooth();
}

void draw() {
  background(255);

  for(int i=0; i < mySquas.length; i++) {
    mySquas[i].update();
    mySquas[i].draw();
  }
}


class Squa {

  float xpos = random(20,width-20);
  float ypos = random(20,height-20);  
  float rectSize=random(100);  
  color col = myColors[floor(random(0,3))];

  Squa() {
  }
  
  void update() {
    rectSize++;
   if(rectSize > width) {  
   rectSize = 1;  
    xpos = random(20,width-20);
    ypos = random(20,height-20);  
    }
  }

  void draw() {
    fill(col);
    rect(xpos,ypos,rectSize,rectSize);
  }
}

