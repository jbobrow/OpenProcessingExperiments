
//Brian Cantrell

float rad = 40;
float theta = .05;
float speed = 0;
int state = 0;
int count = 0;
float diam = 15;
int r, g, b, a;
float x;
float y;
float locX, locY;
int radMain = 0;

void setup(){
  background(60,50,50,255);
  size(800,800);
}

void draw(){
  
  r = 0;
  g = int(random(240,255));
  b = int(random(240,255));
  a = int(random(100,200));
  fill(r,g,b,a);
  stroke(r,g,b,a);
  count++;
  
  //define the area of an expanding circle
  locX = width/2 + sin(theta) * radMain;
  locY = height/2 + cos(theta) * radMain;
  
  //on the perimeter of that circle, 
  //define a smaller rotating area to fill with ellipses
  float areaX = locX + random(sin(theta)*rad);
  float areaY = locY + random(cos(theta)*rad);
  
  //evenly spaces the ellipses
  x = int(areaX/diam)*diam;
  y = int(areaY/diam)*diam;
  
  ellipse(x,y,diam,diam);
  line(x,y,width/2,height/2);
  
  //increase the angle
  theta += speed;
  
  if(count > 30){
    count = 0;
    state++;
    radMain += 4;
    speed += .02;
    
    if(state == 15){
      diam -= 5;
    }
    
    if(state == 30){
      diam -= 5;
    }
    
    if(state == 40){
      diam -= 2;
    }
    
    if(state > 50){
        state = 0;
        radMain = 0;
        speed = 0;
        fill(60,50,50,210);
        rect(0,0, 800,800);
        diam = 15;
     }
  }
}


