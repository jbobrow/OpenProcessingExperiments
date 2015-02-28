
int counter;

void setup() {
  size(1000,1000);
  background(0);
  colorMode(HSB,255);
  smooth();
  counter = 0;
}
  
  void draw() {
    if(mousePressed && (mouseButton == LEFT)) {
      strokeWeight(random(1,5));
      stroke(mouseX,mouseY,217,5);
       counter++;
       counter++;
    
  
    
    if(counter>width) { counter=0;}
      line(width-counter,counter,pmouseX,pmouseY);
      line(width-counter,counter,pmouseY,pmouseX);
      line(width-counter,counter,width-pmouseX,height-pmouseY);
      line(width-counter,counter,width-pmouseY,height-pmouseX);
      line(width-counter,counter,width-pmouseX,pmouseY);
      line(width-counter,counter,pmouseX,height-pmouseY);
      line(width-counter,counter,pmouseY,height-pmouseX);
      line(width-counter,counter,width-pmouseY,pmouseX);
      
      line(counter,counter,pmouseX,pmouseY);
      line(counter,counter,pmouseY,pmouseX);
      line(counter,counter,width-pmouseX,height-pmouseY);
      line(counter,counter,width-pmouseY,height-pmouseX);
      line(counter,counter,width-pmouseX,pmouseY);
      line(counter,counter,pmouseX,height-pmouseY);
      line(counter,counter,pmouseY,height-pmouseX);
      line(counter,counter,width-pmouseY,pmouseX);
       counter++;
    
  
    
    if(counter>width) { counter=0;}
    }
      
      if(mousePressed && (mouseButton == RIGHT)) {
        
        strokeWeight(random(1,5));
        //stroke(random(0,32),255,255,255);
        
        stroke(0,0,0,5);
        //line(mouseX,mouseY,pmouseX,pmouseY);
        //stroke(random(128,160),255,255,255);
        //line(mouseY,mouseX,pmouseY,pmouseX);
        //stroke(random(32,64),255,255,255);
        //line(width-mouseX,height-mouseY,width-pmouseX,height-pmouseY);
        //stroke(random(64,96),255,255,255);
      //line(width-mouseY,height-mouseX,width-pmouseY,height-pmouseX);
      //stroke(random(96,128),255,255,255);
      //line(width-mouseX,mouseY,width-pmouseX,pmouseY);
     //stroke(random(160,192),255,255,255);
      //line(mouseX,height-mouseY,pmouseX,height-pmouseY);
     // stroke(random(192,226),255,255,255);
      //line(mouseY,height-mouseX,pmouseY,height-pmouseX);
      //stroke(random(48,79),255,255,255);
      
        line(width-counter,counter,pmouseX,pmouseY);
      line(width-counter,counter,pmouseY,pmouseX);
      line(width-counter,counter,width-pmouseX,height-pmouseY);
      line(width-counter,counter,width-pmouseY,height-pmouseX);
      line(width-counter,counter,width-pmouseX,pmouseY);
      line(width-counter,counter,pmouseX,height-pmouseY);
      line(width-counter,counter,pmouseY,height-pmouseX);
      line(width-counter,counter,width-pmouseY,pmouseX);
      
      line(counter,counter,pmouseX,pmouseY);
      line(counter,counter,pmouseY,pmouseX);
      line(counter,counter,width-pmouseX,height-pmouseY);
      line(counter,counter,width-pmouseY,height-pmouseX);
      line(counter,counter,width-pmouseX,pmouseY);
      line(counter,counter,pmouseX,height-pmouseY);
      line(counter,counter,pmouseY,height-pmouseX);
      line(counter,counter,width-pmouseY,pmouseX);
         
      }
        
      
      if(keyPressed && (key == ' ')) {
        background(0);
      }
      if (keyPressed && (key == 's')) {
        save("painting.jpg");
      }
      
      
       counter++;
    
  
    
    if(counter>width) { counter=0;}
    }
  
    
     	




