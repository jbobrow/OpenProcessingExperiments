
int foco=10;    // width of stream
int largo=50;   // max length of ray
float angulo;    // angle for easing
int equis;       // position of emanator
int igriega;
float pointlu=100;  // luminance of point
float emacolor;    // color of the rays
boolean started=false;
 
void setup(){
  size(800,450);
  smooth();
  colorMode(HSB,360,100,100);
  background(27,91,10);
}
 
void draw(){
  if (started==true){
  stroke(0,0,pointlu,200); 
  point(mouseX,mouseY);
  point(width-mouseX,height-mouseY);
  }
   
  if (mousePressed == true){
    equis=mouseX;
    igriega=mouseY;
    noCursor();
    emacolor=random(50,100);
    started=true;  
  }
    
  if (keyPressed==true){
    if (keyCode==RIGHT && foco<180){    // length of ray beam
    foco+=1;
    largo+=3;
    } else if (keyCode==LEFT && foco>0){
    foco-=1;
    largo-=3;
    
    } else if (key==CODED){    // brightness of points
      if(keyCode==CONTROL){
        pointlu=random(0,10);
      }}
      }
   if (keyPressed==false){
     pointlu=random(90,100);
   } 
  if (equis!=0 && igriega!=0){
    emanator(equis,igriega,emacolor,0);
    emanator(width-equis,height-igriega,emacolor+90,PI);
  }
}
 
void emanator(int x,int y,float colo, float offs){
   
  // easing of the rotation
  int speed=abs((mouseX-pmouseX)+(mouseY-pmouseY));
  float easing=(1-map(speed,0,50,0.05,0.99));
  easing=pow(easing,8);
   
  float targetAngl=atan2(mouseY-y,mouseX-x);
  float dir = (targetAngl - angulo) / TWO_PI;
  dir -= round( dir );
  dir *= TWO_PI;
  if (abs(dir)>1){
    angulo+=dir*easing+offs;
  }
   
  for (int i=0; i<=2*foco; i+=3){
    pushMatrix();
    translate(x,y);
    rotate(angulo+i-foco+random(0.01));
    strokeWeight(random(7));
    stroke(colo,random(10,50),random(50,80),20);
    line(0,0,random(largo),0);
    popMatrix();
  }
  fill(colo,random(20,50),random(50,100));
  ellipse(x,y,random(5,6),random(5,6));
}
 
void keyPressed(){
  if (key==ENTER || key==RETURN){
    int m=minute();
    int s=second();
    saveFrame("emana"+m+s+".png");
  }
  if (key=='z' || key=='Z') {
   background(27+random(360),91,10);
   equis=-50;
   igriega=-50;
   }}    
  

  
  
                
                                                                                                
