
int a = 10;
int colour = 0;
 
void setup(){
  size(500,500);
  background(255);
}
 
void draw(){
 // if (mousePressed &&(mouseButton == LEFT)){
   // fill(255,80);
  //}else if (mousePressed && (mouseButton == RIGHT)){
    //  fill(0);
  //}else{
    //  fill(280,0,40);
  //}
fill(colour);
  ellipse(mouseX, mouseY, a, a);
}
 
 void mousePressed(){
   if(colour == 0){
     colour = 255;
   }else {
     colour =0;
   }
 }

