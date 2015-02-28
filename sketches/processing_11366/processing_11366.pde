
HashSet invaders = new HashSet();

boolean trackdot = false;

float SHADOW = 400;

void setup(){
  size(500,500,P3D);
  rectMode(CENTER);
  frameRate(30);
  for(int i = 0; i < 200; i++){
    invaders.add(new Invader());
  }
}

float targx = 100;
float targy = -200;
float targz = -100;


int mouseRest = 9999;
void mouseMoved(){
  mouseRest = 0;
  
 targx = mouseX-250;
 targy = mouseY-250;
}  
void mouseDragged(){
 targx = mouseX-250;
 targz = mouseY-250;

  mouseRest = 0;
}  
   

void draw(){
    background(50);
    mouseRest++;
    if(mouseRest > frameRate * 10){
      mouseRest = 99999;
        trackdot = false;
    } else {
     trackdot = true; 
    }
    

    
   pushMatrix();
   translate(250,250,-500);
  //  rotateY((mouseX+250)/100.0);
  //  rotateX((mouseY+250)/100.0);

   Iterator i = invaders.iterator(); 

   while(i.hasNext()){
      Invader in = (Invader)i.next(); 
      in.move();
      in.drawShadow();
   }
    i = invaders.iterator(); 

   while(i.hasNext()){
     //print( "a");
      Invader in = (Invader)i.next(); 
      in.draw();
   }
   
if(trackdot){

 // noFill();
  fill(random(128,255));
  stroke(random(128,255));
  strokeWeight(1);
//drawcursor
  pushMatrix();
  translate(targx,targy,targz);
  box(20,20,20);
  popMatrix();
//draw cursror shadow
  pushMatrix();
  translate(targx,SHADOW,targz);
  box(20,0,20);
  popMatrix();
}
   
   
   popMatrix();
}

float MAXOFF = 200;
class Invader{
  float x = random(-MAXOFF,MAXOFF),y= random(-MAXOFF,MAXOFF),z= random(-MAXOFF,MAXOFF);
  float angleXY = 0;
  float angleYZ = 0;
float INVADERSIZE = random(20,40);
  float TURNSPEED = random(.02,.1); 
  float SPEED = random(4,6);

float oa = random(20);
float otx = 100*cos(oa);
float oty = 100*sin(oa);
float otz = 100*sin(oa);
//float oty = random(-200,200);
//float otz = random(-200,200);
float tx, ty , tz;

  color c = color(random(0,255),random(0,255),random(0,255));
  
  void move(){
   findtarget();
     moverotxy(); 
  //   moverotz(); 
//  moveintertxy();
moveinertz();

if(y > SHADOW-INVADERSIZE) { y = SHADOW-INVADERSIZE; }
if(z > 800) z= 800;

  }
  
  float xs,ys,zs;
  float FACT=30.0;
  void moveintertxy(){
     if (x < tx)  xs += SPEED/FACT; else xs -= SPEED/FACT;
     if(y < ty)   ys += SPEED/FACT; else  ys -= SPEED/FACT;
     x+=xs;
     y+=ys;
  }
  void moveinertz(){
     if(z < tz)  zs += SPEED/FACT ; else  zs -= SPEED/FACT;
     z+=zs;
     zs*= .99;
  }
  
  void findtarget(){
       if(trackdot){
       tx = targx;
      ty = targy;
     tz = targz; 
    } else {
       tx = otx;
      ty = oty;
     tz = otz; 
    }
     
  }
  
  void moverotxy(){

      float dx = (tx -x);
      float dy = ( ty - y);
      float wantangle = atan2(dy, dx);
      float anglediff = (angleXY - wantangle);  
      anglediff /= PI;
      if(anglediff > 1){
        anglediff -= 2;
      }
      if(anglediff < -1){
        anglediff += 2;
      }
      if(anglediff > 0){
       angleXY -= TURNSPEED; 
      } 
      else {
        angleXY += TURNSPEED; 
      }
    float           angcos= cos(angleXY);
    float    angsin = sin(angleXY);
    x +=  angcos * SPEED; 
    y += angsin * SPEED; 

  }

void moverotz(){

      float dz = (tz -z);
      float dy = ( ty - y);
      float wantangle = atan2(dy, dz);
      float anglediff = (angleYZ - wantangle);  
      anglediff /= PI;
      if(anglediff > 1){
        anglediff -= 2;
      }
      if(anglediff < -1){
        anglediff += 2;
      }
      if(anglediff > 0){
        angleYZ -= TURNSPEED; 
      } 
      else {
        angleYZ += TURNSPEED; 
      }
    float           angcos= cos(angleYZ);
    float    angsin = sin(angleYZ);
    z +=  angcos * SPEED; 
  //  y += angsin * SPEED; 

}

  
void drawShadow(){
   pushMatrix();
   fill(0);
   noStroke();
translate(x,400,z);
box(INVADERSIZE,1,INVADERSIZE);
  popMatrix();
 
}
  
  void draw(){
    fill(c);
  stroke(50);
strokeWeight(2);
  
  
  
    pushMatrix();
    translate(x,y,z);
  //  rotateZ(angleXY);
  //  rotateX(angleYZ);
  //rotateZ(-PI/2);
//float a = ((mouseX-250) / 100.0) ;
 // rotateX(2.5*PI);
  
 // rotateZ(PI*a);
 // println(PI*a);
  rotateY(PI);

  
  
    box(INVADERSIZE,INVADERSIZE,INVADERSIZE);
    pushMatrix();
      translate(INVADERSIZE/2,INVADERSIZE/2,0);
      rotateZ(PI/4);
      box(INVADERSIZE/2);
    popMatrix();
    pushMatrix();
      translate(-INVADERSIZE/2,INVADERSIZE/2,0);
      rotateZ(PI/4);
      box(INVADERSIZE/2);
    popMatrix();
noStroke();
    pushMatrix();
    translate(-INVADERSIZE*2/8,0,-INVADERSIZE/2);
    fill(0);
    box(INVADERSIZE/4);
    popMatrix();

    pushMatrix();
    translate(INVADERSIZE*2/8,0,-INVADERSIZE/2);
    fill(0);
    box(INVADERSIZE/4);
    popMatrix();


    popMatrix();
  }
  
  
}

