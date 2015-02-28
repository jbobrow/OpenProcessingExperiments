
int val2=0;
boolean button = false;

void setup(){
  size(500,500);
  background(11,31,62);
  smooth();
}

void draw(){
  //white circle
  noStroke();
  fill(255);
  ellipse(250,250,10,10);
      
  //blu circle
  if(button){
    val2=val2+2;
    fill(23,82,175,100);
    ellipse(250,250,10+val2,10+val2);
  }
  
    if(val2 ==100 || val2<0){
    val2=0;
  }

 }
 void mousePressed(){
 if(mouseX > 245 && mouseX < 265 && mouseY > 245 && mouseY < 255){
     button= !button;
  }
 }
 

