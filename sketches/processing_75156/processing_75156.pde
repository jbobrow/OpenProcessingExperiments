
int r = 0;
int g = 0;
int b = 0;

void setup(){
  size(400, 400);
  background(255);
  strokeWeight(6);
  line(0, 20, 400, 20);
  line(0, 130, 400, 130);
  line(0, 320, 400, 320);
  line(50, 20, 50, 400);
  line(250, 0, 250, 400);
  line(250, 200, 400, 200);
  line(250, 200, 400, 200);
  line(320, 200, 320, 320);
  line(190, 320, 190, 400);
}

void draw(){
  strokeWeight(10);
  stroke(r, g, b);
  
  if(pmouseX >0 && mousePressed)
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  if(mouseX > 50 && mouseX <250 && mouseY >130 && mouseY <320){
    r = 255;
    g = 0;
    b = 0;
    } else if(mouseX >250 && mouseX <400 && mouseY >320 && mouseY <400){
      r = 0;
      g = 0;
      b= 255;
    }else if(mouseX >50 && mouseX <190 && mouseY >320 && mouseY <400){
      r = 0;
      g = 0;
      b = 0;
    }else if(mouseX >250 && mouseX <400 && mouseY >20 && mouseY <130){
      r = 255;
      g = 255;
      b = 0;
    }else{
     r = 255;
     g = 255;
     b = 255; 
    }   
}
