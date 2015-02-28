
//functions that recive the parameters from the Onionface.
import oscP5.*;
import netP5.*;


//classe on guardem les dades que venen del onionFace.
 class onionFaceData_Class{
   OscP5 oscP5;
   NetAddress myRemoteLocation;
   
   float medLow,medMed,medHi,param1,param2,param3,param4,param5,param6,param7,param8;
   int longCadenaFreq;
   float[] cadenaFreq;
   //boolean lock = false;
     //inicialitzem
     
     int numCanals = 16;

   
   //constructor
   onionFaceData_Class(){
           //start oscP5, listening
           oscP5 = new OscP5(this,12000);
           myRemoteLocation = new NetAddress("localhost",24000);
           cadenaFreq = new float[256];
           for (int i=0;i<256;i++){
                cadenaFreq[i] = 0;
           }
           inicializa();
   }
   
   /* incoming osc message are forwarded to the oscEvent method. */
   void oscEvent(OscMessage theOscMessage){
      /* print the address pattern and the typetag of the received OscMessage */
      //print("### received an osc message.");
      //print(" theOscMessage.get(0).floatValue(): "+theOscMessage.get(0).floatValue());
      setMedLow(theOscMessage.get(0).floatValue());
      setMedMed(theOscMessage.get(1).floatValue());
      setMedHi(theOscMessage.get(2).floatValue());
      setLongCadenaFreq(theOscMessage.get(3).intValue());
      //geting the float array
      //println("theOscMessage.typetag(); = " + theOscMessage.typetag());
      
      for(int i=0;i<getLongCadenaFreq();i++){
             setCadenaFreq(theOscMessage.get(i+4).floatValue(),i);
             //println("i =" + i+ "theOscMessage.get(i+4).floatValue() =  "+ theOscMessage.get(i+4).floatValue()+  "getCadenaFreq(i) ="+getCadenaFreq(i));
      }
      
      
      setParam1(theOscMessage.get(4+getLongCadenaFreq()).floatValue());
      setParam2(theOscMessage.get(5+getLongCadenaFreq()).floatValue());
      setParam3(theOscMessage.get(6+getLongCadenaFreq()).floatValue());
      setParam4(theOscMessage.get(7+getLongCadenaFreq()).floatValue());
      setParam5(theOscMessage.get(8+getLongCadenaFreq()).floatValue());
      setParam6(theOscMessage.get(9+getLongCadenaFreq()).floatValue());
      setParam7(theOscMessage.get(10+getLongCadenaFreq()).floatValue());
      setParam8(theOscMessage.get(11+getLongCadenaFreq()).floatValue());
     
     //println("ens entra = " + theOscMessage.get(12+getLongCadenaFreq()).intValue());
      
      //float[] array = theOscMessage.get(4).floatValue();
      //println ("este es el valor que nos llega =" + array[1]);
  }
  
  void mandaFrames() {
  /* in the following different ways of creating osc messages are shown by example */
        OscMessage myMessage = new OscMessage("/test");
  
        //myMessage.add(1234);
        myMessage.add("frame");
        float numFrame = (frameCount/2) + 3000;
        println("numFrame = " + numFrame);
        myMessage.add(numFrame); /* add an int to the osc message */
        oscP5.send(myMessage, myRemoteLocation);
  }
  
  void inicializa() {
    //inicializar
  /* in the following different ways of creating osc messages are shown by example */
        OscMessage myMessage = new OscMessage("/iniciar");
        myMessage.add(true); /* add an int to the osc message */
        oscP5.send(myMessage, myRemoteLocation);
        
  }
  
  //////////////////////////////////////////INFO INTERFICIE//////////////////////////////
  
  void mandaInterf(){
         //
         
         OscMessage myMessage = new OscMessage("/infoInterf");
         String nomSk = "liniesA5_2";
         
         String param1 = "VEL_CAM+HI";
         String param2 = "VEL_LINIES+MED";
         String param3 = "COLOR_LINIES+LOW";
         String param4 = "TAMANYO_LINIAS";
         String param5 = "FREE";
         String param6 = "FREE";
         String param7 = "COLOR_VERM";
         String param8 = "VEL";
         
         myMessage.add(nomSk); /* add an int to the osc message */
         myMessage.add(param1);
         myMessage.add(param2);
         myMessage.add(param3);
         myMessage.add(param4);
         myMessage.add(param5);
         myMessage.add(param6);
         myMessage.add(param7);
         myMessage.add(param8);
         
         oscP5.send(myMessage, myRemoteLocation);
         
         
        //oscP5.send(myMessage, myRemoteLocation);
          
           
  }
   ////Functions to get and set de diferent variables. 
   //posa cada un de les factors 

////////////////PARAMETRES///////////////////////

   void setParam1(float param1){
       this.param1 = param1;
   }   
   
   void setParam2(float param2){
       this.param2 = param2;
   } 
   
    void setParam3(float param3){
       this.param3 = param3;
   } 
   
   void setParam4(float param4){
       this.param4 = param4;
   } 
   
   void setParam5(float param5){
       this.param5 = param5;
   }
  
   void setParam6(float param6){
       this.param6 = param6;
   }  
   
   void setParam7(float param7){
       this.param7 = param7;
   } 
   
   void setParam8(float param8){
       this.param8 = param8;
   } 
   
   //////////////////////////////////////////////////////////////////////////////////
  
  
    float getParam1(){
        return (param1);
    }
    
    float getParam2(){
        return (param2);
    }
    

    float getParam3(){
        return (param3);
    }
    

    float getParam4(){
        return (param4);
    }
    

    float getParam5(){
        return (param5);
    }
    

    float getParam6(){
        return (param6);
    }
    
    float getParam7(){
        return (param7);
    }
    
    float getParam8(){
        return (param8);
    }

   
   
   
   ///////////////////////////////////////////
   //posa cada un de les 
   void setMedLow(float medLow){
       this.medLow = medLow;
   }  
 
   //function that returns de medLow 
    float getMedLow(){
        return (this.medLow);
    }
    
   //posa cada un de les 
   void setMedMed(float medMed){
       this.medMed = medMed;
   }
   
    //function that returns de medLow 
    float getMedMed(){
        return (this.medMed);
    }
    
   //posa cada un de les 
   void setMedHi(float medHi){
       this.medHi = medHi;
   }
   
    //function that returns de medLow 
    float getMedHi(){
        return (this.medHi);
    }
    
   //Funcio que agafa la longitud de la cadana de frecuencies
   void setLongCadenaFreq(int longCadenaFreqIn){
         longCadenaFreq = longCadenaFreqIn;
         //println("estoy definiendo la long del array  = " + longCadenaFreq);
         cadenaFreq = new float[longCadenaFreq];
   }
   
   //function returns the freq array size
   int getLongCadenaFreq(){
         return(longCadenaFreq);
   }
   
   //posa cada un de les 
   void setCadenaFreq(float cadenaFreqs,int i){
           cadenaFreq[i] = cadenaFreqs;
           //println(" cadenaFreq[i] =" + cadenaFreq[i]);
   }
   
   //function that returns de medLow 
   float getCadenaFreq(int cont){
      float temp = 0;
      //println("estoy en getCadenaFreq" + "  cont =" + cont+ "cadenaFreq.lenght =" +cadenaFreq.length );
      
      temp = cadenaFreq[cont];
      return (temp);
    }
    
    
    

}

