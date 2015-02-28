
void setup() {


  size (800, 800); 
  background (255); 






}


void draw () {

  noFill(); 



  pushStyle(); 
  stroke(0, 0, 255); 
  rechteckMalen1(); 
  popStyle(); 


  pushStyle(); 
  stroke(0, 255, 0); 
  rechteckMalen2(); 
  popStyle(); 
 
 
 
 pushStyle(); 
 stroke(255, 0, 0); 
 rechteckMalen3(); 
 popStyle(); 
 
 
 pushStyle(); 
 stroke(255, 255, 0);
rechteckMalen4(); 
 popStyle(); 
 
  pushStyle(); 
 stroke(255, 0, 255);
 rechteckMalen5(); 
popStyle(); 





}




void rechteckMalen1 (){


  //erste Rechtecke, spitze links unten

  for (int r = width; r >= (width/21)*19; r-= width/21){
    rect (width-r, height-r, r,r);  
  }


}


void rechteckMalen2 (){

 
for (int r = (width/21)*16; r <= (width/21)*18; r+= width/21){ 
    rect (width, height/21*3, -r,r);  

  
}
}



void rechteckMalen3 (){


  //erste Rechtecke, spitze links unten

  for (int r = width/21*15; r >= (width/21)*12; r-= width/21){
    
    rect (width/21*6, height/21*3, r,r);  
  }

}



void rechteckMalen4 (){


  //erste Rechtecke, spitze links unten

  for (int r = width/21*11; r >= (width/21)*7; r-= width/21){
    
    rect (width/21*6, height/21*15, r,-r);  
  }

}




void rechteckMalen5 (){


  //erste Rechtecke, spitze links unten

  for (int r = width/21*7; r >= (width/21)*1; r-= width/21){
    
    rect (width/21*13, height/21*15, -r,-r);  
  }

}





