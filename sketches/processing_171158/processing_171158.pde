


void setup (){
size (400,400);
background (255,255,53);
frameRate (10);
}
void draw(){
int a;
int s;

for( a=50; a<400; a=a+50){
  
    for(s=50; s<400; s=s+50 ){
    strokeWeight(50);
    stroke(255); 
    point(a,s);

}
}
for( a=50;a<400;a=a+50){
  
    for(s=50;s<400;s=s+50 ){
   strokeWeight(10);
   stroke(0); 
    point(a,s);
  }
}
}

