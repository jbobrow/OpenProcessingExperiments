
int counter;

void setup() {  //setup function called initially, only once
 size(800,800); 
}

void draw() {  //draw function loops 
   if(mousePressed == true){
    float circX = random(1,120);
    float circY = random(1,120);


    if(mouseX < 400 && mouseY < 400){
      fill(0,0,255);
    }
    else if(mouseX < 400 && mouseY >= 400){
      fill(0,255,0); 
    }
    else if(mouseX >= 400 && mouseY < 400){
      fill(255,0,0);
    }
    else{
      fill( random(0,255), random(0,255), random(0,255)); 
    }
    
    float x = random(0,1000);
    
    if( int(x) % 2 == 0){
      ellipse(mouseX, mouseY, circX, circY);
    }
    else{
      rect(mouseX - (circX/2), mouseY - (circY/2), circX, circY); 
    }
  }
}
