

//    
//    23 may 2011 
//    stephen monslow

//import processing.opengl.*;
float scaler;



float index;

void setup() {

  size(780, 300, P3D); 
  smooth(); 
  frameRate(30);

}


void draw() {
  
  



scaler = index/50;
if (scaler > 3.11) {
  scaler= 0;
  index = 0;
  
}

println(scaler);

  background(0,0,0,255);

 translate(40+sin(index*index/50)*PI*4,40+sin(index*index/50)*PI*4);
   stroke(255,255,random(255),random(255));
  
      
   text("CREATIVE CODE WORKSHOP 11",index/width,index/height);


  translate(width/2, height/2);

  rotateX(index*0.1);
  rotateY(index*0.2);
  rotateZ(index*0.4);
  for (int i = 0; i < width;i+=200) {
    for (int j = 0; j <width;j+=40) {
      int x = i * 40;
      float y = i * 4;
      stroke(255, 255, 255, 50);

      //draw our moving line based on the sin() of wave
      //multiply the product of sin() by how many pixels we want it to sway
      line(x, -j*sin(index*0.001)*(index*-1/100), (index/100), x+j, -j*sin(index*y)*(index/100), -j);
      rotateX(sin(index*0.001));
     
      line(x, +j*sin(index*0.001)*(index*-1/100), (index/100), x+x, +j*sin(index*-y)*(index/100), +j);
      rotateY(sin(index*0.001));
      line(x, -j*sin(index*0.001)*(index*-1/100), (index/100), x+j, -j*sin(index*y)*(index/50), -j);
      rotateZ(sin(index*0.001));
      line(x, +j*sin(index*0.001)*(index*-1/100), (index/200), x+x, +j*sin(index*-y)*(index/30), +j);
      line(x, -j*sin(index*0.001)*(index*-1/100), (index/100), x+j, -j*sin(index*y)*(index/100), -j);
      rotateX(sin(index*0.001));
    
      line(x, +j*sin(index*0.001)*(index*-1/100), (index/200), x+x, +j*sin(index*-y)*(index/10), +j);
      rotateY(sin(index*0.001));
      line(x, -j*sin(index*0.001)*(index*-1/100), (index/100), x+j, -j*sin(index*y)*(index/10), -j);
      rotateZ(sin(index*0.01));
      line(x, +j*sin(index*0.01)*(index*-1/100), (index/100), x+x, +j*sin(index*-y)*(index/10), +j);
      line(x, -j*sin(index*0.01)*(index*-1/100), (index/100), x+j, -j*sin(index*y)*(index/10), -j);
      rotateX(sin(index*0.001));
      line(x, +j*sin(index*0.001)*(index*-1/100), (index/100), x+x, +j*sin(index*-y)*(index/10), +j);
      rotateY(sin(index*0.01));
      line(x, -j*sin(index*0.001)*(index*-1/100), (index/100), x+j, -j*sin(index*y)*(index/100), -j);
      rotateZ(sin(index*0.001));
//      shearX(sin(index*0.001));
shearY(sin(index*0.003));
      line(x, +j*sin(index*0.01)*(index*-1/100), (index/100), x+x, +j*sin(index*-y)*(index/10), +j);
      line(x, -j*sin(index*0.01)*(index*-1/100), (index/100), x+j, -j*sin(index*y)*(index/10), -j);
      rotateX(sin(index*0.01));
      line(x, +j*sin(index*0.01)*(index*-1/100), (index/100), x+x, +j*sin(index*-y)*(index/100), +j);
      rotateY(sin(index*0.001));
      line(x, -j*sin(index*0.01)*(index*-1/100), (index/100), x+j, -j*sin(index*y)*(index/100), -j);
      rotateZ(sin(index*0.001));
      shearX(sin(index*0.001));
      shearY(sin(index*0.09));
 
      line(x, +j*sin(index*0.01)*(index*-1/100), (index/100), x+x, +j*sin(index*-y)*(index/100), +j);
   
  
 
  }
  }
  index+=0.05;
   
}


