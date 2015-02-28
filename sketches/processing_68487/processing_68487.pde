
int uno;
int dos;
int tres;
int cuatro;
int cinco;
 


void setup(){

  background(250);
    size(800,600);
  uno=0;
  dos=0;
  tres=0;
  cuatro=0;
  cinco=0;
}

void draw(){
  
  float randX= int(random(10,800));
 float randY= int(random(10,600));
 
  background(255);
  smooth();
  noFill();
  strokeWeight(15);
  

   
   
  
  if((randX!=200) && (randY!=255) && (uno!=1)) {
    
      ellipse(randX,randY,150,150);
  }
  
  else{
  
     stroke(#00BFFF);
  ellipse(200,255,150,150);
 
 uno=1;
}


  if((randX!=380) && (randY!=250) && (dos!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
  
   stroke(0);
 ellipse(380,250,150,150);
 dos=1;
}


if((randX!=560) && (randY!=250) && (tres!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
  stroke(#FF0000);
 ellipse(560,250,150,150);
 tres=1;
}


if((randX!=290) && (randY!=340) && (cuatro!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
 stroke(#FACC2E);
 ellipse(290,340,150,150);
 cuatro=1;
}

if((randX!=470) && (randY!=340) && (cinco!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
stroke(#088A29);
 ellipse(470,340,150,150);
 cinco=1;
  }

}
