
/*@pjs preload="ki.jpg";*/
PImage img1;


void setup(){
size(500, 500);
background(255);
 img1 = loadImage("ki.jpg");
 image(img1, 0,0,500,500);
smooth();
noStroke();
fill(0,255,255);
}

 void draw() {
}
 
void mouseDragged() { 
  ellipse(mouseX, mouseY, 20, 20);
 }
 
 //irokae
 void keyPressed(){
  if(keyPressed){
    if(key == 'r'){  
    fill(255,0,0,80);
    }
    else if(key == 'g'){ 
    fill(0,152,14,80);
    }
    else if(key == 'o'){  
    fill(255,150,0,80);
    }
        if(keyCode == 'C') {
    background(255);
    image(img1, 0,0,500,500);
 
     }
  }
}

  

  
 

 






