
//Firetype///Public Domain, 2011//Another experiment with type/////////////////Alejandro González, a(en)60rpm.tv
///////////////////////////////////////////////////////////////////////////////
//This sketch is set in ChunkFive, more professional and lovely free fonts here:
//TheLeagueofMoveableType.com//////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

import geomerative.*;           

RFont f;
RGroup r;
RPoint[] p;
int w,h,                         //displaying settings
sc=30,                           //scale factor (for the noise) 
t=30,                            //counter for the noise iteration
c=360,                           //HSB range
ts,                              //text size-1
ti=75;                           //size of text   
float nfac=5e-3,                 //initial 'precision' factor (for the noise)
a_step,                          //value for stepping the alpha                        
n_det=0f,                        //initial noise detail
nd_step=5e-3,
nfac_step=5e-5,
alf=150f;

String txt="firehipnopsis*",
font="Chunk.ttf";
color bg=#000000;

void setup(){
  size(900,300,P2D);colorMode(HSB,c);background(bg);smooth();noiseDetail(1);noCursor();   //basic settings
  w=width/2; h=floor(height*.75); a_step=alf/t;                                           //variable settings
  RG.init(this);f = new RFont(font,ti,RFont.CENTER);i();                                  //library settings
}


void draw(){
  fill(bg,80);rect(0,0,width,height);noFill();  //classical motion tip                    
  if (p!=null){
    for (int i=0;i<p.length;i++){ 
      PVector or=new PVector(w+p[i].x,h+p[i].y);  //initial point
      beginShape();
      for (int j=0;j<t;j++){
        stroke(j*a_step,c*.9,c,alf-j*a_step);     //add some 'fire' colours
        vertex(or.x+=n(or.x,or.y,sc-j).x,or.y+=n(or.x,or.y,sc-j).y);  //we'll add vertexes recursively to the original point, adding a noise factor
      }
    endShape();
    }
  nfac+=nfac_step;            //let's wind the fire
  alf*=.99;                   //an elegant way of ending the sketch before noise madness :-)
  }
}

//Noise method
PVector n(float x,float y,float e){
  float nx=e*(noise(x*nfac,y*nfac,0)-.5);
  float ny=e*(noise(x*nfac,y*nfac,1)-.5);
  return new PVector(nx,ny);
}

//Reset method, useful mostly for updating the text with the keyboard -- uncomment the section below
void i(){
  r= f.toGroup(txt);
  ts=txt.length()-1;
  RCommand.setSegmentLength(2);  
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  p = r.getPoints(); //in p we store the points that shape the font
}

/*void keyPressed(){
  if(key==BACKSPACE && ts>-1){
    txt=txt.substring(0,ts); 
  }else if (keyCode==UP){
    ti++;
    f = new RFont(font,ti,RFont.CENTER);
    i();
  }else if (keyCode==DOWN){
    ti--;
    f = new RFont(font,ti,RFont.CENTER);
    i();
  }else{
    txt+=key;
  }
  i();
}

void mouseClicked(){
  switch(mouseButton){
    case(LEFT):
      save("firetype-"+millis()+".tif");  //using millis as fast 'hash-key'
      break;
  } 
}*/

