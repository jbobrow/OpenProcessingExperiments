
boolean renderpass1 = true;
boolean renderpass2 = true;
boolean renderpass3 = true;
boolean renderpass4 = true;
//Voor deze setup gooi ik vier maal een render eruit, een voor elke laag.

void setup(){
  size(800,600);
  background(255);

}

void draw(){
  int interval = 40;
  int colorstroke1 = 0;
  int colorstroke2 = 0;
  int colorstroke3=  0;
  int colorstroke4 = 0;
  //Deze colorstrokes geven aan op welke state de lijn is, omdat er 3 kleuren voorkomen per laag
  //en deze zichzelf constant herhalen. 
  int lineXtop = 0;
  int lineYtop = 0;
  
  int lineYstart = 10;
  int lineYstart2 = 30;
  int lineXstart = 10;
  int lineXstart2= 30;
  
  int lineY2 = 0;

   if(renderpass1){
     
        for (int i = 0; i <45; i = i+1) {
          //For loopje voor de eerste renderpass, hierbij wordt de onderste
          //laag gegenereerd.
                     if(colorstroke1 == 0){
                 stroke(144,123,185);
                 //kleur paars
                 
          }
                    if(colorstroke1 == 1){
                 stroke(233,121,0);
                 //kleur oranje
                 
          }
                    if(colorstroke1 == 2){
                 stroke(93,184,196);
                  //kleur cyaan
                 colorstroke1 = -1;
                 //Op het moment dat de colorstroke state de laatste waarde heeft 
                 //bereikt(cyaan), wordt deze gereset, dit om de incrementatie
                 //(colorstroke1++) te laten werken hieronder.
                 
          }
          
       strokeWeight(10);
      line(lineXstart,0,lineXstart,1200);
      
      lineXstart = lineXstart + interval;
      
        colorstroke1++;
        renderpass1 = false;
         
       } 

  }

   if(renderpass2){
        for (int i = 0; i <15; i = i+1) {
          if(colorstroke2 == 0){
                 stroke(229,53,24);
                 
          }
                    if(colorstroke2 == 1){
                 stroke(64,70,158);
                 
          }
                    if(colorstroke2 == 2){
                 stroke(91,150,7);
                 colorstroke2 = -1;
          }
       strokeWeight(10);
      line(0,lineYstart,1200,lineYstart);
      lineYstart = lineYstart + interval;
      
        colorstroke2++;
        renderpass2 = false;
         
       } 
  }

 if(renderpass3){
        for (int i = 0; i <45; i = i+1) {
          if(colorstroke3 == 0){
                 stroke(259,53,24);
                 
          }
                    if(colorstroke3 == 1){
                 stroke(46,70,158);
                 
          }
                    if(colorstroke3 == 2){
                 stroke(91,150,7);
                 colorstroke3 = -1;
          }
       strokeWeight(10);
      line(lineXstart2,0,lineXstart2,1200);
      lineXstart2 = lineXstart2 + interval;
      
        colorstroke3++;
        renderpass3 = false;
         
       } 
  }

   if(renderpass4){
        for (int i = 0; i <15; i = i+1) {
          
          if(colorstroke4 == 0){
          stroke(198,182,219);                 
          }
           if(colorstroke4 == 1){
           stroke(244,206,162);                 
          }
          
           if(colorstroke4 == 2){
           stroke(188,214,214);
           colorstroke4 = -1;
          }
       strokeWeight(10);
      line(0,lineYstart2,1200,lineYstart2);
      lineYstart2 = lineYstart2 + interval;
      
        colorstroke4++;
        renderpass2 = false;         
       } 

  }
  
}
