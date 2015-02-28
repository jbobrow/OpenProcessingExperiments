
import processing.pdf.*;
boolean savePDF= false;
boolean endPDF = false;

int x;
int y;

void setup(){
  size(600,600);
}

void draw(){
  if(savePDF== true){
    beginRecord (PDF, "pattern" + frameCount + ".pdf");
    savePDF = false;
  }
  background(random(0,250));
      x=0;
  y=0;
  while(y < 600){ 
    x=0;
    while(x < 600){
      fill(255);
     ellipse(x,y,45,45);
     ellipse(x,y,45,45);
      x=x+50;
    }
    y=y+30;
  } 
      x=0;
  y=0;
  while(y < 600){ 
    x=0;
    while(x < 600){
      fill(0);
     ellipse(x,y,40,40);
     ellipse(x,y,40,40);
      x=x+50;
    }
    y=y+30;
  } 
    x=0;
  y=0;
  while(y < 600){ 
    x=0;
    while(x < 600){
      fill(255);
     ellipse(x,y,35,35);
     ellipse(x,y,35,35);
      x=x+50;
    }
    y=y+30;
  } 
  x=0;
  y=0;
  while(y < 600){ 
    x=0;
    while(x < 600){
      fill(0);
     ellipse(x,y,30,30);
     ellipse(x,y,30,30);
      x=x+50;
    }
    y=y+30;
  } 
  x=0;
  y=0;
  while(y < 600){ 
    x=0;
    while(x < 600){
      fill(random(0,255),random(0,255),random(0,255));
      ellipse(x,y,random(10,25),25);
      ellipse(x,y,25,random(10,25));
      x=x+50;
    }
    y=y+30;
  } 
if (endPDF== true) {
 endRecord ();
println("done");} 
}
void keyPressed() {
 println(key);
  if (key == 's'){
  savePDF = true;
  }
  
  if (key== 'x'){
   endPDF = true;
  }
}


