
//Turnig lines by Jean-no, licensed under Creative Commons Attribution-Share Alike 3.0 license.
//Work: http://openprocessing.org/visuals/?visualID=5580
//License: http://creativecommons.org/licenses/by-sa/3.0/

dessin[] dessins;
dessin dessinEnCours;
int[] centre;
float v=4.5;
String mafont;
PFont font;

void setup(){ 
  size(500, 500,P2D);
  font = loadFont ("AgencyFB-Reg-48.vlw");
  textAlign(CENTER);
  fill(0);
  centre = new int[2];
  centre[0]=0;centre[1]=height/9;
  smooth(); 
  dessins = new dessin[0];
}

void draw(){
  background(150);
  
  mafont= "press '8' and '2' to ajust speed. 'c' to clean the screen";
  textFont(font,20);
  text(mafont,250,250);
  
  stroke(78,33,216,75);
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
   float yg=centre[1]+(_y-centre[1])*1.5;
     float[] poin = {centre[0]-_x, PI,_y,yg};
     p = (float[][]) append (p, poin);
  }
  void dessine(){
    fill(211,49,49); 
    for(int a=0;a<p.length;a++){
      p[a][1]+=v; 
      float x=centre[0]+cos(p[a][1])*p[a][0];
      float y=p[a][2]+sin(p[a][1])*45;
      float diff= (45+(p[a][2]-y))/180.0; 
     stroke(150-diff*150,200); 
      line(centre[0],p[a][3],x,y); 
    } 
  }
}

void keyReleased(){
  if(key=='8'){
    v+=0.05;
  }
  if(key=='2'){
    v-=0.05;
  }
  if(key=='c'){
    dessins = new dessin[0];
  }
}
 

