
void setup(){
size(200,200);
background (255);
}
void draw(){
 strokeWeight (1);
 for( int y=3; y<200; y=y+5) {
   line(100-y/2,y,100+y/2,y);
 }
}

