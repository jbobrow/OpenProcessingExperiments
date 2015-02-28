
stars a;
void setup() {
    size (600,600);
  noStroke();
  smooth();
  background(0);
  
  a = new stars();
  a.x = random(100);
  a.y = random(100);
  
}


void draw(){
    fill(0,5);
  rect (0,0,width,height);
  a.show();
  a.move();
}




class stars{
  float x;
  float y;
  
  
  void show() {
    
  fill (0,100,0);
  for (int i = 0; i <width; i+=4) {
  ellipse(i,y,1,1);
  ellipse(i+random(2),y+random(-5,5),1,1);
  ellipse(i+random(2),y+random(-5,5),1,1);
  }
    for (int i = 0; i <width; i+=4) {
  ellipse(i,y,1,1);
  ellipse(i+random(100),y+random(-5,5),1,1);
  ellipse(i+random(100),y+random(-5,5),1,1);
  }
  
    for (int ib = 0; ib <height; ib+=4 ) {
  //ellipse(x,ib,1,1);
  ellipse(x+random(2),ib+random(-5,5),1,1);
  ellipse(x+random(2),ib+random(-5,5),1,1);
  
  }
  
 }
 
   void move() {
     y += 1;
     x += 1;
       //borders
   if (x<2){
   x = width-30; 
  } else if (x>width-20) {
    x = 3;
  }
  
    if (y<-10){
   y = height - 30; 
  } else if (y>height+30) {
    y = 3;
  }
   }
  
}

