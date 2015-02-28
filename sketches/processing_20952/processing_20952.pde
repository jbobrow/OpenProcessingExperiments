
PImage myPic;

void setup(){
  size(300,300,P3D);
  myPic = loadImage("nick.jpg");
  noStroke();
  smooth();
}

int cell = 10; 

void draw(){
  background(0);
  for(int y=cell; y <= 299; y+=cell){    
    for(int x=cell; x <= 299; x+=cell){
        float radius = cell * (brightness(myPic.pixels[x + (y * 300)]) / 255);
      stroke(radius,mouseX,mouseY);
      strokeWeight(radius);
      line(x,y,0,x,y,radius);
    }
  }
}
void mouseDragged(){
camera(0, mouseX, mouseY, width/2, height/2, 0, 0, 1, 0);
  

}







