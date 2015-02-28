
float atomo= 100;
float ull = 20;
float bo = 10;
  
float ullo = 30;
float boc = 15;
int numBoles = 70;
 
//creem una matriu de posicionsX con "numBoles" elements:
float[] posx= new float[numBoles];
//el mateix per posicionsY:
float[] posy = new float[numBoles];
//i per velocitatsX:
float[] velx = new float[numBoles];
//i velocitatsY:
float[] vely = new float[numBoles];
 
 
void setup() {
  size(600,600);
     for(int i = 0; i<numBoles; i++){
    posx[i] = width/2;
    posy[i] = height/2;
    velx[i] = random(10,20);
    vely[i] = random(10,20);
  }
}
 
void draw() {
  //fons de quan es clicka
 dibuixa_fons(0,0);
     for(int i = 0; i<numBoles; i++){
 if( mousePressed==true) {//el ke pasa quan el mouse es clica
    actualitza_element(i);
   posiciona_element1(posx[i],posy[i]);
 
 //Quan no es clica
} else {
 background(0); 
  actualitza_element(i);
 
  posiciona_element2(posx[i],posy[i]);
   
}
}
}
void dibuixa_fons (int x, int y){
   background(180);
  for(int i =0; i<800;i+=100){
    fill(150);
     
    ellipse(i-67.5,i-67.5,35,35);
    float b = 32.5;
    float c = 67.5;
   float d = 50;
     strokeWeight(3);
     stroke(220);
      line(0,i,i+600,i);
    line(i,0,i,i+600);
 
      ellipse(b,i-c,35,35);
       ellipse(c,i-c,35,35);
       
       ellipse(b+100,i-c,35,35);
       ellipse(c+100,i-c,35,35);
        
        ellipse(b+200,i-c,35,35);
       ellipse(c+200,i-c,35,35);
        
         ellipse(b+300,i-c,35,35);
       ellipse(c+300,i-c,35,35);
        
        ellipse(b+400,i-c,35,35);
       ellipse(c+400,i-c,35,35);
        
        ellipse(b+500,i-c,35,35);
       ellipse(c+500,i-c,35,35);
        
        ellipse(b+600,i-c,35,35);
       ellipse(c+600,i-c,35,35);
        
        
        ellipse(b,i-b,35,35);
       ellipse(c,i-b,35,35);
        
       ellipse(b+100,i-b,35,35);
       ellipse(c+100,i-b,35,35);
        
        ellipse(b+200,i-b,35,35);
       ellipse(c+200,i-b,35,35);
        
         ellipse(b+300,i-b,35,35);
       ellipse(c+300,i-b,35,35);
        
        ellipse(b+400,i-b,35,35);
       ellipse(c+400,i-b,35,35);
        
        ellipse(b+500,i-b,35,35);
       ellipse(c+500,i-b,35,35);
        
        ellipse(b+600,i-b,35,35);
       ellipse(c+600,i-b,35,35);
        
        
        ellipse(d,i-d,35,35);
        
       ellipse(d+100,i-d,35,35);
        
        ellipse(d+200,i-d,35,35);
        
         ellipse(d+300,i-d,35,35);
        
        ellipse(d+400,i-d,35,35);
        
        ellipse(d+500,i-d,35,35);
        
        ellipse(d+600,i-d,35,35);
        
     }
}


void posiciona_element1(float posx, float posy){//cara mousePressed
   
strokeWeight(3);
stroke(0);
  fill(posx,posy,15);
     
  ellipse(posx,posy,atomo,atomo);
  fill(0);
   ellipse(posx-ullo,posy-boc,15,ullo);
   ellipse(posx+ullo,posy-boc,15,ullo);
     
 
rect(posx-boc, posy,30,15);

}


void posiciona_element2(float posx, float posy){
    fill(255);
   
 //cara
    
strokeWeight(3);
stroke(255);
  fill(posx,posy,15);
     
  ellipse(posx,posy,atomo,atomo);
  fill(posx/3);
   ellipse(posx-ull,posy-boc,15,ullo);
   ellipse(posx+ull,posy-boc,15,ullo);
  curve(posx-ull, posy-atomo, posx-ull, posy+boc, posx+ull, posy+boc, posx+ull, posy-atomo);
  line(posx-ull,posy+boc,posx+ull,posy+boc);
  
}


void actualitza_element(int i){
      //velocitat
    posx[i] += velx[i];
    posy[i] += vely[i];
//limits
    if((posx[i]<50)||(posx[i]>width-50)){
      velx[i] = -velx[i];
    }
    if((posy[i]<50)||(posy[i]>height-50)){
      vely[i] = -vely[i];
    }
}


