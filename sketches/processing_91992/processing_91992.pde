
float blink=0.5;


float step=2;
float g=1;




float d=0.1;
float eSize=1;



void setup(){
 size(400,400,P3D);

}

void draw(){
  background(140);
  smooth();




  //fill(207, 100);

  //noFill();
    
    
  translate(width/2,height/2);
  
  //rotateY(radians(30));
  //rotateX(radians(-20));
   
  
  rotateY(radians(((mouseX/(float)width)*180)-90));
  rotateX(radians(((mouseY/(float)height)*180)-90));
  
  shininess(1.0);

  lights();
  directionalLight(20, 102, 126, -2, 0,0);
  spotLight(21, 102, 102, 80, 20, 40, -1, 0, 0, PI/4, 4);

  
  pushMatrix();
  translate(0,-20,0);
  scale(1.0,1.2,.6);
  //body
    fill(50,255);


  box(50);
  popMatrix();
  


  pushMatrix();
  translate(0,-68,0);

  scale(.8,.6,0.5);
  //rotateY(radians(frameCount));
  //head
  
  fill(70,255);

  box(50);
  scale(.2,.6,0.6);
  translate(-150,-5,0);

  //ear
  fill(100,255);

  box(40);
 
 translate(300,0,0);

  box(40);
  
  
  
      popMatrix();

    pushMatrix();

  translate(0, -70, 0);   


  eye(11);
  eye(-10);
  
    fill(110,255);

  arm(15);
    
  armL(-50);

  
  popMatrix();
 

  pushMatrix();
  
  
  leg(20);
  legL(-8);
  

  popMatrix();


}



void eye(float x){
 
   float a = random (1,10);

  if (a%5<0.1){
    
    eSize-=d;
    
    if (eSize>=1 )
    {
      d+=0.08;
    }
    if (eSize<=0.2)
    {
      d-=0.2;
    }
  }
  
  pushMatrix();
    //fill(10);
   
    //rotateZ(radians(ba)); 
    scale(1, eSize, 1.2);   

    translate(x, 0, 12);   
    box(4);
  popMatrix();
}




void arm(float x){

 
 //arm
 pushMatrix();
  translate(x,25, 0);

    translate(18, 3, 0);
    
    if(mousePressed==false){
    rotateX(radians(-step));
    }
    translate(0, 25, 0);
    
 scale(.2,1.4,0.4);

 box(40);
 
popMatrix();

}


void armL(float x){

 
 //arm
 pushMatrix();
  translate(x,25, 0);
    
    translate(18, 3, 0);
    if(mousePressed==false){

    rotateX(radians(step));
    }
    translate(0, 25, 0);
    
 scale(.2,1.4,0.4);


 box(40);
 
popMatrix();

}


void leg(float f){

 
 //leg
 pushMatrix();
  translate(f,25, 0);

    step+=g;
    
    if (step>=2.5){
      g-=0.07;
    }
    if (step<0){
      g+=0.07;
    }
  
    translate(-5, -9, 0);
    if(mousePressed==false){

    rotateX(radians(step));
    }
    translate(0, 25, 0);
    
 scale(.4,1.4,0.3);

 box(40);
  
  
  translate(0, 23, 8);
  scale(1.4,0.15,1.7);
  box(40);

 
popMatrix();

}



void legL(float h){

 
 //leg
 pushMatrix();
  translate(h,25, 0);

    step+=g;
    
    if (step>=2.5){
      h-=0.07;
    }
    if (step<0){
      h+=0.07;
    }
    //rotateY(radians(6));
   // translate(45,-20,0);

    translate(-5, -9, 0);
    if(mousePressed==false){

    rotateX(radians(-step));
    }
    translate(0, 25, 0);
    
    
    
 scale(.4,1.4,0.3);

 box(40);
 
 
 translate(0, 23, 8);
  scale(1.4,0.15,1.7);
  

 

  box(40);
 
 
popMatrix();

}



