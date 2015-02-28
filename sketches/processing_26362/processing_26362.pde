
void setup(){
size(600,600);
fill(255);
smooth();
}
void draw(){
   fill(map(mouseX,0,width,0,255),map(mouseY,0,height,0,255),100);
ellipse(width/2,height/2,250,250);
  fill(255);
}
void keyPressed(){

 fill(mouseX,mouseY,100);
ellipse(mouseX,mouseY,250,250); 
}
void mousePressed(){
   fill(map(mouseX,0,width,0,255),map(mouseY,0,height,0,255),100);
ellipse(width/2,height/2,250,250); 

}

