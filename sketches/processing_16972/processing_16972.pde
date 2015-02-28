
int counter;
float x;
float y;
float angle;


void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  x = width/2;
  y = height/2;
  
}
 
    

void draw() {  //draw function loops 
 background(255);

 ellipse(width/2,height/2,200,200);
 // func2(width/2,height/2,60,5);
   stroke(0,100,255);
 noFill();

 //func3(width/2,height/2,60,5);
 
 func(width/2,height/2,60,5);
 
 
 stroke( 255,0,0);   
 i = 0;
 
 while( i < 4){
angle = PI*i/2;
 
 x = width/2 + 105*cos(angle);
 y = height/2 -105*sin(angle);
 
 
 
 
 line(x,y,x + 100*cos(angle), y -100*sin(angle) ); 
 line(width/2 + 105*cos(angle + 2*PI/15), height/2 - 105*sin(angle + 2*PI/15), x+ 100 *cos(angle), y - 100*sin(angle));
 line(width/2 + 105*cos(angle - 2*PI/15), height/2 - 105*sin(angle - 2*PI/15), x+ 100 *cos(angle), y - 100*sin(angle));
  
  
  i++;
  
  
  }
  
  stroke(0,255,255);
  line( width/2 + 100*cos(3*PI/4), height/2 - 100*sin(3*PI/4), 0,0);
 
    
  
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
      
      
         func2(x + cos(theta)*radius, y -sin(theta)*radius,radius/1.1,depth-1);
         func2(x - cos(theta)*radius, y -sin(theta)*radius,radius/1.1,depth-1);
         
         func2(x + cos(theta)*radius, y +sin(theta)*radius,radius/1.1,depth-1);
         
         func2(x - cos(theta)*radius, y +sin(theta)*radius,radius/1.1,depth-1);
         
         
         
      
      
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
 
   
  
  
                
                                
