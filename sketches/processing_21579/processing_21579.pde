
int num=50;

road[] myRoad = new road[num];
color[] myColors = new color[3];

void setup(){
  size(300,300); 
  background(255);
 myColors[0] = color(255,100,200,50);
 myColors[1] = color(100,255,200,50);
 myColors[2] = color(200,100,255,50); 
 for(int i=0;i<myRoad.length;i++){
   myRoad[i]= new road();
 }
 smooth();
}

void draw() {


  for(int i=0; i < myRoad.length; i++) {
    myRoad[i].update();
    myRoad[i].draw();
  }
}


class road {

  float xpos = random(20,width-20);
  float ypos = random(20,height-20);  

  color col = myColors[floor(random(0,3))];

  road() {
  }
  
  void update() {
    xpos=xpos+random(-1,1);
    ypos=ypos+random(-1,1);
    
   if(xpos > width) {  
   xpos =xpos-1; 
    }
    if(xpos <0) {  
   xpos =xpos+1; 
    }
    if(ypos > height) {  
   ypos =ypos-1; 
    }
    if(ypos < 0) {  
   ypos =ypos+1; 
    }
  }

  void draw() {
    stroke(col);
    strokeWeight(random(1,3));
    point(xpos,ypos);
  }
}

