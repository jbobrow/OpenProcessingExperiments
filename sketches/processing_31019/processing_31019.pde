
void setup() { 
size(500,500);
background(color(255, 255, 255));

}

void draw() {

  
 if(keyPressed == true){
   if(key == 'a'){
    
     fill(255, 0, 0);
   rect(mouseX, mouseY, 10, 10);
   }
 }

 }


void mouseDragged() {
  fill(0);
   textSize(30);
 text("Press and Hold a", 200, 200);
  fill(255);
  ellipse(mouseX, mouseY, 10, 10);
  frameRate(255);
  
}

  
  
 
