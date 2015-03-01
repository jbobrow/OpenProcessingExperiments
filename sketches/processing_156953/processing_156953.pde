
void setup(){
 size(600,600); 
  
}



void draw(){
//  for(int i = 0; i < 10; i++ ){
//    for(int j = 0; j < 10; j++){
//   //do something in here for 10 times 
//  rect(i * 10, j * 10, 10, 10);  
//    
//  
//
//}
//}
  
  
  
  for (int i = 0; i <width; i +=10){
   float sine = sin((frameCount + i) * 0.1);
   fill(mouseX,mouseY);
  ellipse(i, height/2 + (sine * random(width)), 10, 10); 
    
  }


  if (keyPressed) {
    if (key == 's') {
      saveFrame();
    }
    
  }
  }





