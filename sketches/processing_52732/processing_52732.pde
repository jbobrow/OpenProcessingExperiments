
int mode = 1;
int numloops;
 
void setup(){
 size(800,600);
 noFill();
}
 
void draw(){
  background(255);
  translate(200,200);
  //steady ellipse
  for(int i = 0; i < mouseX; i++){
     rotate(radians(1));
     ellipse(0,mouseY,200,200);
  }
  //modes
  if(mode == 1){
    translate(500,500);
    for(int i = 0; i < mouseY; i++){
        rotate(radians(1));
        rect(10,10,1100,1100); 
     }
  } else if(mode == 2){
   for(int i = 0; i < 365; i++){
        rotate(radians(1));
        ellipse(20,20,1100,1100);
        rect(20,20,1100,1100);
     }
  } else if(mode == 3){
     translate(800,600);
     for(int i = 0; i < mouseY; i++){
        rotate(radians(1));
        ellipse(20,20,100,100);
        rect(20,20,110,110);
        rect(600,600,10,mouseY);
 
  }
  }

  } 
  

 
void keyPressed(){
   if(key == '1'){
     mode = 1;
   }else if(key == '2'){
     mode = 2;
   }else if(key == '3'){
      mode = 3;
     }
}
   




