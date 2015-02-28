
//Homework.6.2

PImage pic;

void setup(){
  size(300,300);
  background(0);
  pic = loadImage("img012_2_2.jpg");

  smooth();
}

int shapes = 25;

void draw(){
  for(int y=0; y <= width; y+=shapes){
    for(int x=0; x <= height; x+=shapes){
      
      int a = int(random(0,pic.width));    
      int b = int(random(0,pic.height));   
      
      color c = pic.get(a,b);   
      strokeWeight(random(5));     
      stroke(c,125);      //gets random color from image
      noFill();        
      ellipse(x,y,50,50);//sets up circles
      strokeWeight(0);
      rect(x,y,50,50);   //creates grid through the composition
    }
  }
  noLoop();
}






