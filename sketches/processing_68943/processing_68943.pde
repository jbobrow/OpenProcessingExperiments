

int euro;
int asia;
int afri;
int oce;
int ame;

void setup(){

  background(255);
    size(800,600);
  euro=0;
  asia=0;
  afri=0;
  oce=0;
  ame=0;
}

void draw(){
  
  float randX= int(random(10,800));
 float randY= int(random(10,600));
 
  background(255);
  smooth();
  noFill();
  strokeWeight(40);
 
  if((randX!=200) && (randY!=255) && (euro!=1)) {
    
      ellipse(randX,randY,150,150);
  }
  
  else{
  
     stroke(6,150,196);
  ellipse(200,255,150,150);
 
 euro=1;
}


  if((randX!=380) && (randY!=250) && (asia!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
  
   stroke(0);
 ellipse(380,250,150,150);
 asia=1;
}


if((randX!=560) && (randY!=250) && (afri!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
  stroke(255,3,3);
 ellipse(560,250,150,150);
 afri=1;
}


if((randX!=290) && (randY!=340) && (oce!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
 stroke(255,233,31);
 ellipse(290,340,150,150);
 oce=1;
}

if((randX!=470) && (randY!=340) && (ame!=1)){
    
      ellipse(randX,randY,150,150);
  }
  
  else{
stroke(0,227,54);
 ellipse(470,340,150,150);
 ame=1;
  }

}


