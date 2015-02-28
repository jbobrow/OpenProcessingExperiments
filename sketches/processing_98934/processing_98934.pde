
float x = 100;
    float y = 50;
    float w = 150;
    float h = 80;
    void setup(){
     size(500,500);
     background(255);
     stroke(0);
     noFill();
    }

    void draw(){
     background(255);
     rect(x,y,w,h);
     fill(255);
     if(mousePressed){
      if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
       println("The mouse is pressed and over the button");
       fill(0);
       //do stuff 
      }
     } 
    }
