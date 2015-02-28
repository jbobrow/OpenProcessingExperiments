
void setup(){
  size(800,600);

}
void draw(){
  background(0);
  smooth();
  noStroke();
  for(int j=0; j<40; j++){
    for(int i=0; i<30; i++){
      float d=dist(50*i,50*j,mouseX,mouseY)/10;
      fill(58,220,240);
      
      if(mouseX > -10 && mouseX < 300){
        fill(206,37,147);
      }
       if(mouseX > 301 && mouseX < 500){
        fill(247,247,0);
      }
       if(mouseX > 501 && mouseX < 800){
        fill(0,241,247);
      }
      
      rect(50*i,50*j,40-d,40-d);
}    
  }
}

void mouseClicked(){
  save("tela" + hour()+second()+ ".jpg"); 
}



