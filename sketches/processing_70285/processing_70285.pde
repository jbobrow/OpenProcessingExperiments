
int num=10;
  int c = 0;
  
Bot b[] = new Bot[num];
void setup() {
  colorMode(HSB,100);
  size(800, 400); 
  background(0);
  smooth();

  for (int i=0;i<num;i++) {
    b[i] = new Bot();
  }
}

void draw() {
  for (int i=0;i<num;i++) {
    b[i].advance();
  }
  if(keyPressed){
    if(c<100){c+=1;}else{c=0;}
    background(0);
  }
}

class Bot {
  float xp=0;
  float yp=0;
  float t = 0;

  Bot() {
    initXY();
  }
 void initXY(){
    xp= width/2; //+ random(100)*sin(radians(random(360)));//random(width/2);
    yp= height/2; //+ random(100)*cos(radians(random(360)));//random(height/2);
    t = random(360);
   // c++;
   
 }
  void advance() {
    for (int i=0;i<360;i+=30 ) {
      stroke(c,random(80),random(100),random(10));  
      float x = random(10)*sin(radians(i));
      float y = random(10)*cos(radians(i));
      noFill();
    ellipse( xp+x, yp+y,random(5),random(5));  
      
      //line(xp, yp,);
    }
    xp+=1*cos(radians(t));
    yp+=1*sin(radians(t));

    t+=random(10)-5;
    
    if(xp>width || xp<0 ||yp>height || yp<0){initXY();}
    
  }
}


