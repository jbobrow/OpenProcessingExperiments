
void setup(){
 size(500,500);
}

void draw(){
 background(0);
 noStroke();fill(255);
 float masxse =dist(width/2, height/2,0, 0);
 for(int a=0;a<width;a+=4){
 for(int b=0;b<height;b+=4){
   float d=dist(width/2, height/2, a, b);
   if(random(masxse)*(random(0.2,0.9))>random(d)){
     rect(a,b,4,4);
   }
 } 
 } 
}
