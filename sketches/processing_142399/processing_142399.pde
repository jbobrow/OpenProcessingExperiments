
void setup(){
  size(800,600);
}
void draw(){
 fill(random(250), random(255),random(255),100);
  grid();
  
}
void grid (){
  
  for(int x=0;x<800;x+=60){
    for(int y=0 ; y<600; y+=60){
     noStroke();
     pushMatrix();
     translate(x,y);
     rect(x,y,mouseX/4,mouseY/4);
         popMatrix();
         
       if(mouseX>400) {
        x-=5;
        
    }}}
     if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }
    }
