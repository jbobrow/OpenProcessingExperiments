
float x;
float y;
float w;
float h;
float j = 0;
float a = 30;
float b = 370;
float c = lerp(a, b, .2);
float f = lerp(a, b, .4);
float d = lerp(a, b, .6);
float k = lerp(a, b, .8);
int fase=0;
float spid = 0;  
float gravity = 0.1;  
float speed = .50; 
int state = 0;  
float limitex;
float limitey;

void setup() {
  background(225,225,200);
  size(400,600);
  strokeWeight(5);
  frameRate(30);
  x=width*.25;
  y=height*.25;
  w=width;
  h=height;
  
}

void draw() {
  limitex=random(0,width);
  limitey=random(0,height);
  //if(limitex<100 && limitex>450 && limitey<30 && limitey>250) {
    smooth();
    stroke(255,0,0);
    strokeWeight(10);      
    point(limitex,limitey);
  //}
  
   scale(.5);
   
   
    
    pushMatrix();
    //scale(.35);
    for (int com=0;com<200;com=com+20){
    float comienzo=random(1,com);
    translate(com-30,com-90);
     drawCuadrado();
    }
   
    popMatrix();
    
   
    
   
 
  
     /*translate(0,100);
    drawCuadrado();
    translate(0,100);
    drawCuadrado();
    translate(0,100);
    drawCuadrado();
     translate(0,100);
    drawCuadrado();
     translate(0,100);
    drawCuadrado();}
    */

    
    
    
   
    
    
    
    


  /*int[] ancho = new int[5];
   ancho[0] = 90; 
   ancho[1] = 150; 
   ancho[2] = 30;
   ancho[3] = 300; 
   ancho[4] = 280; 
   float r=random(width);
   */

  pushMatrix();
  translate(0,height*.90);
  //scale();
  drawTriangulo(a);
  //delay(180);
  drawTriangulo(c);
  //delay(180);
  drawTriangulo(f);
  //delay(180);
  drawTriangulo(d);
  //delay(180);
  drawTriangulo(k);
  //delay(180);
  drawTriangulo(b);
  popMatrix();

 // for(float s=0.1;s<1;s=s+0.5) {
    //float sca= lerp(0,width,i);
    //println(sca);


    //drawCuadrado(i*0.5);
    //translate(width*.25,0);
  
   
    
  //}
}

void drawCuadrado() {
 
  stroke(0);
  strokeWeight(3);

  // scale(i);
  point(x,y);



  // If the state is 0, move to the right.
  if (state == 0) {
     
    x = x + speed;
    // If, while the state is 0, it reaches the right side of the window, change the state to 1
    // Repeat this same logic for all states!?
    if (x > 3*w*.25) {
      x = 3*w*.25;
      state = 1;
    }
  } 
  else if (state == 1) {
    y = y + speed;
    if (y > 3*h*.25) {
      y = 3*h*.25;
      state = 2;
    }
  } 
  else if (state == 2) {
    x = x-speed;

    if (x < w*.25) {
      x = w*.25;
      //println("llego1");
      state = 3;
    }
  } 
  else if (state == 3) {
    y = y - speed;
    if (y <h*.25) {
      y = h*.25;
     // println("llego2");
      //println(y);
      //state=0;
      
    }
  }
}

void drawTriangulo(float g) {


  pushMatrix();
  translate(g,0);
  noStroke();
  fill(225,225,200);
  rectMode(CENTER);
  rect(g,j,100,300);
  fill(130*spid/5,100,170*-spid/5);
  //stroke(0);
  triangle(g,j,g+30,j+60,g-30,j+60);

  popMatrix();
  j = j + spid; 
  spid = spid + gravity;

  if (j > height-30) {
    spid = spid * -0.95;
    filter(INVERT);
  }
}


