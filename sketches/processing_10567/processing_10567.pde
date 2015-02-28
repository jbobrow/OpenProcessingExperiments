
import processing.opengl.*;
//import processing.video.*;
import peasy.*;
PeasyCam cam;

//Movie filme;
//MovieMaker mm;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

int count=10;


import processing.opengl.*;


void setup() {
  size(500,500,P3D);
   hint(ENABLE_OPENGL_4X_SMOOTH);
  background(0);
  lights();
noStroke();
frameRate(60);

  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(500);
//mm = new MovieMaker(this, width, height, "drawing.mov", 10, MovieMaker.JPEG, MovieMaker.HIGH);

minim = new Minim(this);
   player = minim.loadFile("1.mp3", 512);
  // play the file
  player.play();
  
       lightSpecular(230, 230, 230); 
  directionalLight(200, 200, 200, 0.5, 0.5, -1); 
  specular(color(200)); 
  shininess(5.0); 
}

void draw() {
  background(0);
  lights();
  translate(-width/10,-height/10,20);
  //rotateY(frameCount*0.05/PI);
    //rotateZ(frameCount*0.05/PI);
  
  

 
  for(int i=1;i<count;i=i+1) {
    for(int j=1;j<count;j=j+1) {
      
   
    for(int k = 0; k < player.bufferSize() - 1;  k=k+30){
pushMatrix();
colorMode(HSB,250,250,250,250);
  fill(14*i*player.left.get(i)*30,14*j,14*k,100);
  translate(8*i,8*j,player.left.get(k+1)*50);

//println(in.left.get(k+1)*1200);
sphereDetail(2);
  sphere(5+player.left.get(i)*20);
   //box(5+in.left.get(i)*500);
  popMatrix();

//println(player.left.get(k));
  

    }
}
}
// mm.addFrame();
} 


void keyPressed() {
  if(key=='ü'){
  count=count+1;
  }
  if(key=='ä'){
    count=count-1;
  }
  if(key=='1') {
    count=5;
  }
   if(key=='2') {
    count=10;
  }
    if (key == 's'){
//   mm.finish();
  }

}




