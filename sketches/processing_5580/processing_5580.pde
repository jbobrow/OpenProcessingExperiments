
dessin[] dessins;
dessin dessinEnCours;
int[] centre;
float v=0.05;
PFont mafont;

void setup(){ 
  size(500, 500,P2D);
  mafont=createFont("arial",10,false);
  textFont(mafont,10);
  textAlign(RIGHT, BOTTOM);
  fill(0);
  centre = new int[2];
  centre[0]=width/2;centre[1]=height/2;
  smooth(); 
  dessins = new dessin[0];
}

void draw(){
  background(255);
  text("press '+' and '-' to ajust speed. 'r' to clean the screen",width-2,height-2);stroke(0,0,100,80);
  line(centre[0],0,centre[0],height);
  if(dessinEnCours!=null){
    dessinEnCours.ajoutePoint(mouseX,mouseY);
  }
  for(int a=0;a<dessins.length;a++){
    dessins[a].dessine();
  }
}

void mousePressed(){
  dessinEnCours = new dessin(mouseX,mouseY);
}

void mouseReleased(){
  dessinEnCours=null;
}

class dessin{
   float[][] p;  
  dessin(int _x, int _y){
     p = new float[0][3];
     ajoutePoint(_x,_y);
     dessins = (dessin[]) append (dessins, this);
  }
  void ajoutePoint(int _x, int _y){
   float yg=centre[1]+(_y-centre[1])*0.5;
     float[] poin = {centre[0]-_x, PI,_y,yg};
     p = (float[][]) append (p, poin);
  }
  void dessine(){
    noFill(); 
    for(int a=0;a<p.length;a++){
      p[a][1]+=v; 
      float x=centre[0]+cos(p[a][1])*p[a][0];
      float y=p[a][2]+sin(p[a][1])*30;
      float diff= (30+(p[a][2]-y))/60.0; 
     stroke(255-diff*255,200); 
      line(centre[0],p[a][3],x,y); 
    } 
  }
}

void keyReleased(){
  if(key=='+'){
    v+=0.025;
  }
  if(key=='-'){
    v-=0.025;
  }
  if(key=='r'){
    dessins = new dessin[0];
  }
}
 

