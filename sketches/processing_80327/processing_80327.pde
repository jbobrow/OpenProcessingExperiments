
void setup(){
   size(400,200);
   noStroke();
}
void draw(){
   int i = 0;
   fill(i);
 

  while(i<=390){
    fill(int(mouseX),int(#F7071C),int(mouseY));
    stroke(255);
    rect(i,0,mouseX,200);
    i = i + 10;
    if (mouseX >=390){
      int j = 0-mouseX;
      fill(random(255),random(255),random(255));
      rect(i-10-j,0,j,200);
    }
  }

}

