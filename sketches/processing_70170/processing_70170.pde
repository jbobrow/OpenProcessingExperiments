

int m=0;
int a=0;
int r=0;
int i=0;
int o=0;


int aroXm;
int aroYm;
int aroXa;
int aroYa;
int aroXr;
int aroYr;
int aroXi;
int aroYi;
int aroXo;
int aroYo;


int letraOxfinal;

PFont miVariableTipo; 
PFont miVariableTipo2;

void setup(){
  size(550,330);
  smooth();
  background(255);
  miVariableTipo=loadFont("Serif-48.vlw");
  miVariableTipo2=loadFont("ACaslonPro-Bold-48.vlw");
  
  

}

void draw(){
 // noLoop();
  
  textFont(miVariableTipo,100);
  

aroXm = int(random(550));
aroYm = int(random(330));
aroXa = int(random(550));
aroYa = int(random(330));
aroXr = int(random(550));
aroYr = int(random(330));
aroXi = int(random(550));
aroYi = int(random(330));
aroXo = int(random(550));
aroYo = int(random(330));
  
letraOxfinal = 265;
   background(0);
 
  textFont(miVariableTipo,100);
  fill(255);
  

// letra M
if ((aroXm!=80) && (aroYm!=180) && m!=1){
   text("M", aroXm,aroYm); 
}
else{
   text("M", 80,180);
  m=1;  
 }
  
  
// letra A
if ((aroXa!=150) && (aroYa!=180) && a!=1){
   text("A", aroXa,aroYa); 
}
else{
   text("A", 150,180);
  a=1;  
 }
 
// letra R
if ((aroXr!=200) && (aroYr!=180) && r!=1){
   text("R", aroXr,aroYr);
}
else{
   text("R", 200,180);
  r=1;  
 }
 
// letra I
if ((aroXi!=250) && (aroYi!=180) && i!=1){
   text("I", aroXi,aroYi);
}
else{
   text("I", 250,180);
  i=1;  
 }
 
// letra O
if ((aroXo!=265) && (aroYo!=180) && o!=1){
   text("O", aroXo,aroYo); 
}
else{
   text("O", letraOxfinal ,180);
  o=1;  
 }



if (o==1) {
  
   text("A", 150 ,300);
   
     fill(0);
     stroke(10);
     strokeWeight(20);
      textFont(miVariableTipo,100);
   text("A", 150 , 180);
}


 


 



}

