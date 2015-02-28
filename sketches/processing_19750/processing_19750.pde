
PFont txt;
float lx=0;
float ly=0;
float sevenx=0;
float seveny=0;
float Px=0;
float Py=0;
float Thx=0;
float Thy=0;
float Rx=0;
float Ry=0;
float Nix=0;
float Niy=0;

boolean L=false;
boolean seven=false;
boolean P=false;
boolean Th=false;
boolean R=false;
boolean Ni=false;

float Lr=random(250);
float Sr=random(250);
float Pr=random(250);
float Tr=random(250);
float Rr=random(250);
float Nr=random(250);


void setup(){
  size(250,250);
  smooth();
  frameRate(24);
  txt = loadFont("Cambria-Bold-48.vlw");
}

void draw(){
  background(120,50,30);
  
  fill(255);
  textFont(txt,60);
  text("L",Lr+lx,Sr+ly);
  text("7",Sr+sevenx,Pr+seveny);
  text("P",Pr+Px,Tr+Py);
  text("3",Tr+Thx,Rr+Thy);
  text("R",Rr+Rx,Nr+Ry);
  text("9",Nr+Nix,Lr+Niy);
  
  textFont(txt,60);
}

void keyPressed(){
   if(key=='a') if(L) {lx+=-1;} 
   if(key=='s') if(L) {ly+=1;}  
   if(key=='d') if(L) {lx+=1;}  
   if(key=='w') if(L) {ly+=-1;} 
   
   if(key=='a') if(seven) {sevenx+=-1;}
   if(key=='s') if(seven) {seveny+=1;}
   if(key=='d') if(seven) {sevenx+=1;}
   if(key=='w') if(seven) {seveny+=-1;}
   
   if(key=='a') if(P) {Px+=-1;}
   if(key=='s') if(P) {Py+=1;}
   if(key=='d') if(P) {Px+=1;}
   if(key=='w') if(P) {Py+=-1;}
   
   if(key=='a') if(Th) {Thx+=-1;}
   if(key=='s') if(Th) {Thy+=1;}
   if(key=='d') if(Th) {Thx+=1;}
   if(key=='w') if(Th) {Thy+=-1;}
   
   if(key=='a') if(R) {Rx+=-1;}
   if(key=='s') if(R) {Ry+=1;}
   if(key=='d') if(R) {Rx+=1;}
   if(key=='w') if(R) {Ry+=-1;}
   
   if(key=='a') if(Ni) {Nix+=-1;}
   if(key=='s') if(Ni) {Niy+=1;}
   if(key=='d') if(Ni) {Nix+=1;}
   if(key=='w') if(Ni) {Niy+=-1;}
   
   
   if (key=='l'){ 
    if(L) {L=false;} else if(!L) {L=true;}}
   if (key=='7'){ 
    if(seven) {seven=false;} else if(!seven) {seven=true;}}
   if (key=='p'){ 
    if(P) {P=false;} else if(!P) {P=true;}}
   if (key=='3'){ 
    if(Th) {Th=false;} else if(!Th) {Th=true;}}
   if (key=='r'){ 
    if(R) {R=false;} else if(!R) {R=true;}}
   if (key=='9'){ 
    if(Ni) {Ni=false;} else if(!Ni) {Ni=true;}}

}

