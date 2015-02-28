
int counter;


void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
 background(255);
 stroke(0,0,0);
 noFill();
 func(width/2,height/2,60,5);
 //func3(width/2,height/2,60,5);
  
  ellipse(width/2,height/2,200,200);
    func2(width/2,height/2,60,5);
    
  
}


void func(float x, float y, float radius, int depth){
   if( depth > 0){
    ellipse(x,y,radius/depth,radius/depth);
      line(x,y,x + radius/depth,y);
      line(x,y,x - radius/depth,y);
      line(x,y,x,y + radius/depth);
      line(x,y,x,y - radius/depth);
      
      float theta = PI/4;
      
      
         func(x + cos(theta)*radius, y -sin(theta)*radius,radius/2,depth-1);
         func(x - cos(theta)*radius, y -sin(theta)*radius,radius/2,depth-1);
         
         func(x + cos(theta)*radius, y +sin(theta)*radius,radius/2,depth-1);
         
         func(x - cos(theta)*radius, y +sin(theta)*radius,radius/2,depth-1);
         
         
         
      
      
   }
   
   
 }
   
 void func2(float x, float y, float radius, int depth){
   if( depth > 0){
   stroke(0,255,0);

    ellipse(x,y,radius/depth,radius/depth);
      line(x,y,x + radius/depth,y);
      line(x,y,x - radius/depth,y);
      line(x,y,x,y + radius/depth);
      line(x,y,x,y - radius/depth);
      
      float theta = PI/4;
      
      
         func2(x + cos(theta)*radius, y -sin(theta)*radius,radius/3,depth-1);
         func2(x - cos(theta)*radius, y -sin(theta)*radius,radius/3,depth-1);
         
         func2(x + cos(theta)*radius, y +sin(theta)*radius,radius/3,depth-1);
         
         func2(x - cos(theta)*radius, y +sin(theta)*radius,radius/3,depth-1);
         
         
         
      
      
   }
   
   
 }
 
 void func3(float x, float y, float radius, int depth){
   if( depth > 0){
   stroke(0,0,255);

    ellipse(x,y,radius/depth,radius/depth);
      line(x,y,x + radius/depth,y);
      line(x,y,x - radius/depth,y);
      line(x,y,x,y + radius/depth);
      line(x,y,x,y - radius/depth);
      
      float theta = PI/4;
      
      
         func3(x + cos(theta)*radius, y -sin(theta)*radius,radius/1.5,depth-1);
         func3(x - cos(theta)*radius, y -sin(theta)*radius,radius/1.5,depth-1);
         
         func3(x + cos(theta)*radius, y +sin(theta)*radius,radius/1.5,depth-1);
         
         func3(x - cos(theta)*radius, y +sin(theta)*radius,radius/1.5,depth-1);
         
         
         
      
      
   }
   
   
 }
 
   
                
                
