
/*
 Konkuk University
 SOS iDesign

Name: Sungbum Lee<<------ Write your full name here!
 ID: legendlsb<<--------- Write your ID here!

*/




void setup () {
  background(255, 255, 255);
  size (600, 600);
  //noLoop ();
  smooth ();
  
}
int value = 0;
void draw () {
  fill(238, 230, 176);
  ellipse(280, 280, 449, 449);
  
  strokeWeight(5);
  line(160, 121, 257, 164);
  
  strokeWeight(5);
  line(395, 111, 305, 186);
  
  fill(value);
  ellipse(194, 186 ,75 ,75);
  
  fill(value);
  ellipse(365, 191 ,75 ,75);
  
  strokeWeight(5);
  line(264, 231, 263, 352);
  
  strokeWeight(5);
  line(264, 372, 264, 414);
  
  strokeWeight(5);
  line(278, 372, 279, 418);
  
  strokeWeight(5);
  line(176, 436, 388, 414);
  
  
if(mousePressed){ 


  
  
    float a=random(255); 
    float b=random(255);
    float c=random(150); 

  
fill(constrain(mouseX,mouseY,a),b,c); 
    strokeWeight(8); 
    ellipse(pmouseX,pmouseY,80,80); 

  
  
  
  
  

}


 
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  println(e);
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

void keyPressed(){ 
setup(); 


  


} 
