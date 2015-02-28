
void setup(){
    size(255,255);
}

void draw(){

   
    if (mouseX>77.5 && mouseX<177.5 && mouseY>77.5 && mouseY<177.5){
      background(mouseX,mouseY,0);
    }
     else {
       background(255);
    }
    
   fill(0);
   rect(77.5,77.5,100,100);   //must be at the last!
}



