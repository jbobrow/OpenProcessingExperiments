
//float timer = 0.0
 float pic = 1;
float radius = 0.0;
float timer = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;

 
 
void setup(){
   
 
  size(800,800);
  background(0);
  colorMode(HSB, 360, 100, 100, 100);

center = width / 2.0;
    prevX = center;
    prevY = center;

   
  
}
 
void draw (){
  frameRate(30);
noStroke();
 
 if (timer >= 18.0){
        timer = 0.0;
        radius = 0.0;
        prevX = center;
        prevY = center;
         
        
        thickness++;
    }
     
    
    float spiralOffset = 10.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += center;
    y += center;
     
    
    strokeWeight(thickness); 
    float timerScalar = 20.0;   
    stroke(timer * timerScalar, 100, 100, 40);
    line(prevX, prevY, x, y);
     
    
    prevX = x;
    prevY = y;
         
     
    timer += 0.0167; 
    radius += 0.2;
 

   
   
    if (pic < 2) {
       
       fill(random(0, 800), random(0, 800), random(0,800));
  ellipse(random(0, 800),random(0, 800),200,200);
  fill(random(0, 800), random(0, 800), random(0,800));
  ellipse(random (0, 800),random (0, 800),100,100);
       
  //random colors
   fill(random(0, 255), random(0, 255), random(0,255));
    }
}


