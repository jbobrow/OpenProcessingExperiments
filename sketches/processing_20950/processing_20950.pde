
PImage myPic;
void setup(){
  size(400,400,P3D);
  myPic = loadImage("bc493bf425c7c790a50f5207.jpg");
  smooth();
  lights();
}

int cellSize = 20;

void draw(){
  background(100);
    camera(250, 250, mouseX+200 , width/2, height/2, 0, 0, 1, 0);  
    
  for(int x=0; x <= height; x+=cellSize){
    for(int y=0; y <= width; y+=cellSize){
      int a = floor(random(0,myPic.width));    
      int b = floor(random(0,myPic.height));
      int c = int(random(150));   
      color myColor = myPic.get(a,b);    
      pushMatrix();
      noStroke();
      fill(myColor,200);  
      translate(x, y, c/2);
      box(10,10,c);
      popMatrix();
  }
  }
}


