

void setup() {  
size(600,400);
background(50);
fill(255,255,255);
noStroke();
}
void draw(){
    background(55);

    fill(255,255,255);    
if(mouseX<49){
fill(255,0,0);
}
if(mouseX>549){
fill(255,0,0)
}
if(mouseY<49){
 fill(255,0,0);
 }
 if(mouseY>349){
  fill(255,0,0);
  }

rect(mouseX,mouseY,20,20);
}

