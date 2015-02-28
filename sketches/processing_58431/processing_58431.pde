
Julia[] shape1,shape2,shape3;
int colors;

void setup(){
  smooth();
  size(600,600);
  strokeWeight(.8);
  shape1 = new Julia[500];
  shape2 = new Julia [800];
  shape3 = new Julia [300];
  for (int i = 0; i < shape1.length; i++){
    shape1[i] = new Julia (random(width),random(height));
  }
  for (int i = 0; i < shape1.length; i++){
    shape2[i] = new Julia (random(width),random(height));
}
 for (int i = 0; i < shape1.length; i++){
   shape3[i] = new Julia (random(width/2),random(height/2));
}
}

void draw(){

  stroke(colors);
  colors++;
  if (colors > 200){
    colors = 4;
  }
  fill(255);
  rect(0,0,width,height);
  for(int i = 0; i < shape1.length; i++){
    shape1[i].move();
    shape1[i].display();
    shape1[i].intersect();
  }
   for(int i=0; i < shape2.length; i++){
     shape2[i].move();
     shape2[i].display();
     shape2[i].intersect();
   }
    for(int i=0; i < shape3.length; i++){
     shape3[i].move();
     shape3[i].display();
     shape3[i].intersect();
   }
}

class Julia{
  float x,y,directionx,directiony;
  int xspeed;
  Julia (float _x, float _y){ //constructor
  x = _x;
  y = _y;
  xspeed = 3;
  directionx = 2;
  directiony =1;
  }

void move(){
  x+=directionx;
  y+=directiony/2;
  if (y>=800){
    directiony=-1;
  }
   if(x>600){
          directionx=-1;
          }
        if(y<1){
          directiony=1;
        }
        if(x<1){
          directionx=1;
        } 
}

void display(){
  noFill();
  stroke(155,300);
  rect(x,y,random(10),random(20));
}

 void intersect(){
    for(int i=0; i<shape1.length;i++){
      strokeWeight(2);
      line(x,y,shape1[i].x,shape1[i].y);
    }
    for(int i=0; i<shape2.length;i++){
      strokeWeight(.8);
      line(x,y,shape2[i].x,shape2[i].y);
    }
    for(int i=0; i<shape3.length;i++){
     strokeWeight(.3);
     line(x,y,shape3[i].x,shape3[i].y);
   }
 }
}


