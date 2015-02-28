



void setup(){
  
  frameRate(10);
  
  size(720,720);
  background(255);
  smooth();
  noStroke();
}

void shitdraw(){

  
  //background
  int s=second();
 if(s<15||s>44){
   //day
   background(204,255,255);
 }else{
   //night
   background(0,0,30);
 }
 

 
 
  //ground 
if(s<15||s>44){
  //day
  fill(148,235,0);
}else{
  //night
  fill(0,100,0);
}
  rect(0,height/2,width,height/2);
  
  

  
  //star
  
   if(s>14&&s<44){
    stroke(255);
   float starX=random(0,720);
   float starY=random(0,360);
   fill(255);
   ellipse(starX,starY,5,5);
   
   
   float star2X=random(0,720);
   float star2Y=random(0,360);
   fill(255);
   ellipse(star2X,star2Y,5,5);
   
   float star3X=random(0,720);
   float star3Y=random(0,360);
   fill(255);
   ellipse(star3X,star3Y,5,5);
   }
   
  noStroke();
 
  
  //transformations
  fill(255);
  translate(width/2,height/2);
  rotate(radians(s*6)+4);
  

  
  
  //moon colouring
   if(s>14&&s<45){
     //night
     fill(255);
   }else{
     //day
     fill(148,235,0);
   }
   ellipse( -200,-200,50,50);
   
   
   
   //moonshape
    if(s>14&&s<44){
   //nighbt
      fill(0,0,30);
    }else if(s>43&&s<45){
      fill(0,100,0);
    }else{
     
      //day
      fill(148,235,0);
    }
   ellipse(-180,-200,50,50);
   
   
   
   //sun colouring
   if(s<15||s>44){
     //day
     fill(255,255,0);
   }else{
     //night
     fill(0,100,0);
   }
  // fill(0);
   ellipse( 200,200,50,50);
   
   
   

  
}

void draw(){
 
  shitdraw();

 
}

