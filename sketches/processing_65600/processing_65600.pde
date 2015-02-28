
int numberofbuttons= (15*4)+2;
public float [] karlred = new float [numberofbuttons];
int nob = numberofbuttons;
public float [] karlgreen = new float[nob];
public float [] karlblue = new float [nob];
public boolean randombuttons = true;
PImage a,b,c,d,f;
int buttonsize = 20;
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
  int _x=15;
  int _y=20;
  if (randombuttons){
    for (int i=0;i<nob;i++){
  _x+=30;
  if(_x>255-30){
    _y+=30;
   _x=15; 
  }
  nbloc[i]=color(_x,_y,255);
    //  nbloc[i]=color(random(width),random(height),255);
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
  smooth();
  // karlred[0]=rec(nbloc[0]);
  placebuttons();
  
}
  
void draw(){
  background(-1);
  
  placebuttons();
 if(mousePressed) nowcolor = get(mouseX,mouseY);
  
 
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
    float dis=dist(mouseX,mouseY,x,y);
    fill(255,0,0);
    if(mousePressed&& dis<=buttonsize/2){
      
      fill(x,y,z);
     nowcolor=color(x,y,z);
   // fill(255,0,0); 
    }
    if(!mousePressed && dis<=buttonsize/2)fill(255,0,0);
    
    PVector kin = maxi(nbloc,"x");
    PVector kin2 = mini(nbloc,"x");
    PVector kiny = maxi(nbloc,"y");
    PVector kiny2 = mini(nbloc,"y");
    
    //this.frame.setTitle(str(kin.y));
    rectMode(CENTER);
    strokeWeight(1);
    if(dis<=7.5)strokeWeight(3);
    if(i==int(kin.z))strokeWeight(3);
    if(i==int(kin2.z))strokeWeight(3);
    if (kin.x==karlred[i])strokeWeight(3);
    if (kiny.y==karlgreen[i])strokeWeight(3);
    if (kin2.x==karlred[i])strokeWeight(3);
    if (kiny2.y==karlgreen[i])strokeWeight(3);
    
    ellipse(x,y,buttonsize,buttonsize);
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


PVector maxi(color [] it2, String what){
 
  int sz=it2.length;
PVector []it =new PVector [sz];
for (int i = 0;i<sz;i++){
  
 color c = it2[i];
float rr=c>>16&255;
float gg =c>>8&255;
float bb = c&255;
it[i]=new PVector(rr,gg,bb);
}
PVector retval = new PVector(0,0,0); 
if(what =="x"){
  retval.x = it[0].x;
  for (int i=0;i<sz;i++){
   if(it[i].x>retval.x){
     retval.x=it[i].x; 
retval.z=i;
   }
  }

}
if(what=="y"){
  
  retval.y = it[0].y;
  for (int i=0;i<sz;i++){
   if(it[i].y>retval.y){
     retval.y=it[i].y; 
retval.z=i;
   }
}

  
}

return retval;
}

PVector mini(color [] it2, String what){
 
  int sz=it2.length;
PVector []it =new PVector [sz];
for (int i = 0;i<sz;i++){
  
 color c = it2[i];
float rr=c>>16&255;
float gg =c>>8&255;
float bb = c&255;
it[i]=new PVector(rr,gg,bb);
}
PVector retval = new PVector(0,0,0); 
if(what =="x"){
  retval.x = it[0].x;
  for (int i=0;i<sz;i++){
   if(it[i].x<retval.x){
     retval.x=it[i].x; 
retval.z=i;
   }
  }

}
if(what=="y"){
  
  retval.y = it[0].y;
  for (int i=0;i<sz;i++){
   if(it[i].y<retval.y){
     retval.y=it[i].y; 
retval.z=i;
   }
}

  
}

return retval;
}
