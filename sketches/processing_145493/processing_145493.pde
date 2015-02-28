
//float timer = 0.0
 float pic = 1;
float radius = 0.0;
float timer = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
 
  
  
void setup(){
    
  size(500,500);
  background(0);
  smooth();
  noStroke();
  
 
}
  
void draw (){
  rect(50,150,50,50);
  rect(50,50,50,50);
  rect(50,250,50,50);
  rect(50,350,50,50);
  rect(400,50,50,50);
  rect(400,150,50,50);
  rect(400,250,50,50);
  rect(400,350,50,50);
  
  
  frameRate(1000);
noStroke();
  
 if (timer >= 18.0){
        timer = 0.0;
        radius = 0.0;
        prevX = center;
        prevY = center;
          
         
        thickness++;
    }
      
    
    if (pic < 2) {
      
        
       fill(random(0,200), random(0, 200), random(0,800));
  ellipse(random(0, 200),random(0, 200),200,200);
  fill(random(0, 200), random(0, 200), random(0,200));
  ellipse(random (0, 200),random (0, 800),100,100);
        
  
   fill(random(0, 200), random(0, 200), random(0,200));
    }
    
   
}

