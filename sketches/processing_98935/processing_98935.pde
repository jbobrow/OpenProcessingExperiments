
float x = 0;
float y = 449;
float w = 124.7;
float h = 50;
float x2 = x+w;
float x3 = x2+w;
float x4 = x3+w;
    void setup(){
     size(500,500);
     background(255);
     stroke(0);
     noFill();
    }

    void draw(){
     background(255);
     rect(x,y,w,h);
     rect(x2,y,w,h);
     rect(x3,y,w,h);
     rect(x4,y,w,h);
     fill(255);
     if(mousePressed){
      if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
       fill(0);
      }
      if(mouseX>x2 && mouseX <x2+w && mouseY>y && mouseY <y+h){
       print "button 2 pressed";
      }
      if(mouseX>x3 && mouseX <x3+w && mouseY>y && mouseY <y+h){
       print "button 3 pressed";
      }
      if(mouseX>x4 && mouseX <x4+w && mouseY>y && mouseY <y+h){
       print "button 4 pressed";
      }
     } 
    }
