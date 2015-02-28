
/*
---------------------------
  Created by Jose Gonzalez
  Colombia - 2010
---------------------------
*/

forma[] formas = new forma[1];
int turno;

boolean Casilla1X;boolean Casilla2X;boolean Casilla3X;
boolean Casilla4X;boolean Casilla5X;boolean Casilla6X;
boolean Casilla7X;boolean Casilla8X;boolean Casilla9X;

boolean Casilla10;boolean Casilla20;boolean Casilla30;
boolean Casilla40;boolean Casilla50;boolean Casilla60;
boolean Casilla70;boolean Casilla80;boolean Casilla90;
void setup(){
  size(300,300);
  noFill();
  strokeWeight(10);
  smooth();
  formas[0]= new forma(-1,-1,0);
  turno=1;
  
  Casilla1X=false;Casilla2X=false;Casilla3X=false;
  Casilla4X=false;Casilla5X=false;Casilla6X=false;
  Casilla7X=false;Casilla8X=false;Casilla9X=false;
  
  Casilla10=false;Casilla20=false;Casilla30=false;
  Casilla40=false;Casilla50=false;Casilla60=false;
  Casilla70=false;Casilla80=false;Casilla90=false;
}
void draw(){
  background(0);
  stroke(#ffffff);
  line(100,0,100,300);
  line(200,0,200,300);
  line(0,100,300,100);
  line(0,200,300,200);
  
  for(int i=0; i<formas.length; i++){
  formas[i].displayForma();
 }
  comprobar(); 
  
}


class forma{
  float x;
  float y;
  int Turno;
  
  forma(float x, float y, int Turno){
    this.x=x;
    this.y=y;
    this.Turno=Turno;
  }
  
  void displayForma(){
    
    //--- X ---//
  if((Turno%2)==0){
  if((x==-1)&&(y==-1)){x=1000;y=1000;}  
    //---1 casilla---//
    if((x>=0)&&(x<100) && (y<100)){ y=0;x=0;
    line(15+x,15+y,80+x,80+y);
    line(80+x,15+y,15+x,80+y);
    Casilla1X=true;
    }
    //---2 casilla---//
    if((x<200) && (x>=100) && (y<100)){ y=0;x=100;
    line(15+x,15+y,80+x,80+y);
    line(80+x,15+y,15+x,80+y);
    Casilla2X=true;
    }
    //---3 casilla---//
    if((x>=200) && (y<100)){ y=0;x=200;
    line(15+x,15+y,80+x,80+y);
    line(80+x,15+y,15+x,80+y);
    Casilla3X=true;
    }
    //---4 casilla---//
    if((x>=0)&&(x<100) && (y>=100)&&(y<200)){ y=100;x=0;
    line(15+x,15+y,80+x,80+y);
    line(80+x,15+y,15+x,80+y);
    Casilla4X=true;
    }
    //---5 casilla---//
    if((x>=100)&&(x<200) && (y>=100)&&(y<200)){ y=100;x=100;
    line(15+x,15+y,80+x,80+y);
    line(80+x,15+y,15+x,80+y);
    Casilla5X=true;
    }
    //---6 casilla---//
    if((x>=200) && (y>=100)&&(y<200)){ y=100;x=200;
    line(15+x,15+y,80+x,80+y);
    line(80+x,15+y,15+x,80+y);
    Casilla6X=true;
    }
    //---7 casilla---//
    if((x>=0)&&(x<100) && (y>=200)){ y=200;x=0;
    line(15+x,15+y,80+x,80+y);
    line(80+x,15+y,15+x,80+y);
    Casilla7X=true;
    }
    //---8 casilla---//
    if((x>=100)&&(x<200) && (y>=200)&&(y<400)){ y=200;x=100;
    line(15+x,15+y,80+x,80+y);
    line(80+x,15+y,15+x,80+y);
    Casilla8X=true;
    }
    //---9 casilla---//
    if((x>=200)&&(x<400) && (y>=200)&&(y<400)){ y=200;x=200;
    line(15+x,15+y,80+x,80+y);
    line(80+x,15+y,15+x,80+y);
    Casilla9X=true;
    }
}
     //--- O ---//
else{
  if((x==-1)&&(y==-1)){x=1000;y=1000;}  
    //---1 casilla---//
    if((x>=0)&&(x<100) && (y<100)){ y=0;x=0;
    ellipse(50+x,50+y,70,70);
    Casilla10=true;
    }
    //---2 casilla---//
    if((x<200) && (x>=100) && (y<100)){ y=0;x=100;
    ellipse(50+x,50+y,70,70);
    Casilla20=true;
    }
    //---3 casilla---//
    if((x>=200) && (y<100)){ y=0;x=200;
    ellipse(50+x,50+y,70,70);
    Casilla30=true;
    }
    //---4 casilla---//
    if((x>=0)&&(x<100) && (y>=100)&&(y<200)){ y=100;x=0;
    ellipse(50+x,50+y,70,70);
    Casilla40=true;
    }
    //---5 casilla---//
    if((x>=100)&&(x<200) && (y>=100)&&(y<200)){ y=100;x=100;
    ellipse(50+x,50+y,70,70);
    Casilla50=true;
    }
    //---6 casilla---//
    if((x>=200) && (y>=100)&&(y<200)){ y=100;x=200;
    ellipse(50+x,50+y,70,70);
    Casilla60=true;
    }
    //---7 casilla---//
    if((x>=0)&&(x<100) && (y>=200)){ y=200;x=0;
    ellipse(50+x,50+y,70,70);
    Casilla70=true;
    }
    //---8 casilla---//
    if((x>=100)&&(x<200) && (y>=200)&&(y<400)){ y=200;x=100;
    ellipse(50+x,50+y,70,70);
    Casilla80=true;
    }
    //---9 casilla---//
    if((x>=200)&&(x<400) && (y>=200)&&(y<400)){ y=200;x=200;
    ellipse(50+x,50+y,70,70);
    Casilla90=true;
    }

}
}
}
void mousePressed(){
  forma N= new forma(mouseX,mouseY,turno);
    formas=(forma[]) append(formas, N);
    turno=turno+1;
}
void comprobar(){
  if((Casilla1X==true)&&(Casilla2X==true)&&(Casilla3X==true)){
   line(15,50,275,50);println("Gano la X!!!");}
  if((Casilla4X==true)&&(Casilla5X==true)&&(Casilla6X==true)){
   line(15,150,275,150);println("Gano la X!!!");}
  if((Casilla7X==true)&&(Casilla8X==true)&&(Casilla9X==true)){
   line(15,250,275,250);println("Gano la X!!!");}
  if((Casilla1X==true)&&(Casilla4X==true)&&(Casilla7X==true)){
   line(50,15,50,275);println("Gano la X!!!");}
  if((Casilla2X==true)&&(Casilla5X==true)&&(Casilla8X==true)){
   line(150,15,150,275);println("Gano la X!!!");}
  if((Casilla3X==true)&&(Casilla6X==true)&&(Casilla9X==true)){
   line(250,15,250,275);println("Gano la X!!!");}
  if((Casilla1X==true)&&(Casilla5X==true)&&(Casilla9X==true)){
   line(15,15,275,275);println("Gano la X!!!");}
  if((Casilla3X==true)&&(Casilla5X==true)&&(Casilla7X==true)){
   line(275,15,15,275);println("Gano la X!!!");}
       
     
  if((Casilla10==true)&&(Casilla20==true)&&(Casilla30==true)){
   line(15,50,275,50);println("Gano el 0!!!");}
  if((Casilla40==true)&&(Casilla50==true)&&(Casilla60==true)){
   line(15,150,275,150);println("Gano el 0!!!");}
  if((Casilla70==true)&&(Casilla80==true)&&(Casilla90==true)){
   line(15,250,275,250);println("Gano el 0!!!");}
  if((Casilla10==true)&&(Casilla40==true)&&(Casilla70==true)){
   line(50,15,50,275);println("Gano el 0!!!");}
  if((Casilla20==true)&&(Casilla50==true)&&(Casilla80==true)){
   line(150,15,150,275);println("Gano el 0!!!");}
  if((Casilla30==true)&&(Casilla60==true)&&(Casilla90==true)){
   line(250,15,250,275);println("Gano el 0!!!");}
  if((Casilla10==true)&&(Casilla50==true)&&(Casilla90==true)){
   line(15,15,275,275);println("Gano el 0!!!");}
  if((Casilla30==true)&&(Casilla50==true)&&(Casilla70==true)){
   line(275,15,15,275);println("Gano el 0!!!");}
  
}
