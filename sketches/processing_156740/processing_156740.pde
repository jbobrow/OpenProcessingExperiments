
float circleW;
float circleH;
float circleW2;
float circleH2;
float size;

void setup(){
  size(600,600);
  background(0);
}

void draw(){
  background(0);
  fill(255,0,0);
  for(int i = 0; i < 6; i++){
    ellipse(25+(i*50), 25+(i*50), 50, 50);
    ellipse(25+(i*50), (height-25)-(i*50), 50, 50);
    ellipse((width-25)-(i*50), (height-25)-(i*50), 50, 50);
    ellipse((width-25)-(i*50), 25+(i*50), 50, 50);
    setSize();
    mouseChange();
  }


  
}

void mouseChange(){
  if(mousePressed){
    background(0);
    fill(255-(size/2),0,0);
    println("click is working");
    for(int i = 0; i<6; i++){
      setCoords(i,i);
      ellipse(circleW, circleH, size+50, size+50);
      ellipse(circleW, circleH2, size+50, size+50);
      ellipse(circleW2, circleH, size+50, size+50);
      ellipse(circleW2, circleH2, size+50, size+50);
    }
  }
}

void setCoords(int x, int y){
  circleW = 25 +(x*50);
  circleH = 25+(y*50);
  circleW2 = (width-25)-(x*50);
  circleH2 = (height-25)-(y*50);
}

void setSize(){
  size = dist(mouseX, mouseY, width/2, height/2);
}
