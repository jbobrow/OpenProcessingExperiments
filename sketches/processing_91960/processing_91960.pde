
boolean apple = true;
int a = frameCount/2;
boolean orange = true;
int b = frameCount/2;
float c=5;
float d = 2;
float e = 5;
float f = 2;
boolean mov = false;

int g = 0;
  
  void setup() {
  size(400, 400, P3D);
  noFill();
}
void draw() {
  background(0);
  

  lightSpecular(255, 255, 255);
  directionalLight(100, 100, 100, 0, 0, -1);

  specular(150, 50, 0 );
  shininess(1);

  if (apple == true) {
    a --;
  }
  else
  {
    a-=0;
  }
  if (a == -90) {
    apple= false;
      
  }
  if (a==0) {
     apple= true;
    
  }
  if (orange == true && a== -90) {
    b ++;
  
  }
  else
  {
    b-=0;
 
  }
  if (b == 90) {
    orange= false;
  }
  if (b==0 ) {
    orange = true;
  }
  

  if (a == -90 && b== 90)
  {
    mov = true;
  }
  else
  {
    mov = false;
  }
  
  if (mov == true)
  {
       c+=d;
       ;
  if (c>=20)
  {
      d*=-1;
      f*=-1;
  }
  if (c<-20 )
  {
    d*=-1;
 
  }
  if ( mousePressed == true){
 
    g ++;

}

}
 


println(g);




  pushMatrix();

  translate(width/2, height/2, 0);

  rotateX(radians(((mouseY/(float)height)*180)-90));
     rotateY(radians(((mouseX/(float)width)*180)-90));

  //HEAD
  pushMatrix();
  translate(0, -60, 0);
 rotateX(radians(-90));  
 rotateX(radians(b)); 
  scale(1.5, 1.5, 1.2);
  fill(255, 255, 0);

  
    translate(-5, -3, 8);
 rotateX(radians(-90));  
 rotateX(radians(b)); 
  scale(1,1, 1);
  fill(255, 0, 0);
  box(5);
  popMatrix();
  
    pushMatrix();
  translate(0, -60, 0);
 rotateX(radians(-90));  
 rotateX(radians(b)); 
  scale(1.5, 1.5, 1.2);
  fill(0, 255, 0);
  box(20);
  
    translate(5, -3, 8);
 rotateX(radians(-90));  
 rotateX(radians(b)); 
  scale(1,1, 1);
  fill(255, 0, 0);
  box(5);
  popMatrix();
// body
pushMatrix();  
    rotateY(radians(g));
pushMatrix();
  translate(0, 0, 0);//100*sin(frameCount/100.0));

  scale(2, 2, 2);
  fill(0, 255, 0);
  box(40);
  popMatrix();
 

pushMatrix();
  rotateX(radians(c)); 
    pushMatrix();
  translate(-25, 80, 0);//100*sin(frameCount/100.0));
  scale(1, 3, 1.2);
  fill(0, 255, 0);
  box(20);
  popMatrix();
 popMatrix();

 pushMatrix();
 rotateX(radians(-c));
  pushMatrix();
  translate(25, 80, 0);
 
 
 translate(0, -50, 0);
 
 translate(0, 50, 0);
 
  scale(1, 3, 1.2);
  fill(0, 255, 0);
  box(20);
  popMatrix();
popMatrix();

 //ARM
   pushMatrix();
 rotateX(radians(c));
  pushMatrix();
  translate(-60, 20, 0);
  translate(-10, -50, 0);
   rotateX(radians(90));
  rotateX(radians(a));
  translate(-10, -50, 0);
  translate(30, 60+b-90, 0);
  scale(1, 2.5, 1.2);
  fill(0, 255, 0);
  box(20);
  popMatrix();
 
  pushMatrix();
  translate(-60, 20, 0);
  translate(-10, -10, 0);
  rotateX(radians(b));
  translate(-10, -50, 0);
  translate(30, 68, 0);
  scale(1, 3, 1.2);
  fill(0, 255, 0);
  box(20);
  popMatrix();
   popMatrix();
//ARM2

  
 rotateX(radians(-c));
  pushMatrix();
  translate(40, 20, 0);
  translate(-10, -50, 0);
   rotateX(radians(90));
  rotateX(radians(a));
  translate(-10, -50, 0);
  translate(30, 60+b-90, 0);
  scale(1, 2.5, 1.2);
  fill(0, 255, 0);
  box(20);
  popMatrix();

  pushMatrix();
  translate(40, 20, 0);//100*sin(frameCount/100.0));
  translate(-10, -10, 0);

  rotateX(radians(b));
  translate(-10, -50, 0);
  translate(30, 68, 0);
  scale(1, 3, 1.2);
  fill(0, 255, 0);
  box(20);
  popMatrix();

   popMatrix();
  popMatrix();

}





