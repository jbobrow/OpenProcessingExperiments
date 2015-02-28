

void setup(){
 size(500,500);

}
void draw(){
    background(0,0,255);
   rect(300,100,100,100);
   rect(100,100,100,100);

  if (mouseX>100 && mouseX<200){
    if(mouseY<200 && mouseY>100){
      if (mousePressed){
     ellipse(50,50,50,50);
      }
    }
}
  if (mouseX>300 && mouseX<400){
    if(mouseY<200 && mouseY>100){
      if (mousePressed){
     ellipse(350,350,50,50);
      }
    }
  }
}


