
float a;
void setup(){
 size(800,800,P3D);
smooth(); 
lights();
}

void draw(){
  
  pushMatrix();
  translate(400,400,0);
  rotateY(radians(frameCount*0.5));
  rotateX(radians(frameCount*0.5));
  rotateZ(radians(frameCount*0.5));
  background(0);
  
  pushMatrix();  
  for(int j=0; j<30;j++){
    rotateY(PI/30);  //rotationne le cercle pour creer un effet de sphere.
  for(int i=0;i<50;i++){
rotate(radians(frameCount*0.001));//a enlever pour sphere parfaite.

    stroke(map(i,0,55,0,255),0,map(j,0,55,0,255));//creer un cercle de point.
    strokeWeight(random(6));
    point(cos(i)*mouseX,0,sin(i)*mouseX);
    }
  }
  popMatrix();
  popMatrix();
 //////////////////////////////////////////sphere2//////////////////////// 
  pushMatrix();
    translate(400,400,0);
  rotateY(radians(-frameCount*0.7));
  rotateX(radians(-frameCount*0.5));
  rotateZ(radians(-frameCount*0.01));
   

  pushMatrix();  

   
  for(int i=0;i<300;i++){
 rotate(cos(frameCount*0.01)*PI/300);//enlever le cos et augmenter pour avoir une sphere parfaite.

    stroke(map(i,0,50,0,255),0,map(i,0,55,0,255),95);
    strokeWeight(random(6));
    
    point(cos(i)*100,0,sin(i)*100);
    }
  
  popMatrix();
  popMatrix();
}


