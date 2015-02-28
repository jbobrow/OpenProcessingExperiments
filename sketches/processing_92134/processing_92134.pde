
int x,y,alturax, alturay,corR1,corG1,corB1,corR2,corG2,corB2,corR3,corG3,corB3,corR4,corG4,corB4,corR5,corG5,corB5,corR6,corG6,corB6,corR7,corG7,corB7,angulo;



void setup(){
  
  alturax=500;
  alturay=500;
  
  //alturax=displayWidth;
  //alturay=displayHeight;

  
  x=0;
  y=0;
  
  corR1=int(random(255));
  corG1=int(random(255));
  corB1=int(random(255));
  
  corR2=int(random(255));
  corG2=int(random(255));
  corB2=int(random(255));
  
  corR3=int(random(255));
  corG3=int(random(255));
  corB3=int(random(255));
  
  corR4=int(random(255));
  corG4=int(random(255));
  corB4=int(random(255));
  
  corR5=int(random(255));
  corG5=int(random(255));
  corB5=int(random(255));
  
  corR6=int(random(255));
  corG6=int(random(255));
  corB6=int(random(255));
  
  corR7=int(random(255));
  corG7=int(random(255));
  corB7=int(random(255));
  
  
  size (500,500);
  //size(displayWidth, displayHeight);
  background (0);
  noStroke();
  //stroke(255);
  //strokeWeight(1);
  smooth();
    
  }
  
  
    void mouseDragged() {
    corR1=mouseY;
    corG2=mouseY;
    corB3=mouseY;
    corR4=mouseY;
    corG5=mouseY;
    corB6=mouseY;
    corR7=mouseY;

  }
  
  

  
  
      void mousePressed() {
  corR1=int(random(255));
  corG1=int(random(255));
  corB1=int(random(255));
  
  corR2=int(random(255));
  corG2=int(random(255));
  corB2=int(random(255));
  
  corR3=int(random(255));
  corG3=int(random(255));
  corB3=int(random(255));
  
  corR4=int(random(255));
  corG4=int(random(255));
  corB4=int(random(255));
  
  corR5=int(random(255));
  corG5=int(random(255));
  corB5=int(random(255));
  
  corR6=int(random(255));
  corG6=int(random(255));
  corB6=int(random(255));
  
  corR7=int(random(255));
  corG7=int(random(255));
  corB7=int(random(255));
  }
  
  
  void draw(){

  brightness(mouseX);
    
//GUIAS
  pushMatrix();
  line (x,y,width,height);
  line (height,y,x,width);
  line (width/2,y,width/2,height);
  line (width/4,y,width/2,height/2);
  popMatrix();
  
//FRACTAL 1

pushMatrix();

  translate(width/2,height/2);
  angulo+=90; //QUANDO PASSA NO DRAW É SOMADO 5 EM 5
  rotate(radians(angulo));
  
  fill(corR1,corG1,corB1);
  triangle (x,y,width/4,y,width/8,height/8);
  
  fill(corR2,corG2,corB2);
  triangle (width/4,y,width/8,height/8,width/3,height/6);

  fill(corR3,corG3,corB3);
  triangle (width/8,height/8,width/3,height/6,width/4,height/4);
  
  fill(corR4,corG4,corB4);
  triangle (width/3,height/6,width/4,height/4,width/3,height/3);
  
  fill(corR5,corG5,corB5);
  triangle (width/3,height/6,width/3,height/3,width/2.4,height/3);
  
  fill(corR6,corG6,corB6);
  triangle (width/2.25,height/2.25,width/3,height/3,width/2.4,height/3);
  
  fill(corR7,corG7,corB7);
  triangle (width/2.25,height/2.25,width/2,height/2,width/2.4,height/3);
  
  popMatrix();
  
  
//FRACTAL 2  
  
pushMatrix();
  
 
  translate(x,y);
  rotate(radians(angulo));
  
  
  fill(corR1,corG1,corB1);
  triangle (x,y,width/4,y,width/8,height/8);
  
  fill(corR2,corG2,corB2);
  triangle (width/4,y,width/8,height/8,width/3,height/6);

  fill(corR3,corG3,corB3);
  triangle (width/8,height/8,width/3,height/6,width/4,height/4);
  
  fill(corR4,corG4,corB4);
  triangle (width/3,height/6,width/4,height/4,width/3,height/3);
  
  fill(corR5,corG5,corB5);
  triangle (width/3,height/6,width/3,height/3,width/2.4,height/3);
  
  fill(corR6,corG6,corB6);
  triangle (width/2.25,height/2.25,width/3,height/3,width/2.4,height/3);
  
  fill(corR7,corG7,corB7);
  triangle (width/2.25,height/2.25,width/2,height/2,width/2.4,height/3);
  
  popMatrix();
  

//FRACTAL 3

  pushMatrix();
  
  translate(width,height);
  rotate(radians(angulo));
  
  
  fill(corR1,corG1,corB1);
  triangle (x,y,width/4,y,width/8,height/8);
  
  fill(corR2,corG2,corB2);
  triangle (width/4,y,width/8,height/8,width/3,height/6);

  fill(corR3,corG3,corB3);
  triangle (width/8,height/8,width/3,height/6,width/4,height/4);
  
  fill(corR4,corG4,corB4);
  triangle (width/3,height/6,width/4,height/4,width/3,height/3);
  
  fill(corR5,corG5,corB5);
  triangle (width/3,height/6,width/3,height/3,width/2.4,height/3);
  
  fill(corR6,corG6,corB6);
  triangle (width/2.25,height/2.25,width/3,height/3,width/2.4,height/3);
  
  fill(corR7,corG7,corB7);
  triangle (width/2.25,height/2.25,width/2,height/2,width/2.4,height/3);
  
  popMatrix();
  
  
  //FRACTAL 4

  pushMatrix();
  
  translate(x,height);

  rotate(radians(angulo));
  
  
  fill(corR1,corG1,corB1);
  triangle (x,y,width/4,y,width/8,height/8);
  
  fill(corR2,corG2,corB2);
  triangle (width/4,y,width/8,height/8,width/3,height/6);

  fill(corR3,corG3,corB3);
  triangle (width/8,height/8,width/3,height/6,width/4,height/4);
  
  fill(corR4,corG4,corB4);
  triangle (width/3,height/6,width/4,height/4,width/3,height/3);
  
  fill(corR5,corG5,corB5);
  triangle (width/3,height/6,width/3,height/3,width/2.4,height/3);
  
  fill(corR6,corG6,corB6);
  triangle (width/2.25,height/2.25,width/3,height/3,width/2.4,height/3);
  
  fill(corR7,corG7,corB7);
  triangle (width/2.25,height/2.25,width/2,height/2,width/2.4,height/3);
  
  popMatrix();
  
  
  
  //FRACTAL 5

  pushMatrix();
  
  translate(width,y);

  rotate(radians(angulo));
  
  
  fill(corR1,corG1,corB1);
  triangle (x,y,width/4,y,width/8,height/8);
  
  fill(corR2,corG2,corB2);
  triangle (width/4,y,width/8,height/8,width/3,height/6);

  fill(corR3,corG3,corB3);
  triangle (width/8,height/8,width/3,height/6,width/4,height/4);
  
  fill(corR4,corG4,corB4);
  triangle (width/3,height/6,width/4,height/4,width/3,height/3);
  
  fill(corR5,corG5,corB5);
  triangle (width/3,height/6,width/3,height/3,width/2.4,height/3);
  
  fill(corR6,corG6,corB6);
  triangle (width/2.25,height/2.25,width/3,height/3,width/2.4,height/3);
  
  fill(corR7,corG7,corB7);
  triangle (width/2.25,height/2.25,width/2,height/2,width/2.4,height/3);
  
  popMatrix();
  
  
  
    //FRACTAL 6

  pushMatrix();
  
  translate(x,y);
  
  fill(corR7,corG7,corB7);
  triangle (width/4,y,width/2,y,width/3,height/6);
  
  fill(corR1,corG1,corB1);
  triangle (width/2,y,width/3,height/6,width/2,height/6);

  fill(corR5,corG5,corB5);
  triangle (width/2,height/4,width/3,height/6,width/2,height/6);

  fill(corR4,corG4,corB4);
  triangle (width/2,height/4,width/3,height/6,width/2.5,height/3.35);

  fill(corR3,corG3,corB3);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2.5,height/3.35);

  fill(corR2,corG2,corB2);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2,height/2.25);

  fill(corR6,corG6,corB6);
  triangle (width/2,height/2,width/2.32,height/2.75,width/2,height/2.25);
  
  popMatrix();
  
    //FRACTAL 7

  pushMatrix();
  
  translate(width/2,height/2);
  rotate(radians(angulo));
  
  fill(corR7,corG7,corB7);
  triangle (width/4,y,width/2,y,width/3,height/6);
  
  fill(corR1,corG1,corB1);
  triangle (width/2,y,width/3,height/6,width/2,height/6);

  fill(corR5,corG5,corB5);
  triangle (width/2,height/4,width/3,height/6,width/2,height/6);

  fill(corR4,corG4,corB4);
  triangle (width/2,height/4,width/3,height/6,width/2.5,height/3.35);

  fill(corR3,corG3,corB3);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2.5,height/3.35);

  fill(corR2,corG2,corB2);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2,height/2.25);

  fill(corR6,corG6,corB6);
  triangle (width/2,height/2,width/2.32,height/2.75,width/2,height/2.25);
  
  popMatrix();  


    //FRACTAL 8

  pushMatrix();
  
  translate(width,height);
  rotate(radians(angulo));
  
  fill(corR7,corG7,corB7);
  triangle (width/4,y,width/2,y,width/3,height/6);
  
  fill(corR1,corG1,corB1);
  triangle (width/2,y,width/3,height/6,width/2,height/6);

  fill(corR5,corG5,corB5);
  triangle (width/2,height/4,width/3,height/6,width/2,height/6);

  fill(corR4,corG4,corB4);
  triangle (width/2,height/4,width/3,height/6,width/2.5,height/3.35);

  fill(corR3,corG3,corB3);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2.5,height/3.35);

  fill(corR2,corG2,corB2);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2,height/2.25);

  fill(corR6,corG6,corB6);
  triangle (width/2,height/2,width/2.32,height/2.75,width/2,height/2.25);
  
  popMatrix();  


    //FRACTAL 9

  pushMatrix();
  
  translate(x,height);
  rotate(radians(angulo));
  
  fill(corR7,corG7,corB7);
  triangle (width/4,y,width/2,y,width/3,height/6);
  
  fill(corR1,corG1,corB1);
  triangle (width/2,y,width/3,height/6,width/2,height/6);

  fill(corR5,corG5,corB5);
  triangle (width/2,height/4,width/3,height/6,width/2,height/6);

  fill(corR4,corG4,corB4);
  triangle (width/2,height/4,width/3,height/6,width/2.5,height/3.35);

  fill(corR3,corG3,corB3);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2.5,height/3.35);

  fill(corR2,corG2,corB2);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2,height/2.25);

  fill(corR6,corG6,corB6);
  triangle (width/2,height/2,width/2.32,height/2.75,width/2,height/2.25);
  
  popMatrix();  


    //FRACTAL 10

  pushMatrix();
  
  translate(width,y);
  rotate(radians(angulo));
  
  fill(corR7,corG7,corB7);
  triangle (width/4,y,width/2,y,width/3,height/6);
  
  fill(corR1,corG1,corB1);
  triangle (width/2,y,width/3,height/6,width/2,height/6);

  fill(corR5,corG5,corB5);
  triangle (width/2,height/4,width/3,height/6,width/2,height/6);

  fill(corR4,corG4,corB4);
  triangle (width/2,height/4,width/3,height/6,width/2.5,height/3.35);

  fill(corR3,corG3,corB3);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2.5,height/3.35);

  fill(corR2,corG2,corB2);
  triangle (width/2,height/4,width/2.32,height/2.75,width/2,height/2.25);

  fill(corR6,corG6,corB6);
  triangle (width/2,height/2,width/2.32,height/2.75,width/2,height/2.25);
  
  popMatrix();  

}



