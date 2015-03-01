

void setup()
{
  size(500,500);
  smooth();
  noLoop();
}

void draw()
{ 
  background(0,0,100);
  stroke(random(0,250),random(150,250),random(100,200));
  strokeWeight(11);
  translate(width/2,height);
  branch(0);
}

void branch(int branches) {
  if (branches < 12) {
    line(0,0,0,-height/10);
    {
      translate(0,-height/10);
      rotate(random(-0.1,0.1));

      if (random(1.0) < 0.6){ // branching  
        rotate(0.3);
        scale(0.7);
        pushMatrix();
        branch(branches+1);
        popMatrix();    
        rotate(-0.6);
        pushMatrix();
        branch(branches+1);   
        popMatrix();        
      }
      else { // continue  
        branch(branches);
      }
    }
  }
}
 



 
void keyPressed() {
 
  if (key=='s') {
    saveImage();
  }
  
  if (key=='g') {
    redraw();
  }
  
}



void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0, 0, width, height);
  imageSave.save(fileName);
}
 
String timeStamp() {
  String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
  return timestamp;
}




