
int ellipseX = 0;
int ellipseY = 500;

int arcX = 500;
int arcY = 0;

 void setup(){
 size(1000,1000);
 }


 void draw(){

 background(0);

 fill(255);

 ellipse(ellipseX,ellipseY,200,200);

 ellipseX = ellipseX+1;
   
 fill(255);
   
 arc(arcX,arcY,200,200,radians(80),radians(200));
    
 arcY = arcY+2;
    
}



