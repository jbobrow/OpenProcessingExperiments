
linia [] b = new linia[20];
linia [] g = new linia[20]; 
linia [] n = new linia[20]; 

void setup(){
  size(1200,800);
  //instanciamos el objeto en medio de la pantalla, con velocidades 40 y tamaÃ±o 20
  for (int i=0; i<b.length;i++) {
    b[i] = new linia(width/2,height/2,1,1,255,10,1);
  } 
  
    for (int i=0; i<g.length;i++) {
    g[i] = new linia(width/2,height/2,1,1,100,10,1);
  }
  
    for (int i=0; i<n.length;i++) {
    n[i] = new linia(width/2,height/2,1,1,0,10,1);
  }
  
  
}

void draw(){
 
    for (int i=0; i<n.length;i++) {
    n[i].run();
  }
  
  
  for (int i=0; i<g.length;i++) {
    g[i].run();
  }
  
  
  for (int i=0; i<b.length;i++) {
    b[i].run();
  }


  
}









class linia{
  //variables
float posX, posY, velX, velY, color1, trans, sz;
//constructor
linia(float _posX,float _posY,float _velX,float _velY,float _color1, float _trans, float _sz){
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
stroke(color1,trans);
      ellipse(posX, posY, sz, sz);
    
  }
   
  
}
