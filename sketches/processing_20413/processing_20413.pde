
int numberofbuttons= 15*4;
public float [] karlred = new float [numberofbuttons];
int nob = numberofbuttons;
public float [] karlgreen = new float[nob];
public float [] karlblue = new float [nob];
public boolean randombuttons = false;
PImage a,b,c,d,f;
public color [] nowbuttonlocations = new color [nob];
public color[] nbloc = new color [nob];
//void savelocations(){
// a=createGraphics(nob/2,nob/2,ARGB);
//a
//}
 
void keyPressed(){
  if(key=='r')setup();
}
void setup(){
 
  // nbloc[0]=color(45,45,255);
  // nbloc[1]=color(90,45,255);
  if (randombuttons){
    for (int i=0;i<nob;i++){
 
      nbloc[i]=color(random(width),random(height),255);
    }
  }
  int _a=0;
  int _b=15;
  int _c=30;
  int _d = 45;
  if (!randombuttons){
    for (int i=0;i<width;i+=45){
      nbloc[_a]=color(45+(i/2),45,255);
      _a++;
      nbloc[_b]=color(45+(i/2),height-45,255);
      _b++;
      nbloc[_c]=color(45,45+(i/2),255);
      _c++;
      nbloc[_d]=color(width-45,45+(i/2),255);
      //  nbloc[_c]=color(i*15,height-45,255);
      _d++;
    }
  }
  size(255,255);
  // karlred[0]=rec(nbloc[0]);
  placebuttons();
 
}
 
void draw(){
  background(-1);
 
  placebuttons();
  nowcolor = get(mouseX,mouseY);
 

}
 
void placebuttons(){
  for (int i=0;i<nob;i++){
    //int x=red(
    karlred[i]=red(nbloc[i]);
    karlgreen[i]=green(nbloc[i]);
    karlblue[i]=blue(nbloc[i]);
    float x= karlred[i];
    float y  = karlgreen[i];
    float z = karlblue[i];
    fill(x,y,z);
    rectMode(CENTER);
    rect(x,y,15,15);
  }
}
boolean mr=false;
boolean mu=true;
 
void mousePressed(){
  mr=false;
  mu=false;
  domove();
}
public color nowcolor;
void domove(){
  if (!mu){
    for (int i=0;i<nob;i++){
      if (nowcolor == nbloc[i]){
        nbloc[i]=nowcolor;
      }
    }
  }
}
void mouseDragged(){
  mu=false;
  mr=false;
  for (int i=0;i<nob;i++){
    if (nowcolor == nbloc[i]){
      nowcolor = color(mouseX,mouseY,255);
      nbloc[i]=nowcolor;
    }
  }
  //domove();
}
 
void mouseReleased(){
  mu=true; 
  mr = true;
}
                
                
