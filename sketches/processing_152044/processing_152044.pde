
//creiamo la classe per disegnare il mare
class Sea {

color c;
float xpos;
float ypos;
float xspeed;
float yspeed;

Sea(float xpos_, float ypos_,float xspeed_,float yspeed_) {
  
   xpos =  xpos_;
   ypos =  ypos_;
   xspeed =  xspeed_;
   yspeed =  yspeed_;
}

void display(){
  fill(#2C85D1);
  ellipse(xpos,ypos,90,40);
}

void move() {
 xpos = xpos + xspeed;
 if (xpos > 900){
   xpos = 0 ;
  }
 ypos = ypos + yspeed;
 if (ypos < 400){
   yspeed = yspeed*(-1);
   }
 if (ypos > 600){
  yspeed = yspeed*(-1);
 }
}

}

//creiamo la classe per disegnare la pioggia
class Rain {

color c;
float xpos;
float ypos;
float xspeed;
float yspeed;

Rain(float xpos_, float ypos_,float xspeed_,float yspeed_) {
  
   xpos =  xpos_;
   ypos =  ypos_;
   xspeed =  xspeed_;
   yspeed =  yspeed_;
}

void display(){
  fill(#6F85A0);
  ellipse(xpos,ypos,4,8);
}

void move() {
 xpos = xpos + xspeed;
 if (xpos > 900){
   xpos = 0;
  }
 ypos = ypos + yspeed;
  if (ypos > 500){
   ypos = 0;
  }
}


}



//array di onde
Sea[] onde = new Sea[250];
//array di pioggia
Rain[] pioggia = new Rain[150];

int click = 0;


void setup(){
  size(900, 600);
  smooth();
  
  

   for (int a = 0; a < onde.length; a = a + 1) {
     
    onde[a] = new Sea(random(0,900),random(400,600),0.5,-2);
    
    
    for (int b = 0; b < pioggia.length; b = b + 1) {
    pioggia[b] = new Rain( random(0,900),random(0,600),0.3,2);
  }
  }
}

void draw(){
background(#D9EFFA);

fill(#2C85D1);
rect(0,470,900,200);

fill(#DCEA15);
ellipse(850,60,150,150);

 for(int a = 0; a < onde.length; a = a + 1){
     
     onde[a].move();
     onde[a].display();
   } 
   
   if( click == 1 ){
    for(int b = 0; b < pioggia.length; b = b + 1){ 
     pioggia[b].move();
     pioggia[b].display();
   }
   fill(180);
   
   //nuvole a sx
  ellipse(70,20,200,70) ;
   ellipse(120,20,200,70) ;
    ellipse(80,60,200,70) ;
    
    //nuvole centro
     ellipse(400,20,200,70) ;
       ellipse(450,60,150,90) ;
       ellipse(500,20,200,70) ;
       
       //nuvole destra
        ellipse(750,30,200,70) ; 
         ellipse(820,50,200,70) ;
          ellipse(900,20,200,70) ;
   }
   
}

//metodo per rilevare la pressione del mouse
void keyPressed(){
  click = 1; 
   
 }

//metodo per rilevare il rilascio del mouse
void keyReleased(){
  click = 0;
  
}



