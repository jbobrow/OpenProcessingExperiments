
Lemming1 [] a=new Lemming1[500];
Mario [] b=new Mario[500];
int cantidad=0;
void setup(){
  size (600,600);
  
   for (int i=0;i<b.length;i++){
    b[i]=new Mario (random (width), random (height),random (1,7),random(1,7));
   } 
  
  
  
  
  for (int i=0;i<a.length;i++){
   a[i]=new Lemming1(random (width), random (height),random (1,2),random(1,7)); 
  }
  
}

void draw(){
   background (0,0,0);
   for (int i=0;i<a.length;i++){
    a[i].dibuixa();
    a[i].moure(); 
   }
   for (int i=0;i<b.length&&i<cantidad;i++){
   
   b[i].dibuixa();
    b[i].moure(); 
}
}
     void mousePressed(){
       cantidad=cantidad+1;
      
   
}

class Mario{
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  
  Mario(float x, float y, float velx,float vely){
    xPos=x;
    yPos=y;
    xSpeed=velx;
    ySpeed=vely;  
  }
  void dibuixa(){
    //gorra
    fill(255,0,0);
    stroke(255,0,0);
    rect (xPos,yPos,11,3);
    rect (xPos-5,yPos+3,25,3);
    //pelo
    fill(153,102,0);
    stroke(153,102,0);
    rect (xPos-5,yPos+6,8,3);
    rect (xPos-8,yPos+9,3,9);
    rect (xPos-5,yPos+15,3,3);
    rect (xPos-2,yPos+9,3,6);
    rect (xPos+1,yPos+12,2,3);
    //ojos
    rect (xPos+8,yPos+6,3,3);
    //cara
    fill(255,194,10);
    stroke(255,194,10);
    rect(xPos-5,yPos+9,2,5);
    rect(xPos+3,yPos+6,4,15);
    rect(xPos+2,yPos+9,1,2);
    rect (xPos+7,yPos+12,3,2);
    rect(xPos-2,yPos+15,6,6);
    rect(xPos+11,yPos+6,3,6);
    rect(xPos+14,yPos+9,6,6);
    rect(xPos+20,yPos+12,3,3);
    rect(xPos+8,yPos+18,9,3);
    //cuerpo
    fill(153,102,0);
    stroke(153,102,0);
    rect(xPos-5,yPos+21,6,9);
    rect(xPos-8,yPos+24,3,6);
    rect(xPos-11,yPos+27,3,3);
    rect(xPos-5,yPos+30,3,3);
    rect(xPos+4,yPos+21,9,3);
    rect(xPos+4,yPos+24,6,3);
    rect(xPos+13,yPos+24,9,6);
    rect(xPos+22,yPos+27,3,3);
    rect(xPos+16,yPos+30,3,3);
    //ropa
    fill(255,0,0);
    stroke(255,0,0);
    rect(xPos+1,yPos+21,3,18);
    rect(xPos+10,yPos+24,3,15);
    rect(xPos+4,yPos+27,6,12);
    rect(xPos-2,yPos+30,3,9);
    rect(xPos-5,yPos+36,9,6);
    rect(xPos+13,yPos+30,3,9);
    rect(xPos+10,yPos+36,9,6);
    //pies
    fill(153,102,0);
    stroke(153,102,0);
    rect(xPos+13,yPos+42,9,6);
    rect(xPos-8,yPos+42,9,6);
    rect(xPos-11,yPos+45,3,3);
    rect(xPos+22,yPos+45,3,3);
    //manos
    fill(255,194,10);
    stroke(255,194,10);
    rect(xPos-11,yPos+30,6,9);
    rect(xPos-5,yPos+33,3,3);
    rect(xPos+19,yPos+30,6,9);
    rect(xPos+16,yPos+33,3,3);
    
      
  }
 void moure(){
  xPos=(xPos+xSpeed)%width;
  yPos=(yPos+ySpeed)%height; 
 }
}
class Lemming1{
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  
  Lemming1(float x, float y, float velx,float vely){
    xPos=x;
    yPos=y;
    xSpeed=velx;
    ySpeed=vely;  
  }
  void dibuixa(){
    //pel
    fill (51,255,0);
    stroke (51,255,0);
    rect (xPos,yPos,10,5);
    rect (xPos-5,yPos+5,20,5);
    rect (xPos-5,yPos+10,10,5);
    rect (xPos,yPos+15,5,5);
    //cara
    fill(255,255,204);
    stroke (255,255,204);
    rect (xPos+5,yPos+10,10,5);
    rect (xPos+5,yPos+15,5,5);
    //braç
    rect(xPos,yPos+20,5,15);
    //cos
    fill(0,0,224);
    stroke(0,0,224);
    rect(xPos+5,yPos+20,5,15);
    rect(xPos,yPos+35,10,10);
    //peus
    fill(255,255,204);
    stroke(255,255,204);
    rect(xPos,yPos+45,10,5);
    rect(xPos-5,yPos+40,5,5);

  
  }
 void moure(){
  xPos=(xPos+xSpeed)%width;
  yPos=(yPos+ySpeed)%height; 
 }
}



