
int diameter=20;
int positionX=(100);
int Switch=0;
int positionY=(100);

void setup(){
  size(400,400);
}

void draw(){
  background(25,50,150);
  
  if(positionY>=height-diameter/2){
    Switch=1;
  }
  if(positionY==diameter/2){
    Switch=0;
  }
  if(Switch==0){
    //positionX++; 
    positionY=positionY+5;
  
   
  }else if(Switch==1){
    positionY=positionY-5;
  }
  
 
 ellipse(200,positionY,diameter,diameter); 

 
}


