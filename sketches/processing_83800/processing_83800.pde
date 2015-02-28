


void segment(int BodyType, int BodySide, int JointID) {

  
 
  
  
  if (Tut[BodyType][BodySide][JointID][0][0] == 1) {
    //Get new angle
    //( CheckBeat()  ) &&
    
    if ( (Tut[BodyType][BodySide][JointID][5][0] == 1 )) { 

      ///////Get ne value///////////
      getNewValue(BodyType, BodySide,  JointID);
      ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //Aufruf zur aktualisierung der matrix
      Tut[BodyType][BodySide][JointID][1][4] = Tut[BodyType][BodySide][JointID][1][1] - Tut[BodyType][BodySide][JointID][1][0]; 

      if ( (JointID >-1) && (JointID <7))   GetAngleElbow(BodyType,BodySide,JointID);
      // 
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////     


      Tut[BodyType][BodySide][JointID][1][2] = Tut[BodyType][BodySide][JointID][1][0];
      /////////////////////
      Tut[BodyType][BodySide][JointID][5][2] = abs(Tut[BodyType][BodySide][JointID][1][0] - Tut[BodyType][BodySide][JointID][1][1]) / Tut[BodyType][BodySide][JointID][2][2];



      Tut[BodyType][BodySide][JointID][5][0] = 0; 
      Tut[BodyType][BodySide][JointID][5][1] = 0;
    }

    //Animate Angle
    Tut[BodyType][BodySide][JointID][5][3] = 0;

    if (Tut[BodyType][BodySide][JointID][5][0] == 0) { 
      if (Tut[BodyType][BodySide][JointID][1][1] < Tut[BodyType][BodySide][JointID][1][0]) {


        Tut[BodyType][BodySide][JointID][1][0] = Tut[BodyType][BodySide][JointID][1][0] - Tut[BodyType][BodySide][JointID][5][2];

        if (Tut[BodyType][BodySide][JointID][1][1] >= Tut[BodyType][BodySide][JointID][1][0]) {
          Tut[BodyType][BodySide][JointID][1][0] = Tut[BodyType][BodySide][JointID][1][1];
          Tut[BodyType][BodySide][JointID][5][3] = 1;
        }
      }

      if (Tut[BodyType][BodySide][JointID][1][1] > Tut[BodyType][BodySide][JointID][1][0]) {


        Tut[BodyType][BodySide][JointID][1][0] = Tut[BodyType][BodySide][JointID][1][0] + Tut[BodyType][BodySide][JointID][5][2];

        if (Tut[BodyType][BodySide][JointID][1][1] <= Tut[BodyType][BodySide][JointID][1][0]) {
          Tut[BodyType][BodySide][JointID][1][0] = Tut[BodyType][BodySide][JointID][1][1];
          Tut[BodyType][BodySide][JointID][5][3] = 1;
        }
      }

      Tut[BodyType][BodySide][JointID][5][1] = Tut[BodyType][BodySide][JointID][5][1] + 1;
    }





   //Ransaugen
   if ((abs(Tut[BodyType][BodySide][JointID][1][0] - Tut[BodyType][BodySide][JointID][1][1])<PI/15) )  Tut[BodyType][BodySide][JointID][5][3] =1;


    if ((Tut[BodyType][BodySide][JointID][5][1] == Tut[BodyType][BodySide][JointID][2][2]) || (Tut[BodyType][BodySide][JointID][5][3] ==1)) {

      Tut[BodyType][BodySide][JointID][1][0] = Tut[BodyType][BodySide][JointID][1][1];
      Tut[BodyType][BodySide][JointID][1][3] = Tut[BodyType][BodySide][JointID][1][0];
      Tut[BodyType][BodySide][JointID][5][1] = 0;
      Tut[BodyType][BodySide][JointID][5][2] = 0;
      Tut[BodyType][BodySide][JointID][5][0] = 1;
      Tut[BodyType][BodySide][JointID][0][0] = 0;

    }
  }
  translate(Tut[BodyType][BodySide][JointID][2][0], Tut[BodyType][BodySide][JointID][2][1]);

  if (Tut[BodyType][BodySide][JointID][4][0] == 1) rotateX(Tut[BodyType][BodySide][JointID][1][0]);
  if (Tut[BodyType][BodySide][JointID][4][0] == 2) rotateY(Tut[BodyType][BodySide][JointID][1][0]);
  if (Tut[BodyType][BodySide][JointID][4][0] == 3) rotateZ(Tut[BodyType][BodySide][JointID][1][0]);

  //TexturedBody(segLength/2,segLength*1.5,10,tex); 


  if ((BodyType>0) ) TexturedBody(Tut[BodyType][BodySide][JointID][3][0],Tut[BodyType][BodySide][JointID][3][1],Tut[BodyType][BodySide][JointID][3][2]);
  else  TexturedCube(Tut[BodyType][BodySide][JointID][3][0],Tut[BodyType][BodySide][JointID][3][1],Tut[BodyType][BodySide][JointID][3][2]);
  // TexturedCube(tex);

  if ((BodyType==2)&&(JointID==3)) {
    translate(0, -segLength,-segLength/4);
    TexturedBody(segLength/4,segLength/8,segLength/3);
  }
 
 fill(255,200,0);
 /*
 if ( Tut[BodyType][BodySide][JointID][1][0] != Tut[BodyType][BodySide][JointID][1][1]) textSize(64);
 else textSize(52);
  text(Tut[BodyType][BodySide][JointID][1][0], 0,-40, -130);
  text(Tut[BodyType][BodySide][JointID][1][1], 0, +40,-130);
//   text(Tut[BodyType][BodySide][JointID][1][0], 0,-80, -230);
  text(Tut[BodyType][BodySide][JointID][1][1], 0, +80,-330);
//     text(Tut[BodyType][BodySide][JointID][1][0], 0,-120, -330);
*/
 
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////


void getNewValue(int BodyType, int BodySide, int JointID) {

  if (Tut[BodyType][BodySide][JointID][1][3]== Tut[BodyType][BodySide][JointID][1][0]) {
  if (Conceptmode==0) {
    RandomValue( BodyType,  BodySide, JointID);
  }
  if (Conceptmode==1) {
    MirrorValue( BodyType,  BodySide, JointID);
  }


  if (Conceptmode==2) {
    InvertValue( BodyType,  BodySide, JointID);
  }


  if (Conceptmode==3) {
    BoxValue( BodyType,  BodySide, JointID);
  }
  }
  else Tut[BodyType][BodySide][JointID][1][1]=Tut[BodyType][BodySide][JointID][1][3];



}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void RandomValue(int BodyType, int BodySide, int JointID) {


  if ((BodyType==1) && ((JointID==5) || (JointID==2)) )  { //wenn die Hüfte

    if ((BodyType==1) && (JointID==2)) {//wenn er twisted
      while ((Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1]) || (( Tut[BodyType][BodySide][JointID][1][1] * Tut[BodyType][BodySide][5][1][0]) < 0)){
        int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
        Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 

      }


    }  

    if ((BodyType==1) && (JointID==5)) {//wenn er hips twisted
      while ((Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1])  || (( Tut[BodyType][BodySide][JointID][1][1] * Tut[BodyType][BodySide][2][1][0]) < 0)) {
        int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
        Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 

      }


    }   


  }
  else {// alles andere  

      while (Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1]) {
      int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
      Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 

      //  if ((BodyType==0) && (BodySide==1)  ) {
      int search = SearchSecond(BodyType,BodySide,JointID);
      int searchleftright = 0;
      if ((BodyType==0) && (BodySide==0)) searchleftright= SearchSecond(0,1,0);
      int searchbody =  SearchSecond(1,0,0);
  
 
 // segment(0,0--nach 0,1



      if (BodyType==0) {

        if (searchbody!=0) {
          if (SearchBodyAngle(BodyType,BodySide,JointID,Tut[1][0][searchbody][1][4])!=0)   {
            Tut[BodyType][BodySide][JointID][1][1] =  Tut[BodyType][BodySide][JointID][0][SearchBodyAngle(BodyType,BodySide,JointID,Tut[1][0][searchbody][1][4])];  
            
            break;
          } 
          else {
            Tut[BodyType][BodySide][JointID][1][1]= Tut[BodyType][BodySide][JointID][1][0];
            break;

          }

        }
      
     
    //Arm Links Rechts 
    /////////////////////////////////
    if ((searchleftright!=0) &&(searchbody==0) && (search==0) && (JointStyle== 2)) {
        if (SearchAngleLeftRight(BodyType,BodySide,JointID,Tut[0][1][searchleftright][1][4])!=0)   {
          Tut[BodyType][BodySide][JointID][1][1] =  Tut[BodyType][BodySide][JointID][0][SearchAngleLeftRight(BodyType,BodySide,JointID,Tut[0][1][searchleftright][1][4])];  
               
          break;
        } 
        else {
          Tut[BodyType][BodySide][JointID][1][1]= Tut[BodyType][BodySide][JointID][1][0];

          break;

        }

      } 
     //Gleicher Arm
     //////////////////////////////
     
      if ((search!=0) &&(searchbody==0)) {
        if (SearchAngle(BodyType,BodySide,JointID,Tut[BodyType][BodySide][search][1][4])!=0)   {
          Tut[BodyType][BodySide][JointID][1][1] =  Tut[BodyType][BodySide][JointID][0][SearchAngle(BodyType,BodySide,JointID,Tut[BodyType][BodySide][search][1][4])];  
          break;
        } 
        else {
          Tut[BodyType][BodySide][JointID][1][1]= Tut[BodyType][BodySide][JointID][1][0];

          break;

        }

      }

     }

    }//ende der while schleife ende der suche
  }


}



int SearchSecond(int BodyType,int BodySide,int JointID) {
  int a=0;  

  for(int i=JointID+1;i<7;i++) {
    if (abs(Tut[BodyType][BodySide][i][0][0])==1)  {
      a=i;
      break;
    }  
  }



  return(a);  
}

int SearchAngleLeftRight(int BodyType,int BodySide,int JointID,float angle) { 
  int a=0;
  int anzahl = int(Tut[BodyType][BodySide][JointID][0][1]);
  for(int i= 2 ;i< 2 + anzahl;i++) {

    ////////////////Wenn sie nicht gleich sind       
    if (Tut[BodyType][BodySide][SearchSecond( BodyType, BodySide, JointID)][4][1] != Tut[BodyType][BodySide][JointID][4][1]) {

     
        if  ((Tut[BodyType][BodySide][JointID][0][i]) == ((Tut[BodyType][BodySide][JointID][1][0]) - angle))  {
           a=i;
          break;
        }
     
    }//////////////ende
    ////////////////Wenn sie gleich sind       
    if (Tut[BodyType][BodySide][SearchSecond( BodyType, BodySide, JointID)][4][1] == Tut[BodyType][BodySide][JointID][4][1]) {

      if  ((Tut[BodyType][BodySide][JointID][0][i]) == ((Tut[BodyType][BodySide][JointID][1][0]) + angle))  {
         a=i;
        break;
      }
    }//////////////ende

  }  
  return(a);
}


int SearchAngle(int BodyType,int BodySide,int JointID,float angle) { 
  int a=0;
  int anzahl = int(Tut[BodyType][BodySide][JointID][0][1]);
  for(int i= 2 ;i< 2 + anzahl;i++) {

    ////////////////Wenn sie nicht gleich sind       
    if (Tut[BodyType][BodySide][SearchSecond( BodyType, BodySide, JointID)][4][1] != Tut[BodyType][BodySide][JointID][4][1]) {

     
        if  ((Tut[BodyType][BodySide][JointID][0][i]) == ((Tut[BodyType][BodySide][JointID][1][0]) + angle))  {
         a=i;
          break;
        }
     
    }//////////////ende
    ////////////////Wenn sie gleich sind       
    if (Tut[BodyType][BodySide][SearchSecond( BodyType, BodySide, JointID)][4][1] == Tut[BodyType][BodySide][JointID][4][1]) {

      if  ((Tut[BodyType][BodySide][JointID][0][i]) == ((Tut[BodyType][BodySide][JointID][1][0]) - angle))  {
        a=i;
        break;
      }
    }//////////////ende

  }  
  return(a);
}





int SearchBodyAngle(int BodyType,int BodySide,int JointID,float angle) { 
  int a =0;
  int anzahl = int(Tut[BodyType][BodySide][JointID][0][1]);
  for(int i= 2 ;i< 2 + anzahl;i++) {  
  
    ////////////////Wenn sie nicht gleich sind       
    if (Tut[1][0][SearchSecond( 1, 0, 0)][4][1] != Tut[BodyType][BodySide][JointID][4][1]) {
     
      if (SearchSecond( 1, 0, 0)<4) {
      if  ((Tut[BodyType][BodySide][JointID][0][i]) == ((Tut[BodyType][BodySide][JointID][1][0]) + angle))  {
        a=i;
        break;
      }
      }
      else {
      if  ((Tut[BodyType][BodySide][JointID][0][i]) == ((Tut[BodyType][BodySide][JointID][1][0]) - angle))  {
        a=i;
        break;
      }
      }
 
 
 
    }//////////////ende
    ////////////////Wenn sie gleich sind       
    if (Tut[1][0][SearchSecond( 1, 0, 0)][4][1] == Tut[BodyType][BodySide][JointID][4][1]) {

     if (SearchSecond( 1, 0, 0)<4) {
      if  ((Tut[BodyType][BodySide][JointID][0][i]) == ((Tut[BodyType][BodySide][JointID][1][0]) - angle))  {
        a=i;
        break;
      }
     }
     else {
      if  ((Tut[BodyType][BodySide][JointID][0][i]) == ((Tut[BodyType][BodySide][JointID][1][0]) + angle))  {
       a=i;
        break;
      }
      }

    }//////////////ende

  } 
  return(a); 
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////   

int i=0;

void MirrorValue(int BodyType, int BodySide,int JointID) {
  if ((BodyType==1) && ((JointID==5) || (JointID==2)) )  { //wenn die Hüfte

    if ((BodyType==1) && (JointID==2)) {//wenn er twisted
      while ((Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1]) || (( Tut[BodyType][BodySide][JointID][1][1] * Tut[BodyType][BodySide][5][1][0]) < 0)){
        int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
        Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 

      }


    }  

    if ((BodyType==1) && (JointID==5)) {//wenn er hips twisted
      while ((Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1])  || (( Tut[BodyType][BodySide][JointID][1][1] * Tut[BodyType][BodySide][2][1][0]) < 0)) {
        int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
        Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 

      }


    }   


  }
  else {// alles andere  

      if (BodyType!=0) {
      while (Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1]) {
        int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
        Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 

      }
    }
    else
      if (BodySide==1) {
        while (Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1]) {
          int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
          i=index;
          Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 
        }
      }
      else Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][i]; 




  }//Ende alles andere

}


/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////  




void InvertValue(int BodyType, int BodySide,int JointID) {
  if ((BodyType==1) && ((JointID==5) || (JointID==2)) )  { //wenn die Hüfte

    if ((BodyType==1) && (JointID==2)) {//wenn er twisted
      while ((Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1]) || (( Tut[BodyType][BodySide][JointID][1][1] * Tut[BodyType][BodySide][5][1][0]) < 0)){
        int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
        Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 

      }


    }  

    if ((BodyType==1) && (JointID==5)) {//wenn er hips twisted
      while ((Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1])  || (( Tut[BodyType][BodySide][JointID][1][1] * Tut[BodyType][BodySide][2][1][0]) < 0)) {
        int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
        Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 

      }


    }   


  }
  else {// alles andere  

      if (BodyType!=0) {
      while (Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1]) {
        int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
        Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 

      }
    }
    else
      if (BodySide==1) {
        while (Tut[BodyType][BodySide][JointID][1][0] == Tut[BodyType][BodySide][JointID][1][1]) {
          int index = 2+int(random(Tut[BodyType][BodySide][JointID][0][1]));  // same as int(random(4))
          i=index;
          Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][index]; 
        }
      }
      else {//StartInvertProgramm

        if (Tut[BodyType][BodySide][JointID][1][1] < 3)    Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][i]; //Wenn es nur zwei möglichkeiten gibt;
        else { 

          if (i==2) Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][i];
          if (i==3) Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][4];
          if (i==4) Tut[BodyType][BodySide][JointID][1][1] = Tut[BodyType][BodySide][JointID][0][3];

        }
      }  //Ende Invert Porgramm
  }//Ende alles andere

}


/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////// 

void BoxValue(int BodyType, int BodySide,int JointID) {


}






