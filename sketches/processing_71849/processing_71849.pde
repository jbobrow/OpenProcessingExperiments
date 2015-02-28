
//Devon Kelley HW #4

void setup(){
size(600,600);
smooth();
background(255);
}

void draw(){
  for(int x=0; x<600; x+=15){
    for(int y=0; y<600; y+=15){
     if(mouseX>x && mouseX<x+10 && mouseY>y && mouseY<y+10){
       fill(0,70,255);
     }else if(mousePressed){
       fill(0,65,10);
     }else{
       fill(180);
     }
    rect(x,y,10,10);
    }
  }
}

