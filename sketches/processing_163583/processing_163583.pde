
float r = 20;
int howMany = 0;
Drop[] drops = new Drop[200];

void setup(){
  size(600,600);
  smooth();
  background(0);

}

void draw(){
  background(49,85,91);
  
  if(howMany<drops.length){
    drops[howMany] = new Drop();
    howMany++;
  }

  for(int i = 0; i<howMany; i++){
    drops[i].move();
    drops[i].show();
  }
}

class Drop {
  float x, y;
  float speed;
  float r;
  color c;
  
  Drop(){
     init();
  }
  void init(){
     x = random(width);
     y = -50;
     r = random(4,6);
     speed = random(8,10); 
     float rand = random(200,255);
     c = color(rand- (mouseX%75), rand- (mouseY%75), rand , random(0,100));
  }
  void show(){
        noStroke();
    fill(c); 
    for(int i = 2 ; i < r; i++){
      ellipse(x, y + (i*4),i*2,i*2);
    }

     fill(52,90,93);
     for(int i = 2 ; i < r; i++){
      ellipse(x, y +10+ (i*4),i*2,i*2);
    }
   
  }
  
  void move(){
    if(y>=600){
      init();
    }
    else{
    y+= speed;
    }
  }
  
  
}
