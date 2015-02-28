
void setup(){
  size(600,600);
  background(200,100,300);

}
   
void draw(){
  noStroke();
  triangle(300,10,10,500,550,500);
  
if(mousePressed == true){
   fill(255,0,0);
}else{
   fill(255);
}
}


