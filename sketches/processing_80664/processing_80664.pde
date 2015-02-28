
//the sun code from http://www.openprocessing.org/sketch/51775

//the firework code from http://www.openprocessing.org/sketch/30877

/* @pjs preload="happy.jpg"; */

//fireworks
ArrayList<Fire> hanabi = new ArrayList();
 
final int FIRE_COUNT = 1000;
final float X = 200;
final float Y = 50;
final float G = 0.04;
 

PImage img;

void setup() {
    size( 600, 400 );
    smooth();
    

   color c = color(random(50,255),random(50,255),random(50,255));
    
   for(int i=0; i<FIRE_COUNT; i++){
     float r = random(0,TWO_PI);
     float R = random(0,2);
      
     hanabi.add(new Fire(X,Y,R*sin(r),R*cos(r),c));
   }



    img= loadImage("happy.jpg");
    image(img,0,0);
}
 
void draw() {
     
    background( img ); //resents background color to image
    int rbound = 200; //default
     
    fill( 255, 246, 64); //yellow
    stroke( 255, 246, 64); //yellow
    strokeWeight( 3 );
    int twinkle = 80; //distance change in ray length
    //float radius=200; //radius of rays
    float radius;
    int numPoints=100; //number of rays
    float angle=TWO_PI/(float)numPoints;
     
    //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(100,100,radius/2*sin(angle*i)+100,radius/2*cos(angle*i)+100);
    }
    
    
    //third (the grass from right to left)
    
    stroke( 165, 200, 4); //green
    strokeWeight( 2 );
    
        //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(500,550,radius/2*sin(angle*i)+600,radius/2*cos(angle*i)+430);
    }
    
    stroke( 135, 200, 4); //green
    strokeWeight( 2 );
    
     //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(400,550,radius/2*sin(angle*i)+500,radius/2*cos(angle*i)+430);
    }
    
     for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(300,550,radius/2*sin(angle*i)+400,radius/2*cos(angle*i)+430);
    }
    
    stroke( 165, 200, 4); //green
    strokeWeight( 2 );
    
         //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(200,550,radius/2*sin(angle*i)+300,radius/2*cos(angle*i)+430);
    }
    
    //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(100,550,radius/2*sin(angle*i)+200,radius/2*cos(angle*i)+430);
    }
    
    stroke( 195, 200, 4); //green
    strokeWeight( 3 );
    
        //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(10,550,radius/2*sin(angle*i)+20,radius/2*cos(angle*i)+430);
    }
    
            //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(50,550,radius/2*sin(angle*i)+100,radius/2*cos(angle*i)+430);
    } 
    
     /*/firework
    noStroke();
    fill(50,0,40,20);
    rect(0,0,width,height);
    for (int i = 0; i < fs.length; i++){
      fs[i].draw();
    } 
  /*/
  
  noStroke();
  fill(0,40);
  rect(0,0,width,height);

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
     
    color c = color(random(150,255),random(150,255),random(150,255));
     
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


