
void WORK() {

  int ival, ival2;
  println("Rule  " + rule) ;

  //==========================================================

  for (int y= 1 ; y< height ; y=y+1) {


    for (int x = 0 ; x < Rwidth ; x++) {   //   FOR WRAPPING THE BORDERS  

      //for (int x = 1 ; x < RwidthM1 ; x++) {   //   NON WRAPPING     1  a RwidthM1

      ival = getNextStateG(x) ;   


      ival2 = valSOM[ival];   
      RANGER[x][1-vSWITCH]= ival2;


      if (ival2 ==0) {    
        stroke(0);
      } 
      else if (ival2 ==1) {    

        stroke(240,0,0);
      } 
      else if (ival2 ==2) {    

        stroke(0,240,0);
      } 
      else if (ival2 ==3) {    
        stroke(0, 0, 240);
      } 
      else if (ival2 ==4) {    
        stroke(240, 240, 0);
      }
      else {
        stroke(255) ;  
      }


      point(x,y) ;  

    }  // x

    vSWITCH = 1 - vSWITCH  ;

  } // y
}
//////////////////////////////////////////



