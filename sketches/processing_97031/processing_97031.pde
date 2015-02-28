
//Ainoa Abella Garcia P3_b

//declaració de variables
int posX, posY, velX, velY;
int posX1, posY1, velX1, velY1;
int posX2, posY2, velX2, velY2;
int posX3, posY3, velX3, velY3;
int sz = 20;
color normal,R,G,B;
color R1,G1,B1;
boolean ismousepressed;

//pàgina
void setup (){
   size (800,500);//tamany
   background(134,98,43); 
  posX = width/2;
  posY = height/2;
  velX = int(random(4,10));
  velY = 4;
  
  posX1 = width/3;
  posY1 = int(height/3.5);
  velX1= int(random(4,10));
  velY1 = 5;
  
  posX2 = int(width/2.5);
  posY2 = int(height/2.2);
  velX2= int(random(2.5,10));
  velY2 = int(2.5); 
  
  posX3 = int(width/1.5);
  posY3 = int(height/4.2);
  velX3= int(random(5,10));
  velY3 = int(2.5); 
   smooth(); // qualitat dibuix
   
}

void draw(){
   background(134,98,43); 
   stroke(50,92,19); strokeWeight(5);
   fill(38,108,37); rect(width/13.5,height/13,width*3.4/4,height*3.35/4); // rectangle tapís verd
    
  //forats negres
  
  fill(0); ellipse(width/12,height/12,50,50); // 1r forat
           ellipse(width/12,height/2,50,50); // 2n forat
           ellipse(width/12,height/1.1,50,50); // 3r forat
           ellipse(width/2,height/12,50,50); // 4rt forat
           ellipse(width/2,height/1.1,50,50); // 5è forat
           ellipse(width/1.1,height/12,50,50); // 6è forat
           ellipse(width/1.1,height/1.1,50,50); // 7è forat
           ellipse(width/1.1,height/2,50,50); // 8è forat

  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
  
  //dibuixem la  pilota vermella
  noStroke();
  fill(R,G,B);ellipse(posX,posY,sz,sz);

  //comprovem la posició X
  if((posX<width/13.5)||(posX>width*3.4/4)){
    velX = -velX;
  } 
    //comprovem la posició Y
  if((posY<height/13)||(posY>height*3.35/4)){
    velY = -velY;
  } 

 
  //actualitzem posicions
  posX1 = posX1+velX1;
  posY1= posY1+velY1;
  
  //dibuixem la  pilota blava
  noStroke();
  fill(2,10,209);ellipse(posX1,posY1,sz,sz);

  //comprovem la posició X
  if((posX1<width/13.5)||(posX1>width*3.4/4)){
    velX1 = -velX1;
  } 
    //comprovem la posició Y
  if((posY1<height/13)||(posY1>height*3.35/4)){
    velY1 = -velY1;
  } 
  
  
   //actualitzem posicions
  posX2 = posX2+velX2;
  posY2 = posY2+velY2;
  
  //dibuixem la  pilota groga
  noStroke();
  fill(233,255,0);ellipse(posX2,posY2,sz,sz);

  //comprovem la posició X
  if((posX2<width/13.5)||(posX2>width*3.4/4)){
    velX2 = -velX2;
  } 
    //comprovem la posició Y
  if((posY2<height/13)||(posY2>height*3.35/4)){
    velY2 = -velY2;
  }  
  
  
   //actualitzem posicions
  posX3 = posX3+velX3;
  posY3 = posY3+velY3;
  
  //dibuixem la  pilota lila
  noStroke();
  fill(212,0,255); ellipse(posX3,posY3,sz,sz);

  //comprovem la posició X
  if((posX3<width/13.5)||(posX3>width*3.4/4)){
    velX3 = -velX3;
  } 
    //comprovem la posició Y
  if((posY3<height/13)||(posY3>height*3.35/4)){
    velY3 = -velY3;
  }  
     
}

void mousePressed() {   // canviar la posició amb el ratolí de la pilota lila
  if (posX3 == 0) {
    posX3 = 103;
  } else {
    posX3 = 400;
  }
  
  if (posX1 == 0) {   // canviar la posició amb el ratolí de la pilota blava
    posX1 = 80;
  } else {
    posX1 = 500;
  }
  ismousepressed=ismousepressed==false;
  if(ismousepressed){
    sz= sz-20;
  }
    else{
      sz=25;}
    
  
  if( normal==0){
    R=int(random(0,255));
    G=int(random(0,255));
    B=int(random(0,255));}
    else{
    R=100;
    G=255;
    B=0;
    }  
    
     if( normal==0){
    R1=int(random(0,255));
    G1=int(random(0,255));
    B1=int(random(0,255));}
    else{
    R1=75;
    G1=255;
    B1=50;
    }  

    }


