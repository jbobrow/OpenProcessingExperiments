
PImage img;
int[] brightX;
int[] brightY;

void setup(){
  size(400,400,P3D);
  
  img = loadImage("Ass 5-2-2 image1.jpg");
  img.loadPixels();
  
  brightX = new int[img.width];
  brightY = new int[img.height];
  
  for(int y=0; y<img.height;y++){
    for(int x=0; x<img.width; x++){
       color col = img.get(x,y);
       brightX[x]= floor(random(brightness(col)));
       brightY[y]= floor(random(brightness(col)));
    }
  }
} 
 

void draw(){
  background(0);
  lights();
  
  camera(width/2, 0, 200, width/2, height, -200,0,1,0);
  translate(width/2,height/2,-200);
  rotateY(frameCount* PI/2* 0.005);
  
  for(int x=0; x < img.width; x++){ 
    for(int y=0; y< img.height; y++){
      color col = img.get(x,y);
      stroke(col);
      point(x,y,-brightX[x]+brightY[y]);
    }
  }
}

