
int i= 10; 
int x = 10; 
int y = 10;
float diam = 15; 
int xspeed = 2;
int  distance = 35; 
 
void setup(){
  size (600, 300);
  frameRate(30);
}
 
void draw(){
  background (0,0,0);
  noStroke();
  smooth();
  x = x + xspeed;
   for(int i = 0; i<15; i++) {
     ellipse(x, y+ distance*i ,diam, diam);

   }
   fill(100, 0, 0);
   if(x>=100){
     fill(42);
   }
   if(x>=250){
    fill(152,208,1);
   }
    if(x>=300){
     fill(1,167,208); 
    }
    if(x>=375){
     fill(172,208,181);
    }
    if(x>=400){
     fill(1,42,252);
    } 
    if(x>=450){
     fill(252,1,208);
    }  
    if(x>=500){
     fill(252,214,1);
    } 
     if(x>=550){
     fill(252,1,54);
    } 
    
}


