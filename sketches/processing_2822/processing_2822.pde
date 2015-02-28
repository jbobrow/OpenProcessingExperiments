
//import processing.opengl.*;

int i;

void setup(){
  size(400,400,P3D);
  //smooth();
  frameRate(80);

}

void draw(){
  float a = random(20);
  float b = random(140);
  float c = random(260);
  background(a, b, c, 40);
  //filter(INVERT);
   //filter(BLUR, 0.60); 
  if(mousePressed){
    bucle();  
  }else{
    bucle_2();
  }
   saveFrame();
}

void bucle(){
  //rect(random(290),random(180),random(400),random(350));
      for(i=0; i<30; i++){ 
      filter(INVERT);
      filter(BLUR, 0.60); 
      quad(random(390),random(180),random(110),random(400),random(400),random(350),random(400),random(250));
      }
}


void bucle_2(){
      for(i=0; i<15; i++){ 
      filter(INVERT);
      filter(BLUR, 0.60); 
      rect(random(290),random(180),random(400),random(350));
      //quad(random(390),random(180),random(110),random(400),random(400),random(350),random(400),random(250));
      }
}

