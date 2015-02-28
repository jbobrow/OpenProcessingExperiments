
ArrayList bentuk;
float w;//size

void setup(){
  smooth();
  size(400,400);
  w = 60;
  bentuk = new ArrayList();
  textAlign(CENTER,CENTER);
  ellipseMode(CENTER);
  
  bentuk.add(new Bola(100,100,w));
}//setup

void draw(){
background(200);

  for (int i = bentuk.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Bola bola = (Bola) bentuk.get(i);
    bola.display();

    if (bola.finished()) {
      bentuk.remove(i);
    }//if finished 
  }//for

}//draw

void mousePressed() {
  bentuk.add(new Bola(mouseX-width/2,mouseY-height/2,w));
}

class Bola{
  float x;
  float y;
  float w;
  float speed;
  float jarak;
  float deg;
  float size;
  float grav;
  int warna = int(random(0,255));
  
  Bola(float xr, float yr, float wr){
    x = xr;
    y = yr;
    w = wr;
    speed = 0.02;
    jarak = abs(sqrt((x*x) + (y*y)));
    deg = atan(x/y);//in radians
    grav = 0.1;
  
    if(x>=0){
      if(y>=0){
        deg = -deg;
      }//if
      else{
        //jarak = -jarak;
        deg = -deg + radians(180);
      }//else
    }else{
      if(y>=0){
        deg = -deg;
      }//if
      else{
        //jarak = -jarak;
        deg = -deg + radians(180);
      }//else
    }//else
  }//bola constructor
  
  void display(){
    pushMatrix();
    translate(width/2,height/2);
    size = w * jarak/(width/2);
    deg = deg + speed;
    if(deg >= radians(360)){
      deg = 0;
    }//if
    jarak = jarak - grav;
    rotate(deg);
    fill(#FF7487 * warna);
    ellipse(0,jarak,size,size); 
    //textSize(size/4);
    //fill(0);
    //text("Jannah",0,jarak); 
    popMatrix();
  }//display
  
  boolean finished(){
    if(jarak<=0){
      return true;
    }//if
    else{
      return false;
    }//else
  }//finished
}//bola
