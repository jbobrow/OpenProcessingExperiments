
float vx=2;
float vy=0;
float x=0;
float y=10;
float frictionx=.998;
float frictiony=-.75;
float gravity=.07;

void setup(){
  size(800,600);
  background(255,175,0);
}

void draw(){
phys();
ellipse(200,300,30,30);
ellipse(400,550,40,40);
ellipse(500,150,30,30);
ellipse(700,550,40,40);
}

void phys(){
  //physics math
  vy+= gravity;
  vx*=frictionx;
  x+=vx;
  y+= vy;
  if(y>height){
  y=height;
  vy *=frictiony;
}
fill(234,543,23);
ellipse(x,y,5,5);
//ellipse(mouseX/4,mouseY/4,100,500);

  
  
  if(x>width){
    x=width;
      vx *=-20;
      
        println(50000-millis()/1000);
          text(50000-millis()/1000,100,600);

  }
  
if(dist(x, y, 600,600)<200){
  fill(231,33,298);
  vx*=frictionx;
  vy*=gravity;
  fill(250,156,200);
  ellipse(x,y,50,50);
  //noFill();

 
  }
  
      }
          
        
     
void mouseReleased(){
  ellipse(x,y,20,20);
  vy-=3;
  
}



