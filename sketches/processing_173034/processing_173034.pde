
float headSize = 100f;
float eyeSize = headSize/6;
boolean colorSwitch;
int color1, color2;

void setup() {
 size(1000, 800);
 colorSwitch = true;
 color1 = 0;
 color2 = 255;
  
}

void draw(){
 //background(color2);
 
 popMatrix();
 
 //Head
 fill(color1);
 ellipse(mouseX, mouseY, headSize, headSize);

//Eyes
//Left eye
 fill(color2);
 ellipse(mouseX - headSize/5, mouseY - headSize/4, eyeSize, eyeSize);
 
//Right eye
 fill(color2);
 ellipse(mouseX + headSize/5, mouseY - headSize/4, eyeSize, eyeSize);
pushMatrix();

mouseAction();

}

void mouseAction() {
 
 if (mousePressed){
  
 if (colorSwitch){
  colorSwitch = false;
  color1 = 255;
  color2 = 0;
 }
 else{
 colorSwitch = true;
 color1 = 0;
 color2 = 255;
 }  
 
 if(headSize < width){
    headSize+=1; 
 } else if(headSize >= width){
   headSize = 50;
 }

}
}


