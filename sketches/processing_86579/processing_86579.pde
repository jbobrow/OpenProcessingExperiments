
page[] Pages;int offset=0;int oldOffset=0;
float[] pos;float[] pos2;
float epaisseur=1;

void setup(){
  size(800,600);
  background(255);
  Pages = new page[0];
  new page(); 
  fill(0);
  pos = new float[0];
  pos2 = new float[0];
}

void draw(){
  Pages[offset].affiche();
  String texte = "Right and left arrows to circulate betweet the pages. Spacebar to create a new page, suppr or backspace to erase.";
 texte+="\nThe line's weight can be changed using + and - keys. Page "+(offset+1);
  text(texte, 10,height-30);
}

class page{
  PGraphics img;
  page(){
    img=createGraphics(width, height, JAVA2D);
    img.beginDraw();
    img.background(250);
    img.smooth();
    img.endDraw(); 
    Pages = (page[]) append(Pages, this);
  }
  void affiche(){
    float x=0;
    if(pos.length>0){
       background(250);
      x = pos[0];float x2=pos2[0];
      pos = (float[]) subset(pos,1);
      pos2 = (float[]) subset(pos2,1); 
      Pages[oldOffset].afficheOld(x2);
    }
    image(img, x,0);
  }
  void dessine(int x1, int y1, int x2, int y2){
    img.beginDraw();
    img.strokeWeight(epaisseur);
    img.line(x1,y1,x2,y2);
    img.endDraw(); 
  }
  void afficheOld(float x){
    image(img,x,0);
  }
  void efface(){
     img.beginDraw();
    img.background(250);
    img.endDraw();
  }
}

void mouseDragged(){
  Pages[offset].dessine(pmouseX, pmouseY, mouseX, mouseY);
}

void keyReleased(){
     oldOffset=offset;
   if(keyCode==37 && Pages.length>1){
     offset++;
     if(offset>Pages.length-1){
       offset=0;
     }
      pos = positions(-width, 0, 20);
      pos2 = positions(0, width, 20);
   }
   if(keyCode==39 && Pages.length>1){
     offset--;
     if(offset<0){
       offset=Pages.length-1;
     }
       pos = positions( width, 0, 20);
       pos2 = positions( 0, -width, 20);
   }
   if(key==' '){
     new page(); 
     offset = Pages.length-1; 
       pos = positions( width, 0, 20);
       pos2 = positions( 0, -width, 20);
   }
   if(keyCode==127 || keyCode==8){
     Pages[offset].efface();
   }
   if(key=='+'){epaisseur+=0.5;epaisseur*=1.05;}
   if(key=='-'){epaisseur*=0.8;}
   epaisseur = constrain(epaisseur, 0.2, 20);
}

float[] positions(float depart, float fin, int n){
  float d = (fin-depart)/n;
  float[] toreturn = new float[n];
  for(int a=0;a<n;a++){
    toreturn[a] = depart+a*d;
  }
  return toreturn;
}
