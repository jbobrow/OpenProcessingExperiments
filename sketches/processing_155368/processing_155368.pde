
float w = 1;
float w2 = 100;

void setup(){
  size(500, 1000);
  smooth();
  background(0);
  
}

void draw(){ 
    noStroke();

     fill(255);
    ellipse(mouseX,mouseY, w, w);
  }
  
  void mouseDragged(){
   w++;
   w2--;
  }
  
  void mouseReleased(){
    w=1;
    w2= 100;
  }
  
  void keyPressed(){
    if(key == 'n'){
      background(0);
    }
  }


