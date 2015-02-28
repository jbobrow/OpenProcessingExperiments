
void setup(){

size(200,200);
background(255); 
stroke(255,0,0);
strokeWeight(1);

}

int x=110;
int y=20;

void draw(){
 for(; x<200;x+=10){
   line(x,y,180,20);
   line(10,20,-x+200,y);
   y+=10;
 }
 }
