
  class Forms{
  float x;
  float y;
  float z;
  float numForms;
  float roty1;
  float roty2;
  float roty3;
  boolean rotZ = false;
  boolean rotX = false;
  boolean rotY = false;
  
  Forms(){
    numForms = 10;
    roty1=500;
    roty2=1000;
    roty3=5000;
    x=1;
    y=1;
    z=1;
  }
  
  
  void display(){
 
   rotateX( mouseY / 100.0);  
   rotateZ( mouseX / 100.0);
    

 perspective(PI/10.0, float(width)/float(height), 1, 1000);


 for(int i=0; i<numForms; i++) {  //Main Loop, everything will happen inside(Shapes and rotations)
                                  //Also this variable(numForms) will later, allow us to creat
                                  //more forms
 rotateY(frameCount*PI/1500);  
 rotateZ(frameCount*PI/2500);   

//----------------------------- 

//Boolean of Key Rotations - True or False Rot X/Y/Z to combine with keys.
if (rotZ == true) {
 rotateZ(frameCount*PI/8000);  
}

if (rotX == true) {
 rotateX(frameCount*PI/5000);  
}

if (rotY == true) {
 rotateY(frameCount*PI/2000);  
}
//-----------------------------

 for (int x = -2; x < 2; x++) {  //For loop inside loop, allow a 
                                 //sequence of repetitions                                
   for (int y = -2; y < 2; y++) {  

     for (int z = -2; z < 2; z++) {  

 pushMatrix();
 rotateY(frameCount*PI/roty3); 
 translate(450*x, 300*y, 250*z);  
 box(10, 10, 40);  
 popMatrix();  

 pushMatrix();
 rotateY(frameCount*PI/roty1);  
 translate(250*x, 300*y, 75*z);  
 box(50, 10, 10);
 popMatrix();  

 pushMatrix();
 rotateY(frameCount*PI/roty2); 
 translate(500*x, 20*y, 20*z);  
  box(25, 25, 10);  
 popMatrix();   

 pushMatrix();  
 rotateY(frameCount*PI/roty1);  
 translate(180*x, 500*y, 300*z);  
 box(60, 35, 20);   
 popMatrix();
 
 pushMatrix();  
 rotateY(frameCount*PI/roty2);  
 translate(350*x, 650*y, 50*z);  
 box(10,10,10);  
 popMatrix();

 pushMatrix();  
 rotateY(frameCount*PI/roty3);  
 translate(500*x, 800*y, 300*z);  
 box(5,5,5);  
 popMatrix();
      }  
     }  
    }  
   } 
  }
  
   void setLight() {
   //http://processing.org/learning/3d/lights2.html 
   //Great Example to how to work with directional light
    directionalLight(0, 201, 245,  2, 2, 0);
  }
  
//apply-able changes-------------------------------------------------
    
    void rotate1(){
    //rotZ = true;
    rotZ =! rotZ;   
  }
  void rotate2(){
    //rotX = true;
    rotX =! rotX;  
  }
  void rotate3(){
    //rotY = true;
    rotY =! rotY;
  }
  
  void Stroke(){
  noFill();
  stroke(62,216,234); 
  }
 
  void fillLight(){
  fill(255);
  stroke(0);
   }

  void addForms(){
  numForms++;
  }

  void cutForms(){
  numForms--;
  }
  void rotLess(){
  roty1--;
  roty2--;
  roty3--;
  }

  void rotPlus(){
  roty1++;
  roty2++;
  roty3++;
  }
}


