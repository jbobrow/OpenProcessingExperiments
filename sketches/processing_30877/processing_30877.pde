

ArrayList<Fire> hanabi = new ArrayList();

final int FIRE_COUNT = 1000;
final float X = 200;
final float Y = 50;

final float G = 0.04;

/*
///////

  setup
   
//////
*/
void setup()
{
   size(400,400);
   
   color c = color(random(50,255),random(50,255),random(50,255));
   
   for(int i=0; i<FIRE_COUNT; i++){
     float r = random(0,TWO_PI);
     float R = random(0,2);
     
     hanabi.add(new Fire(X,Y,R*sin(r),R*cos(r),c));
   }
}

void draw()
{
  noStroke();
  fill(0,40);
  rect(0,0,width,height);
  
  fill(200);
  text("click anywhere" , 10,380); 
  
  for(Fire fire : hanabi){ 
    fire.vx += 0;
    fire.vy += G;
    
    fire.x += fire.vx;
    fire.y += fire.vy;
    
    if(fire.lifetime-50>0){
      noStroke();
      fill(fire.col, // RGB
         fire.lifetime-50); //Alpha
        
      ellipse(fire.x,fire.y,4,4); // draw the fire
      fire.lifetime -= 0.5; // decrease lifetime
    }else{
    }
  }
}

void mousePressed()
{
    hanabi.clear();
    
    color c = color(random(50,255),random(50,255),random(50,255));
    
    for(int i=0; i<FIRE_COUNT; i++){
     float r = random(0,TWO_PI);
     float R = random(0,2);
     
     hanabi.add(new Fire(mouseX,mouseY,R*sin(r),R*cos(r),c));
   }
}

class Fire{
  float x;
  float y;
  float vx;
  float vy;
  
  color col;
  
  float lifetime = 100;
  
  Fire(float x, float y, float vx, float vy, color col){
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.col = col;
  }
}

