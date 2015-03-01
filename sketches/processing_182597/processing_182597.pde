
int principi = 0;
int moviment=1;
boolean verd = true;
int c1 = 0;
int c3 = 0;

void setup(){
 size (500,500);


 }

void draw(){ // 

noStroke();
background(#87CEEB);

fill(#7FFF00);
ellipse(60,350,120,120);
ellipse(180,350,140,140);
ellipse(290,350,140,140);
ellipse(420,350,160,160);

fill(0);
rect(0,335,500,350);

fill(255);
rect(21,415,40,5); 
rect(101,415,40,5); 
rect(191,415,40,5); 
rect(271,415,40,5); 
rect(351,415,40,5); 

rect(435,363,40,10);
rect(435,393,40,10);
rect(435,423,40,10);
rect(435,453,40,10);


fill(#FF0000); //cotxe
rect(20 + moviment,355,60,30);
fill(150);
ellipse(31+ moviment,387,15,15);
ellipse(61+ moviment,387,15,15);

fill(30); //semafor
rect(440,253,28,50);
rect(449,302,10,40);
fill(c1);
ellipse(453,266,10,10); // vermell
fill(2);
ellipse(453,278,10,10);
fill (c3);
ellipse(453,290,10,10);//verd

fill(0);
int segons = ((millis()-principi)/1000)%60;
int minuts = ((millis()-principi)/1000)/60;


  if ( verd == false){
    moviment = moviment + 0;
    c1 = #FF0000;
  } else {
   c1= 0; 
  }
   
  if ( moviment == 330 && segons <=10){
   verd = false;
  
  }
   
  
 if ( verd == true){
 
 moviment = moviment + 1;
 c3 = #00FF00;
} else {
  c3=0;
}
  
  if ( segons > 10){
   verd = true; 
  }
  
  
 if ( moviment == 520){
  moviment = -20;
  principi = millis();
}
  

}



