
void setup(){
   size(700,300);
}
void draw(){
   background(200);
   fill(0,255,0);
   if(mouseX<30){
      fill(0,255,0);
 }
 if(mouseX>30){
    fill(255,0,0);
    }
ellipse(15,13,30,60);
}
