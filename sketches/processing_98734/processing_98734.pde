
ArrayList liniaazullist = new ArrayList();
ArrayList liniarojalist = new ArrayList();
ArrayList rectarojalist = new ArrayList();
ArrayList rectaazullist = new ArrayList();
ArrayList trilist = new ArrayList();
float puntomedioX, puntomedioY;
float sorteigcolor, cerclecolor;



tri [] t = new tri[1];

void setup(){
  size(1200,700);
  background(255);
  
  /////////////////////////////// LINIAS /////////////////////////////////
  
  liniarojalist.add(new liniaroja(random(width),random(height),1,1,0,5,1));
  liniarojalist.add(new liniaroja(random(width),random(height),1,1,50,5,1));
  liniarojalist.add(new liniaroja(random(width),random(height),1,1,100,5,1));
  
  liniaazullist.add(new liniaazul(random(width),random(height),1,1,50,5,1));
  liniaazullist.add(new liniaazul(random(width),random(height),1,1,25,5,1));
  liniaazullist.add(new liniaazul(random(width),random(height),1,1,0,5,1));
  
  
  /////////////////////////////// RECTAS /////////////////////////////////
  
  rectarojalist.add(new rectaroja(random(width),random(height),0.3,0.3,0,2,1));
  rectarojalist.add(new rectaroja(random(width),random(height),-0.3,0.3,50,2,1));
  rectarojalist.add(new rectaroja(random(width),random(height),0.3,-0.3,100,2,1));
  
  rectaazullist.add(new rectaazul(random(width),random(height),0.3,0.3,50,2,1));
  rectaazullist.add(new rectaazul(random(width),random(height),-0.3,0.3,25,2,1));
  rectaazullist.add(new rectaazul(random(width),random(height),0.3,-0.3,0,2,1));
  
 trilist.add(new tri( random(0,width), random (0,height), random(0,width), random (0,height), random(0,width), random (0,height), 1, 1, 1, 1, 1, 0, 10, 0));

  
}

void draw(){
  
    
  
  
      for (int i=0; i<liniaazullist.size();i++){ 
    liniaazul _liniaazul = (liniaazul) liniaazullist.get(i);
    _liniaazul.run();
    liniaroja _liniaroja = (liniaroja) liniarojalist.get(i);
    _liniaroja.run();
     rectaroja _rectaroja = (rectaroja) rectarojalist.get(i);
    _rectaroja.run();
      rectaazul _rectaazul = (rectaazul) rectaazullist.get(i);
    _rectaazul.run();
    
    
    /////////////////////////////////    TOCADO LINIAazul   -   RECTAVERMELLA    /////////////////////////////////////////////////
    
//       if(((_liniaazul.posX)-(_rectaroja.posX)<150 && (_liniaazul.posX)-(_rectaroja.posX)>-150) && ((_liniaazul.posY)-(_rectaroja.posY)<150 && (_liniaazul.posY)-(_rectaroja.posY)>-150)){
//    //println("tocado");
//    
//    }  
    
    /////////////////////////////////    TOCADO RECTAAZUL   -   RECTAVERMELLA    /////////////////////////////////////////////////
    
       if(((_rectaazul.posX)-(_rectaroja.posX)<70 && (_rectaazul.posX)-(_rectaroja.posX)>-70) && ((_rectaroja.posY)-(_rectaazul.posY)<70 && (_rectaroja.posY)-(_rectaazul.posY)>-70)){
    tri _tri = (tri) trilist.get(0);
    _tri.run();
 
       }
       
    
        /////////////////////////////////    TOCADO LINIAazul   -   liniaVERMELLA    /////////////////////////////////////////////////
    
       if(((_liniaazul.posX)-(_liniaroja.posX)<150 && (_liniaazul.posX)-(_liniaroja.posX)>-150) && ((_liniaazul.posY)-(_liniaroja.posY)<150 && (_liniaazul.posY)-(_liniaroja.posY)>-150)){
   //println("tocado");
    
    
    noStroke();
    fill(150,10);
    ellipse(_liniaazul.posX,_liniaroja.posY,5,5);

    }  

      }

      }

  //linialist.remove(i);
  
class liniaazul{
  //variables
float posX, posY, velX, velY, color1, trans, sz;
//constructor
liniaazul(float _posX,float _posY,float _velX,float _velY,float _color1, float _trans, float _sz){
posX = _posX;
posY = _posY;
velX = _velX;
velY = _velY;
color1 = _color1;
trans = _trans;
sz = _sz;


}
  
  void run() {
    update();
    drawing();
  }
  
  void update() {
  velX = random(-1, 1);
  velY = random(-1, 1);

  if (velX==0) {
    velX = random(-1, 1);
  }

  if (velY==0) {
    velY = random(-1, 1);
  }


  posX = posX+velX;
  posY = posY+velY;
  
  
  if (posX-sz/2<0) {
    velX = -velX;
    posX = posX+10;
  }

if (posX+sz/2>width) {
    velX = -velX;
    posX = posX-10;
  }



  if (posY-sz/2<0) {
    velY = -velY;
    posY = posY+10;
  }


if (posY+sz/2>height){
    velY = -velY;
     posY = posY-10;
  }
  
  
  
  
  }
  
  void drawing() {
    fill(color1,trans);
stroke(color1,255,255,trans);
      ellipse(posX, posY, sz, sz);
    
  }

}

class liniaroja{
  //variables
float posX, posY, velX, velY, color1, trans, sz;
//constructor
liniaroja(float _posX,float _posY,float _velX,float _velY,float _color1, float _trans, float _sz){
posX = _posX;
posY = _posY;
velX = _velX;
velY = _velY;
color1 = _color1;
trans = _trans;
sz = _sz;


}
  
  void run() {
    update();
    drawing();
  }
  
  void update() {
  velX = random(-1, 1);
  velY = random(-1, 1);

  if (velX==0) {
    velX = random(-1, 1);
  }

  if (velY==0) {
    velY = random(-1, 1);
  }


  posX = posX+velX;
  posY = posY+velY;
  
  
  if (posX-sz/2<0) {
    velX = -velX;
    posX = posX+10;
  }

if (posX+sz/2>width) {
    velX = -velX;
    posX = posX-10;
  }



  if (posY-sz/2<0) {
    velY = -velY;
    posY = posY+10;
  }


if (posY+sz/2>height){
    velY = -velY;
     posY = posY-10;
  }
  
  
  
  
  }
  
  void drawing() {
    fill(color1,trans);
stroke(255,0,color1,trans);
      ellipse(posX, posY, sz, sz);
    
  }
   
  
}

class rectaazul{
  //variables
float posX, posY, velX, velY, color1, trans, sz, ultimotiempo;
//constructor
rectaazul(float _posX,float _posY,float _velX,float _velY,float _color1, float _trans, float _sz){
posX = _posX;
posY = _posY;
velX = _velX;
velY = _velY;
color1 = _color1;
trans = _trans;
sz = _sz;


}
  
  void run() {

    update();
    drawing();
  
  }
  
  void update() {
  
    
  if(millis()-ultimotiempo>=10000){  
  velX = random(-0.3, 0.3);
  velY = random(-0.3, 0.3);

  if (velX==0) {
    velX = random(-0.3, 0.3);
  }

  if (velY==0) {
    velY = random(-0.3, 0.3);
  }
  ultimotiempo=millis();

  }
    

  posX = posX+velX;
  posY = posY+velY;
  
  
  if ((posX-sz/2<0)||(posX+sz/2>width)) {
    velX = -velX;
    //posX = posX+10;
  }



  if ((posY-sz/2<0)||(posY+sz/2>height)) {
    velY = -velY;
    //posY = posY+10;
  }


  
  }
  
  void drawing() {
    fill(color1,trans);
stroke(color1,255,255,trans);
      ellipse(posX, posY, sz, sz);
    
  }
   
  
}

class rectaroja{
  //variables
float posX, posY, velX, velY, color1, trans, sz, ultimotiempo;
//constructor
rectaroja(float _posX,float _posY,float _velX,float _velY,float _color1, float _trans, float _sz){
posX = _posX;
posY = _posY;
velX = _velX;
velY = _velY;
color1 = _color1;
trans = _trans;
sz = _sz;


}
  
  void run() {

    update();
    drawing();
  
  }
  
  void update() {
  
    
  if(millis()-ultimotiempo>=10000){  
  velX = random(-0.3, 0.3);
  velY = random(-0.3, 0.3);

  if (velX==0) {
    velX = random(-0.3, 0.3);
  }

  if (velY==0) {
    velY = random(-0.3, 0.3);
  }
  ultimotiempo=millis();

  }
    

  posX = posX+velX;
  posY = posY+velY;
  
  
  if ((posX-sz/2<0)||(posX+sz/2>width)) {
    velX = -velX;
    //posX = posX+10;
  }



  if ((posY-sz/2<0)||(posY+sz/2>height)) {
    velY = -velY;
    //posY = posY+10;
  }


  
  }
  
  void drawing() {
    fill(color1,trans);
stroke(255,0,color1,trans);
      ellipse(posX, posY, sz, sz);
    
  }
   
  
}



class tri {
  //variables
  float posX1, posY1, posX2, posY2, posX3, posY3, velX1, velX2, velX3, velY1, velY2, velY3;
  int sizeellipse, color1; 
  //constructor
  tri(float _posX1, float _posY1, float _posX2, float _posY2, float _posX3, float _posY3, float _velX1, float _velX2, float _velX3, float _velY1, float _velY2, float _velY3, int _sizeellipse, int _color1) {

    posX1 = _posX1;
    posY1 = _posY1;
    posX2 = _posX2;
    posY2 = _posY2;
    posX3 = _posX3;
    posY3 = _posY3;
    velX1 = _velX1;
    velX2 = _velX2;
    velX3 = _velX3;
    velY1 = _velY1;
    velY2 = _velY2;
    velY3 = _velY3;
    sizeellipse = _sizeellipse;
    color1 = _color1;
  }
  //funciÃ³n run (la que invocamos des del draw)
  void run() {
    
    update();
    drawing();
  }
  //actualizaciÃ³n (de posiciones, aquÃ­)
  void update() {
  

    
  posX1 = posX1+velX1; //movimiento
  posY1 = posY1+velY1;
  posX2 = posX2+velX2; //movimiento
  posY2 = posY2+velY2;
  posX3 = posX3+velX3; //movimiento
  posY3 = posY3+velY3;
  
   //comprovem la pos X
  if((posX1<0)||(posX1>width)){
    velX1 = -velX1;
  } 
    //comprovem la pos Y
  if((posY1<0)||(posY1>height)){
    velY1 = -velY1;
  } 
  
   //comprovem la pos X
  if((posX2<0)||(posX2>width)){
    velX2 = -velX2;
  } 
    //comprovem la pos Y
  if((posY2<0)||(posY2>height)){
    velY2 = -velY2;
  }
  
   //comprovem la pos X
  if((posX3<0)||(posX3>width)){
    velX3 = -velX3;
  } 
    //comprovem la pos Y
  if((posY3<0)||(posY3>height)){
    velY3 = -velY3;
  }
  
  
  }

  //dibujo
void drawing() {
noStroke();
stroke(color1,1);
fill(color1);


line (posX1, posY1, posX2, posY2);
line (posX2, posY2, posX3, posY3);
line (posX3, posY3, posX1, posY1);
  }
}
