


void setup(){
  size(400,400);
   background(255);
  drawBKG();
 
}
void drawBKG(){

 for (int d = 400; d>0; d-= 20) {
  fill(random(256), random(256), random(256));
  ellipse(200,200,d,d); 
 }
}

void draw(){

if(mousePressed==true){
   for (int d = 400; d>0; d-= 20) {
  fill(random(256), random(256), random(256));
  ellipse(200,200,d,d); 

   }
 }
 }

void mouseClicked(){
  
for (int d = 80; d>0; d-= 10) {
  fill(random(256), random(256), random(256));
// noStroke();
  ellipse(mouseX,mouseY,d,d); 
}}

