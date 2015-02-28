

boolean flag; //booleangatanohennsuuflag


void setup(){

  size(600,600);//gamennsaizu

  smooth();//namerakaansennga
 
  background(255);//sirohaikei
    flag=false;//zukeinosixyokiirowokuronisextutei

  fill(0,0,0);//kuro
  
}

void draw(){


stroke(0, 0, 0);
if(flag==true)//onninaxtutatokiaka
stroke(255,0,0);//aka

  rect(550,550,50,50);//suixtutizahixyou
 if( mouseButton == RIGHT ) {//migikurixtukunotoki
  stroke(255,255,255);//sironisuru
 
    
  }
}


void mouseDragged(){
 
  line(pmouseX,pmouseY,mouseX,mouseY);//sennwosennga

}

void mousePressed(){

  if(mouseX>=550 && mouseX<=600 && mouseY>=550 && mouseY<=600){//mausunozahixyougaseihoukeinohanninainotoki
    if(flag==false){ //kurixtukusurumaegaohunotoki
      fill(255,0,0);//aka
      flag=true;    //kurixtukusitaraononozixyoutainihennkousuru 
    }else{          //kurixtukusurumaegaonnotoki 
      fill(0,0,0);
      flag=false;    //kurixtukusitaraohunozixyoutainihennkousuru
    }
  }
}

void keyPressed(){//ki-woosaretatoki

  if(key=='r'){//rnaraaka
  
    background(255,0,0);//aka
  }
    if(key=='w'){//wnarasiro
  
    background(255);//siro
  }
      if(key=='b'){//bnara
  
    background(0,0,0);//kuro
      }
}



