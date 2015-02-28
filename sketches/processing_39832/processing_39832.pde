
  void setup(){
    size(480,480);
    smooth();
      }
    void draw(){
      
      if(mousePressed){
      strokeWeight(10);
      stroke(0);
      line(mouseX,mouseY,mouseX,mouseY);
      }
      else{
      background(255);
      strokeWeight(1);
      stroke(150);
      line(mouseX,mouseY,mouseY/2,mouseX);
      strokeWeight(5);
      line(mouseX,mouseY,400,400);
      
      strokeWeight(2);
      stroke(255,60,80);
      line(mouseX,mouseY,mouseY*2,mouseX/2);
      strokeWeight(8);
      line(mouseX,mouseY,50,50);
      
      strokeWeight(2);
      stroke(150,180,80);
      line(mouseX,mouseY,mouseX/3,mouseX/5);
      strokeWeight(7);
      line(mouseX,mouseY,10,480);

    }
  }

