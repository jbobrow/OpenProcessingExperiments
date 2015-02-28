
boolean mouse = false;
boolean z = false;
int b = 50;

void setup (){
  size (400,400);
  colorMode(HSB);
  frameRate(20);
  background(0);
}

void draw (){
  
  if(z==true){
    background(0);
    z = false;
  }
    
  int potato = frameCount%(148);
  noStroke();
  fill(frameCount%(255),255,255);
 if (mousePressed == true){
   ellipse(mouseX,mouseY,potato*frameCount%(90),potato*frameCount%(90));
 } 
}
void keyPressed() {
  if (key == 'c'){
    z = !z;
  }
  if (key == 'a'){
    background(random(200));
  }
}
