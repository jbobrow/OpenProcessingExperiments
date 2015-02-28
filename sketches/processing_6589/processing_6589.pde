
public int mode =1;// 2 = OPENGL


import processing.opengl.*;


void setup(){
  if(mode ==2){
    size(300,300,OPENGL);
  }

  if (mode ==1){
    size(300,300,P3D);

  }
  smooth();

}


void draw(){



  background(1);



  button(mouseX,mouseY,0,25,14,14,14,0.05);

  button(mouseX-100,mouseY,0,45,7,7,7,1);

  button(mouseX,mouseY-100,0,75,7,7,7,0.5);

  button(mouseX+25,mouseY+25,0,180,7,7,7,0.5);



}


void button(float x,float y,float z, float rot,float l,float w,float d, float inc){

  translate(x,y,z);

  rotateZ(radians(rot));
  if (mode ==2){
    noStroke();
    fill(233,23,23);
  }

  if (mode ==1){

    noStroke();
  }

  for(float zz=0;zz<15;zz+=inc){
    if (mode ==2){
      stroke(255);
    }

    if (mode==1){
      fill(233,23,23); 
    }
    rotateX(radians(zz));
    if ( !mousePressed){
      box(l*3,w*3,d*3);
    }
    else
    {
      box((l/2)*3,w*3,d*3);
    }
  }
  translate(-x,-y,-z);

}






