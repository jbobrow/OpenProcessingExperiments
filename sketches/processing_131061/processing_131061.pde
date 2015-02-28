

PImage myImage;
int img1PosX = 0;
int img1PosY = 0;

PVector v1, v2, v3, v4,position,acceleration,speed;
PVector [] vs;
void setup() {
  size(300, 300, P3D); 
  
  myImage = loadImage("stat.jpg");
  textureMode(NORMAL);
  /* loadFile will look in all the same places as loadImage does.
     this means you can find files that are in the data folder and the 
     sketch folder. you can also pass an absolute path, or a URL.
  */
  vs=new PVector[4];
  vs[0]=new PVector(100, 100);
  vs[1]=new PVector(100, 200);
  vs[2]=new PVector(200, 200);
  vs[3]=new PVector(200, 100);
}

void draw() {
  background(0);
  
  position=new PVector(0,0);
  acceleration=new PVector(0,0);
  speed=new PVector(0,0);
  //position.x=mouseX;
  //position.y=mouseY;
  for(int i=0;i<4;i++){
    if (mousePressed && dist(mouseX,mouseY, vs[i].x,vs[i].y)<10){
    vs[i].x=mouseX;
    vs[i].y=mouseY;
    }
  }
  beginShape(); 
  
  
  texture (myImage);
     vertex(position.x +vs[0].x, position.y+vs[0].y, 0, 0); //vertex(v1.x, v1.y, 0, 0); etc
     vertex(position.x +vs[1].x, position.y+vs[1].y, 0, 1);
     vertex(position.x +vs[2].x, position.y+vs[2].y, 1, 1);
     vertex(position.x +vs[3].x, position.y+vs[3].y, 1, 0);
  endShape(CLOSE);
   
  println(vs[0].y);
}
void mousePressed(){

if (dist(mouseX,mouseY, vs[0].x,vs[0].y)<10){
  
  /*mouseX > vs[0].x-10 && mouseX < vs[0].x+10
    && mouseY > vs[0].y -10 && mouseY < vs[0].y+10)
  */
  
    position.x=mouseX;
    position.y=mouseY;
    {
    
    }
  }

}




