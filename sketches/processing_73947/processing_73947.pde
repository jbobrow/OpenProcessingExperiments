

int a;
int b;
int c;
int d;
int e;
 


void setup(){

  background(250);
    size(800,600);
  a=0;
  b=0;
  c=0;
  d=0;
  e=0;
}

void draw(){
  
  float randX= int(random(10,800));
 float randY= int(random(10,600));
 
  background(255);
  smooth();
  noFill();
  strokeWeight(15);
  

   
   
  
  if((randX!=200) && (randY!=255) && (a!=1)) {
    
      ellipse(randX,randY,150,150);
  }
  
  else{
  
     stroke(#00BFFF);
  ellipse(200,255,150,150);
 
 a=1;
}


  if((randX!=380) && (randY!=250) && (b!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
  
   stroke(0);
 ellipse(380,250,150,150);
 b=1;
}


if((randX!=560) && (randY!=250) && (c!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
  stroke(#FF0000);
 ellipse(560,250,150,150);
 c=1;
}


if((randX!=290) && (randY!=340) && (d!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
 stroke(#FACC2E);
 ellipse(290,340,150,150);
 d=1;
}

if((randX!=470) && (randY!=340) && (e!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
stroke(#088A29);
 ellipse(470,340,150,150);
 e=1;
  }

}


