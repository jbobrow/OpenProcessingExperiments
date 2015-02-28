
float rad = radians (90) ;
float a = 0;
float r = -1;
float m = 2;
float x = 5;

void setup(){
   frameRate (20);
  size(400,400,P3D);
  noStroke();
  
   ambientLight(100, 100, 100);
  lightSpecular(204, 204, 204);
  directionalLight(100, 100, 100, 0, 0, -1);
}

void draw(){
  //head
  // directionalLight(255, 102, 126,100,100, 100);
// directionalLight(102, 102, 102, 0, 0, -1);

  background(100,204,255);
 
  fill(200,200,150);
  rad++;
  translate(200,150);
  //ambientLight(225,225,255,200,0,0,400,-200,0,180);
 //rotateX(radians(((mouseX/(float)width)*180)-90));
  //rotateY(90);
  rotateY(radians(((mouseX/(float)width)*360)-90));
  box(100);
  //rotateY(radians(rad));
  

 
  //hat
  pushMatrix();
 translate(-10,-70,0);
 fill(random(00),random(100),random(100));
 rotateY(radians(rad));
 box(30,30,10);
 popMatrix();
 
 //right eye
 pushMatrix();
  translate(-50,-20,-26);
 
  //pointLight(255,255,255,-50,-20,-26);
  rotateZ(random(frameRate));
  fill(100,200,50);
  if (mousePressed==true) {
      fill(200, 200, 150);
    }
  box(5);
  popMatrix();
  
  //left eye
 pushMatrix();
  translate(-50,-20,26);
  //pointLight(255,255,255,-50,-20,26)
  rotateZ(random(frameRate));
  box(5);
  popMatrix();
 
  //mouth
  fill(150,50,10);
 pushMatrix();
 translate(-50,30,5);
  rotateY(radians(10));
  box(5,5,50);
 popMatrix();
 
 
 //body
 pushMatrix();
 translate(0,100,0);

 fill(100,120,80);
 //rotateY (radians(10));
  box(70,90,100);
 popMatrix();
 
 //second body
 pushMatrix();
 translate(0,155,0);
 fill(10,20,80);
 //rotateY(radians(10));
  box(70,20,80);
 popMatrix();
 
 //neck
  pushMatrix();
 translate(0,70);
  //rotateY(radians(20));
  box(30,80,10);
 popMatrix();
 
 //nose
  pushMatrix();
 translate(-50,-5,0);
 rotateY(radians(10));
 box(20,x,10);
 if (x <= 30){
  x++;
  }else if (x >30){
  x= r;
  }
  
 
 popMatrix();
 
 //right foot
  pushMatrix();
 translate(0,180,-20);
 fill(200,120,50);
  rotateZ(sin(frameCount/2));
  box(20,70,20);
 popMatrix();
 
 //left foot
  pushMatrix();
 translate(0,180,20);
  rotateZ(sin(frameCount/4));
  box(20,70,20);
 popMatrix();
 

 

 //right hand
  pushMatrix();
 translate(-20,90,-60);
   fill(230,100,100);
  rotateZ(-sin(frameCount/3));
  translate(0,15,0);
 
  box(10,60,20);
 popMatrix();
 
  //right low hand
  /*pushMatrix();
 translate(-20,120,-55);
  fill(230,200,100);
 // rotateZ(radians(10));  
  box(10,35,10);
 popMatrix();*/
 
 //left hand
  pushMatrix();
 translate(-20,70,60);
 
  fill(230,200,100);
  rotateZ(radians(90)); 
 rotateZ(-sin(frameCount/1));
 translate(0,15,0);


  box(10,60,20);
 popMatrix();
 
 //left ear
 pushMatrix();
 translate(0,5,55);
 
  fill(200,250,100);
  rotateZ(radians(90)); 
 translate(0,15,0);


  box(20,20,10);
 popMatrix();
 
 //right ear
 pushMatrix();
 translate(0,5,-55);
 
  fill(200,250,100);
  rotateZ(radians(90)); 
 translate(0,15,0);


  box(20,20,10);
 popMatrix();
 //left low hand
 /* pushMatrix();
 translate(0,120,60);
 fill(230,100,100);
  //rotateZ(radians(((mouseY/(float)width)*180)-90));
  box(10,35,10);
 popMatrix();*/
rotateY(radians(90));
translate(-149,80,40);
 text("Please give me A",100,0);
  
}
