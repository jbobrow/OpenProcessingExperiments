


float r=0;
float x1=0;
float x2=0;
float x3=0;
float x4=0;
PImage PlasticBeach;
PImage LightGrenades;
PImage Blink_182;
PImage Tool;







void setup(){
 
 size(800,800); 
  
  LightGrenades = loadImage("LightGrenades.jpg");
  Blink_182 = loadImage("Blink_182.jpg");
  Tool = loadImage("Tool.jpg");
  PlasticBeach = loadImage("PlasticBeach.jpg");
  
  
  image(LightGrenades,0,0,400,400);
  image(PlasticBeach,400,0,400,400);
  image(Tool,0,400,400,400);
  image(Blink_182,400,400,400,400);
  
}


void draw(){
  
translate(width/2,height/2);

if (r<2500){
  pushMatrix();
    rotate(radians(r));
    image(LightGrenades,x1-50,-50,100,100);
   popMatrix();
   pushMatrix();
    rotate(radians(-r));
    image(PlasticBeach,x2-50,-50,100,100);
   popMatrix();
x2=x2+1;
x1=x1+1;
}

//if (r>2500){
//  if(r<5000){
//rotate(radians(-r));
//image(PlasticBeach,x2-50,-50,100,100);
//x2=x2+1;
//}
//}

if (r>2500){
  if(r<5000){
   pushMatrix();
    rotate(radians(r));
    image(Tool,x3-50,-50,100,100);
   popMatrix();
   
    pushMatrix();
      rotate(radians(-r));
      image(Blink_182,x4-50,-50,100,100);
    popMatrix();
x4=x4+1;
x3=x3+1;
}
}

//if (r>7500){
//  if(r<10000){
//rotate(radians(-r));
//image(Blink_182,x4-50,-50,100,100);
//x4=x4+1;
//}
//}

if(r>5000){
  r=0;
  x1=0;
  x2=0;
  x3=0;
  x4=0;
}


  r=r+4;
  

  
  println(r);
}

