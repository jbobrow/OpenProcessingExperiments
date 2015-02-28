
  cercle ball1,ball2;
void setup(){
  size(200,200);
  ball1 = new cercle(#FF0000);
  ball2= new cercle(#00FF00);  
 
  

  
}
 void colisio(){
    ball1.colisionat= ball2.colisionat = false;
     if(dist(ball1.x, ball1.y, ball2.x, ball2.y)< ball1.r+ball2.r){
        ball1.colisionat = true;
        ball2.colisionat= true;
     }
 }
     
void draw(){
  background(#ED590E);
  colisio();
  ball1.dibuixa();
  ball1.mou();
  ball2.dibuixa();
  ball2.mou();
 
}
class cercle{
  boolean colisionat;
  float x,y;
  float velx,vely;
  int colors;
  int r;
  
  
  void dibuixa(){
    if(colisionat){
      background (random(255),random(255),random(255));
      
      fill(#0000FF);
      
    }else {
      
      fill(colors);
      
    }
    ellipse(x,y,r*2,r*2);
    ellipse(x,y,r*2,r*2);
   
    
  }
  void mou(){
    x+=velx;
    y+=vely;
    if(x>width-r || x<r){
    velx*=-1;
    }
    if(y>height-r || y<r){
    vely*=-1;
    }
  }
 
  
  cercle(int c){
    r=(int)random(15,25);
    x=random(r,width-r);
    y=random(r,height-r);
    velx=random(-2,2);
    vely=random(-2,2);
    colors=c;
    colisionat = false;
  }
  cercle(int xPos,int yPos,int vel, int col){
    x= xPos;
    y= yPos;
    vely= velx;
    colors= col;
  }
}

