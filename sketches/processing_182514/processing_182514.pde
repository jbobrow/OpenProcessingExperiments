
size(500,600);
background(191,239,255);


int c=2*width/3;
int d=3*height/5;

//HEAD
pushMatrix();
translate(2*width/3, 3*height/5);
rotate(radians(-10));
   //1)
    int a=160;
    int b=100;
    noStroke(); fill(205,133,63);  
    ellipse(0,0,a,b);
   //2)
   fill(139,90,43);
   ellipse(-1,2,9*a/10,9*b/10);
popMatrix();
pushMatrix();
   //3(Face)
   translate(2*width/3, 3*height/5);
   fill(205,133,63);
   ellipse(2,-1,9*a/10,14*b/15);
    
   //eyes
    //left eye
      fill(94,38,18); ellipse(-30,-10,10,10);
    //right eye
      ellipse(30,-25,12,12);
popMatrix();
 
   //nose
pushMatrix();
   translate(c+12,d-10);
   rotate(radians(-5));
   fill(94,38,18,100); ellipse(0,0,10,-5);
popMatrix();  
    
   //mouth
pushMatrix(c,d);
   fill(160,30,10); triangle(c-3,d,c+25,d-5,c+5,d+20);
   //teeth
     fill(255,250,240);
     quad(c,d,c+8,d-1,c+8,d+8,c+2,d+10);
     quad(c+10,d-2,c+19,d-3,c+17,d+6,c+12,d+8);
 
    //hair
pushMatrix();
    translate(c,d);
    noFill();
    stroke(94,38,18); strokeWeight(1.5);
    curve(-43,-10, -15,-45, -30,-60, -100,0);
popMatrix();
 
//HANDS
  //left
    noStroke(); fill(205,133,63);
    ellipse(width/2,5*height/6,30,30);
  //right
    ellipse(6*width/7,4*height/5,25,25);
     
//FEET
  //left
    pushMatrix();
        translate(300,560)
        rotate(radians(-15));
        ellipse(0,0,50,35);
    popMatrix(); 
     
  //right
    pushMatrix();
       translate(370,560);
       rotate(radians(15));
       ellipse(0,0,45,30);
    popMatrix();
                                                   //MARVIE END   
popMatrix();

//Bubbles

for (int v=0; v<500; v=v+5)
    {
        float w = random(20,100);
        float x = random(100,255);
        float y = random(200,205);
        noStroke(); fill(0,x,y,100);
   float z = random(0,800);
      ellipse(v,z,w,w);
      fill(255,100);    
      ellipseMode(CORNER); ellipse(v+12,z+12,w/6,w/6);
   }
   
for (int v=0; v<500; v=v+100)
    {
        float w = random(20,100);
        float x = random(100,255);
        float y = random(200,205);
        noStroke(); fill(0,x,y,100);
   float z = random(0,800);
      ellipse(v,z,w,w);
   }


   
     
 
      


