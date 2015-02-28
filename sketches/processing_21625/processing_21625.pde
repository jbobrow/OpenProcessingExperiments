
int num=60;
 
walk[] myWalk = new walk[num];
color[] Colors = new color[3];
 
void setup(){
  size(400,400);
  background(255);
 Colors[0] = color(200,200,0,50);
 Colors[1] = color(50,50);
 Colors[2] = color(0,200,200,50);
 for(int i=0;i<myWalk.length;i++){
   myWalk[i]= new walk();
 }
 smooth();
}
 
void draw() {
 
 
  for(int i=0; i < myWalk.length; i++) {
    myWalk[i].update();
    myWalk[i].draw();
  }
}
 
 
class walk {
 
  float xpos = random(10,width-10);
  float ypos = random(10,height-10); 
 
  color col = Colors[floor(random(0,3))];
 
  walk() {
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
    rect(xpos,ypos,15,15);
  }
}

