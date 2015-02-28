
int diameter=20;
int positionX=(100);
int Switch=0;

void setup(){
  size(400,400);
}

void draw(){
  background(25,50,150);
  
  if(positionX>=width-diameter/2){
    Switch=1;
  }
  if(positionX==diameter/2){
    Switch=0;
  }
  if(Switch==0){
    //positionX++; 
    positionX=positionX+5;
  
   
  }else if(Switch==1){
    positionX--;
  }
  
 
 ellipse(positionX,200,diameter,diameter); 

 
}


