
int x ,y;

  void setup(){
    size(500,500);
    background(0);
    smooth();
    noStroke();   
    fill(0);
    x = 0;
    y = 0;
    
  }

  void draw() {
    //background(255);
    fill(255);
    ellipse(mouseX,mouseY,40,40);
  }
  void keyPressed(){  
   switch(key){
    case 'd':
      background(0);
      strokeWeight(0);
      stroke(255);
     
      break;
      
    case 'b':
    background(random(255),random(255),random(255));
          break;
    case 's':
   strokeWeight(50);
    stroke(random(255),random(255),random(255),100);
        break;
    
   }  
  }
  
  


