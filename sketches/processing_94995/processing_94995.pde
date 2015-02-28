
int[] x = new int[100];
int[] y = new int[100];
int[] z = new int [100];
float noiseScale=0.02*-PI;


float positionX=0;
float positionY=0;
float speed=0;
float xoff=0.0;


float a;

void setup() {
  size (900,900,P3D);
  background(0);
  noFill();
    stroke(204,10,speed);
  //stroke(255);
  strokeWeight(2);
  frameRate(1);
  
  
  

  for(int i =0;i< 100; i++){
    x[i]= int(random(-350,350));
    y[i]= int(random(-350,350));
    z[i]= int(random(-350,350));
    
  
    
    positionX = width/2;
    positionY= height/2;
    
  }
  }

  
  
  void draw(){
    
    
  frameRate(19);
 
 //lights();
  //background(random(255));
  background(0);
   // stroke(204,10,speed);
  
  //for(int x=0; x < width; x++) {
   // float noiseVal = noise((mouseX+x)*noiseScale, 
                          //  mouseY*noiseScale);
  //  stroke(noiseVal*255);
   // box(x,noiseVal*180,  height);
    
 // }
  
  
  
  
   pointLight(51,102,126,0,-1,0);
  
  for (int i=0; i<=1000;i++){
  camera(a, height/2, (height/2) / tan(PI/6), width/2, height/2, 0,a, 1, a);
   
  translate(width/2,height/2,-100);
  box(100*i);
  rotateX(frameCount/-PI+150);
 // camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  box(300);
   translate(width/2,height/2,-100);
  box(400*i);
  rotateX(frameCount/PI-i);
 // camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
 // box(200+i*-PI);
  //}
  
 // for (int i=0; i<=100;i++){
  camera(a, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, a, 1, a);
    

  translate(width/2,height/2);
  rotateY(frameCount/100.0);
 // camera(100, height/9, (height/9) / tan(PI/9), width/9, height/9, 0, 0, 1, 0);


  box(300);
  
 
  
  box (100);
  rotate(frameCount/50.0);
  box(200);
   rotate(frameCount/150.0);
  box(75);
  rotate(frameCount/350.0);
  box(50);
   rotate(frameCount);
  box( 25);
  }
  //camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
box (150);

  rotate(frameCount/20.0);
  camera(mouseX, height/9*a, (height/9) / tan(PI/9), width/9*a, height/9, a, a, 1, a);
  box(250);
   rotate(frameCount/75.0);
  box(100);
  rotate(frameCount/100.0);
  box(35);
   rotate(frameCount);
  box( 10);
 a++;
  //}
  for(int i =0;i< 100; i++){
//translate(width/7-80,height/7-70);
  //rotateY(frameCount/100.0);
  
camera(mouseX, height/9, (height/9) / tan(PI/9), width/9, height/9, 0, 0, 1, 0);

    stroke(255);
 strokeWeight(1);
 //directionalLight(51,102,126,0,-1,0);
  translate(width/7-80,height/7-70);
  rotateY(frameCount/100.0);
//

//camera(mouseX, height/9, (height/9) / tan(PI/9), width/9, height/9, 0, 0, 1, 0);


  }
  a++;
  
  
  
  
   for (int i=0; i<=100;i++){
 // camera(a, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, a, 1, a);
   
 // translate(width/2,height/2,-100);
  box(100*i);

       
  //rotateX(frameCount/-PI+150);
 // camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
 
  box(300*positionX);
  // translate(width/2,height/2,-100);
  box(400*i);
 // rotateX(frameCount/PI-i);
 // camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
 // box(200+i*-PI);
  a++;
  noFill();
 stroke(255);
 strokeWeight(1);
 // translate(width/7-80,height/7-70);
 // rotateY(frameCount/100.0);
//

//camera(mouseX, height/9, (height/9) / tan(PI/9), width/9, height/9, 0, 0, 1, 0);
 // xoff= xoff + 0.1;
  //float n = noise(xoff) * width*height*-PI;
  
  //for (int x=0; x < width; x++) {
  //float noiseVal = noise((mouseX+x)*noiseScale, 
                          //  mouseY*noiseScale);
   // stroke(noiseVal*random(255)*PI);
//box(positionX+noiseVal*80,xoff*PI/5,positionY +xoff*-PI);
 // }
   }
  positionX+= random(-1,2);
  positionY += random(-1,2);
  speed += random(-1,1);
  
  noiseDetail(23,0.5);
    

 
  }




