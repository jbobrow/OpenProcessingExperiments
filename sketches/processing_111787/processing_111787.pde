

void setup (){
  size (500,500);
 colorMode(HSB);
}

 float hue=0;
void draw(){
     background(255);
     if(mouseX<250 && mouseY<250){
    
    for (int i=0;i<250;i++){
     hue=(hue+1)%255;
      stroke(hue,255,255);
      rect(0,0,width-i*2,height-i*2);
      frameRate(15);
    }
    }
   else if(mouseX<250 && mouseY>250){
    for (int i=0;i<250;i++){
     hue=(hue+1)%255;
      stroke(hue,255,255);
      rect(0,500,width-i*2,-height-i*2);
      frameRate(15);
    } 
   }
   else if(mouseX>250 && mouseY>250){
    for (int i=0;i<250;i++){
     hue=(hue+1)%255;
      stroke(hue,255,255);
      rect(500,500,-width+i*2,-height+i*2);
      frameRate(15);
    } 
   }  
   else {
    for (int i=0;i<250;i++){
     hue=(hue+1)%255;
      stroke(hue,255,255);
      rect(500,0,-width-i*2,height-i*2);
      frameRate(15);
    } 
   }
   //void keyPressed
    //fill(random(255),255,255);
// ellipse(mouseX,mouseY,20,20);
 
}


