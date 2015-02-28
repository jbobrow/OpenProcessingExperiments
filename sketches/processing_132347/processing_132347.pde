
int balkX;
int balkY;
int balkBreedte;
int balkHoogte;
int richtingBalk;
int richtingBal;
float balX;
int balY;
int balBreedte;
int balHoogte;
int score;



void setup(){
  size(500,500);
 balkX=250;
 balkY=470;
 balkBreedte=150;
 balkHoogte=10;
 richtingBalk=10;
 richtingBal=10;
 score=0;
 
 balX=50;
 balY=50;
 balBreedte=80;
 balHoogte=80;
}



void draw(){
  background(0,100,250);
  fill(240,100,0);
  //Balk
  rect(balkX,balkY,balkBreedte,balkHoogte);
  fill(0,200,0);
  ellipse(balX,balY,balBreedte,balHoogte);
  println(score);
  text(score,450,50);
  
  
  //Balk naar links
  if(keyPressed){
    if(key == CODED){
      if(keyCode == LEFT){
      balkX = balkX - richtingBalk;}}}
      
  //Balk naar rechts
   if(keyPressed){
    if(key == CODED){
      if(keyCode == RIGHT){
      balkX = balkX + richtingBalk;}}}
      
   //Balk botst links   
    if(balkX <= 0){
     balkX = 0; }
     
   //Balk botst rechts  
    if(balkX >= 350){
     balkX = 350; }     
     
    //Bal valt omlaag
    balY = balY + richtingBal;

    
   //Bal stuitert
    if(balY >= 470 && balX >= balkX && balX <= balkX + balkBreedte){
      richtingBal = -richtingBal;
      //Score
    score= score +1;}
 
   //Bal stuitert terug
   if(balY <=10){
     richtingBal = -richtingBal;
   balX = random(0,500);
   
   }
  
//Einde
if (score >= 10){textSize(50);
background(0,0,255);
text("EINDE SPEL",100,200);
noLoop();
}



   
   
   
   
   
}








  
  
  



