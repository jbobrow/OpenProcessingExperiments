
float rx, ry;
float ey,ex;
float rwidth,rheight;
float ellSize;

void setup(){
  background(244);
  size(600,600);
  smooth();
  rx= 0;
  ry= 0;
  ey= 0;
  ex= 0;
  rwidth= 0;
  rheight= 0;
  ellSize= 0;

}

 void draw(){
  
   
   for(int x= 20; x < width; x += 10){
  for(int y= 20; y< width; y += 10){
    noFill();
    ellipse(x,y,ellSize,ellSize);
if(ellSize >= 15){
   ellSize = -ellSize;

}  
}
   }
   
  
   for(int i= 20; i< 600; i+=110){
   rectMode(CENTER); 
     fill(68,240,235);
   rect(i,0,rwidth,rheight);
   } 
rwidth ++;
rheight ++;
 ellSize ++;
  ellSize ++;
   
if(rwidth >= 100){
      rwidth = -rwidth ;
}  

 if(rheight >= 100){
    rheight = -rheight ;

 }
   
 

   for(int i= 20; i< 600; i+=110){
   rectMode(CENTER); 
     fill(68,240,235);
   rect(i,100,rwidth,rheight);
   }   
rwidth ++;
rheight ++;

if(rwidth >= 100){
      rwidth = -rwidth ;
}  

 if(rheight >= 100){
    rheight = -rheight ;

 
 
 }
 
   for(int i= 20; i< 600; i+=110){
   rectMode(CENTER); 
     fill(68,240,235);
   rect(i,200,rwidth,rheight);
   }   
rwidth ++;
rheight ++;
 
if(rwidth >= 100){
      rwidth = -rwidth ;
}  

 if(rheight >= 100){
    rheight = -rheight ;

 }
  for(int i= 20; i< 600; i+=110){
   rectMode(CENTER); 
     fill(68,240,235);
   rect(i,300,rwidth,rheight);
   }   
rwidth ++;
rheight ++;
 
if(rwidth >= 100){
      rwidth = -rwidth ;
}  

 if(rheight >= 100){
    rheight = -rheight ;
 }
  for(int i= 20; i< 600; i+=110){
   rectMode(CENTER); 
     fill(68,240,235);
   rect(i,400,rwidth,rheight);
   }   
rwidth ++;
rheight ++;
 
if(rwidth >= 100){
      rwidth = -rwidth ;
}  

 if(rheight >= 100){
    rheight = -rheight ;
 }
  for(int i= 20; i< 600; i+=110){
   rectMode(CENTER); 
     fill(68,240,235);
   rect(i,500,rwidth,rheight);
   }   
rwidth ++;
rheight ++;
 
if(rwidth >= 100){
      rwidth = -rwidth ;
}  

 if(rheight >= 100){
    rheight = -rheight ;
 }
 for(int i= 20; i< 600; i+=110){
   rectMode(CENTER); 
     fill(68,240,235);
   rect(i,600,rwidth,rheight);
   }   
rwidth ++;
rheight ++;
 
if(rwidth >= 100){
      rwidth = -rwidth ;
}  

 if(rheight >= 100){
    rheight = -rheight ;
 }
 }

