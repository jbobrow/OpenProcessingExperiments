
poin[] points;
int nombre;
boule baballe;PFont mafonte;

void setup(){
  mafonte=createFont("arial",10,false);
  textFont(mafonte,10);
  size(500,500);
  stroke(155 );
  strokeWeight(1);
  background(0);
  smooth();
  nombre=floor(random(4,8));
  demarre();
}

void demarre(){ 
  points = new poin[nombre]; 
  float angs=360/nombre;
  for(int a=0;a<nombre;a++){
    points[a]=new poin(a*angs) ;
  }
  baballe=new boule(250,50, 80);
}

void draw(){
  background(0); 
  ellipseMode(CENTER);
  fill(155,100);
  beginShape(); 
  for(int a=0;a<points.length;a++){
    poin p=points[a];
    p.avance();
    vertex(p.x, p.y);
  }
  endShape(CLOSE);
  ellipse(250,250,30,30);
  ellipse(250,250,10,10);
  line(245,250,150,500);
  line(255,250,350,500);
  line(250,235 ,0,235+random(-0.1,0.5));
  line(250,265 ,0,265+random(-0.5,0.1));
  baballe.dessine();
  fill(155 );
  text("Hit ' + ' to increase the number\nof sides of the shape.\nHit ' - ' to decrease this number.", 10,10);
}

class poin {
  float x,y, a, v ;
  poin (float ang){
    a=ang/(180.0/PI);
    v=2/(180.0/PI);
    x=250;
    y=250; 
  }
  void avance(){
    a+=v;
    x=250+cos(a)*100;
    y=250+sin(a)*100;
  }
}

class boule{
  float l,   y; 
  int dl, x;
  boule(int ix,int ig, int el){
    x=ix;
    y=ig;
    l=el;
    dl=int(el/2)+2;
  }
  void dessine(){
    y+=3;  
    while(brightness(get(x,int(y+dl)))!=0){
      y-=0.01;  
    }
    ellipse(x,y,l,l);
    ellipse(x,y,l*0.3,l*0.3);
    rect(x-5,0,10,y);
  }
}

void keyPressed(){
  if(key=='+'){
    nombre++;nombre=constrain(nombre,3,30);demarre();
  }
  if(key=='-'){
    nombre--;nombre=constrain(nombre,3,30);demarre();
  }
}
  


