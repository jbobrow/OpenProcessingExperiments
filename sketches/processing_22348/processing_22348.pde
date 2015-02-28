
float y=100;
float x=100;
float yspeed=10;
float xspeed=20; 

void setup (){
 size (800,500); 
 smooth();
}

void draw (){
background (230);
noFill();
strokeWeight(10);
//line (100,100, 400, 100);
bezier (0,height/2,200,y,600,x,width,height/2); 
bezier (0,height/2,200,y+40,600,x+40,width,height/2);
 
y=y+yspeed;
x=x+xspeed;

if ((y>height+50) || (y<1-50)){
yspeed = yspeed *-1;   
}

if ((x>height) || (x<1)){
xspeed = xspeed *-1;   
}


}

