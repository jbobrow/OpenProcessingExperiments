
PImage A;
PImage B ;
PImage C;
PImage D;
PImage E;
PImage F;
PImage G;
PImage H;
PImage I;
PImage J;
PImage K;
PImage L;
PImage M;
PImage N;
PImage O;
PImage eye;

float x;
float y;
float d;
float h;
float s;


void setup(){
    size(640,480);


  smooth();
  A = loadImage ("A.png");   
  B = loadImage ("B.png");   
  C = loadImage ("C.png");  
  D = loadImage ("D.png");   
  E = loadImage ("E.png");   
  F = loadImage ("F.png");
  G = loadImage ("G.png");   
  H = loadImage ("H.png");   
  I = loadImage ("I.png");
  J = loadImage ("J.png");   
  K = loadImage ("K.png");   
  L = loadImage ("L.png");
  M = loadImage ("M.png");   
  N = loadImage ("N.png");   
  O = loadImage ("O.png");
  eye = loadImage ("eye.png");

}

void draw(){
  //background(#eaf7e7);
  background(255);
  
       x = map(mouseX,0,width,0,radians(10));
       d = map (mouseX,0,width,0,-width/5.3);
       h = map (mouseX,0,height,0,100);
       s = map (mouseX,0,width,1,1.15);
 translate(width/2,365);
 // O
      z(O,x*8,d*1.7,h*.9,s);
 // N
      z(N,x*3,d*.5,h*.15,s);
 // M  
      z(M,-x*1,-d*.5,h/5,s);
 // L 
      z(L,x*8,d*1.5,h,s);
      
 // K  
      z(K,x*29,d*.05,h/2.8,s);
      
 // J 
      z(J,x*3.5,d*.5,h*.2,s);
 // I 
      z(I,x*6,d*1.5,h*.6,s);
 // H  
      z(H,x*14,d*.3,h*2.5,s);
      
    
 // G
      z(G,-x*13,d*0,-h*0,s);
 
 // F 
      z(F,x*19,d*1.7,h*.3,s);
 // E 
      z(E,x*20,-d*.3,h*0,s);
      
 
 // D 
      z(D,-x*3,-d,h/3,s);
 // C 
      z(C,x*4,-d*2,-h*.7,s);  
 // B
      z(B,-x*4,-d*0,-h*2,s);
 // A
      z(A,-x*10,-d/2,-h/2,s);
 // EYE  
     z(eye,x,d*1.5,h,s);


}

void z(PImage thisImage, float angle, float dis, float h, float s){
   pushMatrix();
   rotate(angle);
   translate(dis,h);
   scale(s);
  
   image(thisImage,-A.width/2,-A.height/2);
   popMatrix();
  
}

