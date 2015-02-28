
public int w= 255*3;
public int h =255*2;
public int showmode=1;
int numberofbuttons = 4;
String orientation = "vertical";
int _rectmode = 1; //1 or 2
String rectmode = "CENTER"; //1 = CENTER 2=CORNER 3 = CENTER2
public PImage _buttonmap_;
public color [] buttonlocations = new color[numberofbuttons];
public color [] nowbuttonlocations = new color[numberofbuttons];
public int [] raiseupx = new int[numberofbuttons];
public int [] raiseupy = new int[numberofbuttons];
public int [] raiseupz = new int[numberofbuttons];
public int stepval = 15;
public int numberofsections = 255/stepval; //i.e  Seventeen [17]
boolean loadmap =true;
 
String verticalsourcepoints = "http://1.bp.blogspot.com/_YN3-mOToAD0/TVC6Z7ezXxI/AAAAAAAAAOQ/tx40minqK04/s400/verticalmapfile.png";
String horizontalsourcepoints = "http://3.bp.blogspot.com/_YN3-mOToAD0/TVC6Z_K1x-I/AAAAAAAAAOI/K1RAHOq0w9c/s400/horizontalmapfile.png";
String mapfile =horizontalsourcepoints;

//horizontal


//"c:\\data\\mapfile.png";
public float [] karlred= new float [numberofbuttons];
public float [] karlgreen = new float [numberofbuttons];
public float [] karlblue = new float [numberofbuttons];
void setup(){
  if (showmode==1) mapfile =horizontalsourcepoints;
  if (showmode==2)mapfile = verticalsourcepoints;
 size(255,255,P3D);
 w=width;
 h=height;
background(128); 
  int _w=0;
 int _h;
 if (numberofbuttons>255){
   w=255;
  _h = int(numberofbuttons/255)+1; 
 }
 else
 {
  w=numberofbuttons;
 _h=1; 
 }
 if (!loadmap) _buttonmap_ = createImage(_w,_h,ARGB);
 if(loadmap){
   _buttonmap_=loadImage(mapfile);
  nowbuttonlocations  = new color[_buttonmap_.pixels.length];
// println(cg(_buttonmap_.pixels[1]));
 for (int x=0;x<_buttonmap_.pixels.length;x++){
  nowbuttonlocations[x]=_buttonmap_.pixels[x]; 
  buttonlocations[x] = nowbuttonlocations[x];
 }
 //arraycopy(_buttonmap_.pixels,nowbuttonlocations);
     //nowbuttonlocations[0]=_buttonmap_.get(3,1);
    // nowbuttonlocations[1]=color(5,3,255);
    // nowbuttonlocations[2]=color(7,3,255);
    // nowbuttonlocations[3]=color(9,3,255);
 }
 if (!loadmap){
 //vertical
 if (orientation=="horizontal"){
     nowbuttonlocations[0]=color(3,3,255);
     nowbuttonlocations[1]=color(5,3,255);
     nowbuttonlocations[2]=color(7,3,255);
     nowbuttonlocations[3]=color(9,3,255);
    }
  //horizontal
  if (orientation =="vertical"){
     nowbuttonlocations[0]=color(3,3,255);
     nowbuttonlocations[1]=color(3,5,255);
     nowbuttonlocations[2]=color(3,7,255);
     nowbuttonlocations[3]=color(3,9,255);
  }
 }
 
  for (int x=0;x<nowbuttonlocations.length;x++){
  buttonlocations[x] = nowbuttonlocations[x];
 }
// if(loadmap){
//  if (_buttonmap_.pixels.length==nowbuttonlocations.length){
// arraycopy(_buttonmap_.pixels,nowbuttonlocations);
//  }   
//  else
//  {
//    if(_buttonmap_.pixels.length>=nowbuttonlocations.length){
//   for (int i=0;i<nowbuttonlocations.length;i++){
//    nowbuttonlocations[i]=_buttonmap_.pixels[i];
//   } 
// 
//
//    }
//  }

// }
 nowbuttonlocations = extract(nowbuttonlocations);
 for (int i=0;i<nowbuttonlocations.length;i++){
   color c = nowbuttonlocations[i];
  karlred[i]=cr(c); 
  karlgreen[i]=cg(c);
  karlblue[i]=cb(c);
 }
 displaybuttons(_buttonmap_ ,nowbuttonlocations,2);
  makelines();
 if(!loadmap && !online) saveButtons(mapfile, _buttonmap_,nowbuttonlocations);
}

void keyPressed(){
 if (key=='s' && !online) {
  saveButtons(mapfile, _buttonmap_, buttonlocations) ;
 }
 
 if (key=='1'){
  _rectmode=1;
 rectmode = "CENTER"; 
 showmode=1;
 }
 if (key=='2'){
  _rectmode = 2;
 rectmode = "CORNER";
showmode=2; 
 }
  
  
  if (key=='r')setup();
}
void loadButtons(String where,PImage buttonmap,color [] buttonarray ){
 if (where !=null){
  buttonmap =loadImage(where);
  
 }
}

void saveButtons(String where, PImage buttonmap, color [] buttonarray){
//  PImage buttonmap2=createImage(buttonmap.width,buttonmap.height,ARGB);
//  if (where !=null){
//    for (int i=0;i<numberofbuttons;i++){
//     buttonmap2.pixels[i]= buttonarray[i];
//     
//    }
//  }
 PGraphics savingplacemap;
 int _w=0;
 int _h;
 if (numberofbuttons>255){
   w=255;
  h = int(numberofbuttons/255)+1; 
 }
 else
 {
  w=numberofbuttons;
 h=1; 
 }
 // nowbuttonlocations = insert(nowbuttonlocations);
savingplacemap = createGraphics(w,h,P3D);
savingplacemap.loadPixels();
savingplacemap.beginDraw();
for (int x=0;x<numberofbuttons;x++){
  color c =   buttonlocations[x];
println(cr(c)+","+cg(c)+","+cb(c));
 savingplacemap.pixels[x]=c;
 //buttonarray[x]; 
}

savingplacemap.endDraw();
savingplacemap.updatePixels();
savingplacemap.save(mapfile);
}

boolean mr = false;

void mouseReleased(){
 mr = true; 
}
void makebuttons(String where){
 
 
 if (where !=null && mr){
  
   mr=false;
 } 
}
void drawbuttons(PImage karl){
  
  
  
}

color[] extract(color  []src){
  color [] target = new color [src.length];
  for (int i=0;i<src.length;i++){
  float rr = cr(src[i]);
  float gg = cg(src[i]);
  float bb = cb(src[i]);
  
//  if (rectmode=="CENTER" || _rectmode ==1){
//    target[i]=color((stepval*rr)+int(stepval/2)+1,(stepval*gg)+int(stepval/2)+1,(stepval*bb)+int(stepval/2)+1);
//    
//  }
 if (rectmode == "CENTER" ||  _rectmode ==1){
      target[i]=color((stepval*rr)-(stepval*1.5),(stepval*gg)-(stepval*1.5),(stepval*bb)-(stepval*1.5));
  
  }
  
  if (rectmode == "CENTER2" ||  _rectmode ==3){
      target[i]=color((stepval*rr)-(stepval/2),(stepval*gg)-(stepval/2),(stepval*bb)-(stepval/2));
  
  }
  
  if (rectmode == "CORNER" ||  _rectmode ==2){
      target[i]=color((stepval*rr)-stepval,(stepval*gg)-stepval,(stepval*bb)-stepval);
  
  }
  }
  return target;
}

color[] insert (color  []src){
  color [] target = new color [src.length];
  for (int i=0;i<src.length;i++){
  float rr = cr(src[i]);
  float gg = cg(src[i]);
  float bb = cb(src[i]);
  
//  if (rectmode=="CENTER" || _rectmode ==1){
//    target[i]=color((stepval*rr)+int(stepval/2)+1,(stepval*gg)+int(stepval/2)+1,(stepval*bb)+int(stepval/2)+1);
//    
//  }
 if (rectmode == "CENTER" ||  _rectmode ==1){
      target[i]=color(5,6,7);
  
  }
  
  if (rectmode == "CENTER2" ||  _rectmode ==3){
      target[i]=color((rr/stepval)+(stepval/2),(gg/stepval)+(stepval/2),(bb/stepval)+(stepval/2));
  
  }
  
  if (rectmode == "CORNER" ||  _rectmode ==2){
      target[i]=color((rr/stepval)+stepval,(gg/stepval)+stepval,(bb/stepval)+stepval);
  
  }
  }
  return target;
}

