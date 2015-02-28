

PImage myPic;

void setup(){
  size(400,400);
  myPic = loadImage("99a31dad105a973e4a36d621.jpg");
  noStroke();
  smooth();
}

  int cellSize = 15;

void draw(){

}

void mouseDragged() {
  fill(255,50);
  rect(0,0,width,height);
  cellSize=int(random(10,50));
  
  for(int y=0; y <= width; y+=cellSize){
    for(int x=0; x <= height; x+=cellSize){
      int a = floor(random(0,myPic.width));    
      int b = floor(random(0,myPic.height));   
      
      color myColor = myPic.get(a,b);        
      stroke(myColor);  
      strokeWeight(random(1,cellSize/3));      
      line(x+cellSize,y,x,y+cellSize);
      line(x,y,x+cellSize,y+cellSize);
    }
  }
 
}






