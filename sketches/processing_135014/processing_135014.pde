
int dist = 50, counter = 0;

void setup(){
  size(500,500);
  noCursor();
}

void draw(){
  background(0);
  triforce(0,0);
}

void triforce(int x,int y){
  if(mousePressed==true){
    strokeWeight(10);
    stroke(255,239,144);
    fill(252,224,61);
  }
  else{
    noStroke();
    fill(188,178,120);
  }
  pushMatrix();
  translate(mouseX,mouseY-50);
  rotate(radians(counter));
  triangle(x-dist,y-dist,x,y-3*dist,x+dist,y-dist);
  popMatrix();
  pushMatrix();
  translate(mouseX-50,mouseY+50);
  rotate(radians(counter));
  triangle(x-2*dist,y+dist,x-dist,y-dist,x,y+dist);
  popMatrix();
  pushMatrix();
  translate(mouseX+50,mouseY+50);
  rotate(radians(counter));
  triangle(x,y+dist,x+dist,y-dist,x+2*dist,y+dist);
  popMatrix();
  counter++;
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      dist++;
    }
    else if(keyCode==DOWN){
      dist--;
    }
  }
}


