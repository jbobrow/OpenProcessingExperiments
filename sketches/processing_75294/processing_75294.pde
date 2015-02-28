
void setup(){
size(800,800);
smooth();
background(90,100,200);

}

void draw(){
  for(int x = 0; x < 100; x++) {
    for(int y = 0; y < 100; y++) {
      if(mouseX > x*20 && mouseX < x*20+20 && mouseY > y*20 && mouseY < y*20+20){
        rect(x*20, y*20, 20,20);
        fill(0,0,0);
    } else {
      noFill();
    }
    }
  }
     // if(mousePressed){
        //  fill(255,0,0);
      //    ellipse (mouseX,mouseY,random(100), random(100));
     // }else{
     //  fill(255,0,0);
      //    ellipse (mouseX,mouseY,random(100));
      
      }
