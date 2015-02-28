
int J;
int e;
int s;
int i;
PFont minom;
  
void setup(){
 
  background(250);
    size(800,600);
  J=0;
  e=0;
  s=0;
  i=0;
  
  minom=loadFont ("ACaslonPro-Italic-70.vlw");
  
  frameRate(50);
  ;

}
 
void draw(){
   
  float randX= int(random(10,800));
 float randY= int(random(10,600));
  
  background(0);
  smooth();
  strokeWeight(15);
   
 
    
    
   
  if((randX!=200) && (randY!=255) && (J!=1)) {
     
      text("J",randX,randY);
  }
   
  else{
   
     stroke(#00BFFF);
  text("J",200,255);
  
 J=1;
}
 
 
  if((randX!=380) && (randY!=250) && (e!=1)){
     
      text("e",randX,randY);
  }
   
  else{
   
   stroke(0);
 text("e",300,255);
 e=1;
}
 
 
if((randX!=560) && (randY!=250) && (s!=1)){
     
      text("s",randX,randY);
  }
   
  else{
  stroke(#FF0000);
 text("s",400,255);
 s=1;
}
 
 
if((randX!=470) && (randY!=340) && (i!=1)){
     
       text("i",randX,randY);
  }
   
  else{
stroke(#088A29);
 text("i",500,255);
 i=1;
  }
 
}
