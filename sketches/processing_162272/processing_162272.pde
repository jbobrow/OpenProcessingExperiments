

int xpos = 45;
int ypos = 40;
int bsize = 30;


void setup(){
  
  size(800,600);
  background(200);
  
  noStroke();
  fill(255);
  rect(120,10,670,580);
  
  
  fill(255,0,0);
  rect(xpos,ypos,bsize,bsize);
  fill(255,155,0);
  rect(xpos,ypos+bsize,bsize,bsize);
  fill(255,255,0);
  rect(xpos,ypos+bsize*2,bsize,bsize);
  fill(#12E34F);
  rect(xpos,ypos+bsize*3,bsize,bsize);
  fill(#00B6D8);
  rect(xpos,ypos+bsize*4,bsize,bsize);
  fill(#1C46D8);
  rect(xpos,ypos+bsize*5,bsize,bsize);
  fill(#691CE8);
  rect(xpos,ypos+bsize*6,bsize,bsize); 
  fill(#D81CC3);
  rect(xpos,ypos+bsize*7,bsize,bsize); 
  fill(0);
  rect(xpos,ypos+bsize*8,bsize,bsize); 
  fill(255);
  rect(xpos,ypos+bsize*9,bsize,bsize); 
 

  //weight
/*  fill(255);
  ellipse(xpos+15,ypos+270,10,10); 
  ellipse(xpos+15,ypos+300,15,15);
  ellipse(xpos+15,ypos+330,20,20);  
  
  */
  
  
  
}


void draw(){
  
  
   
   
  if(mousePressed){
    
    
    if(780 > mouseX && mouseX>140  && mouseY > 30 && mouseY < 570){
   
  //  line(pmouseX,pmouseY,mouseX,mouseY);
  noFill();
  ellipse(pmouseX,pmouseY,25,25);
    }
    
     
 /*      if(20 > mouseX && mouseX>100 && mouseY > 440 && mouseY < 490){
   
  noStroke();
  fill(255);
  rect(120,10,670,580);
    }  */
    
    if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos && mouseY < ypos+bsize){
    
    stroke (255,0,0);
   
    }
  
    if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos + bsize && mouseY < ypos+bsize*2){
   
    stroke (255,155,0);
    }

    if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos + bsize*2 && mouseY < ypos+bsize*3){
   
   stroke (255,255,0);
    }


    if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos + bsize*3 && mouseY < ypos+bsize*4){
  
   stroke (#12E34F);
    }
    
  if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos + bsize*4 && mouseY < ypos+bsize*5){
   
    stroke (#00B6D8);
    }

  if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos + bsize*5 && mouseY < ypos+bsize*6){

    stroke (#1C46D8);
    }

  if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos + bsize*6 && mouseY < ypos+bsize*7){
   
    stroke (#691CE8);
    }

  if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos + bsize*7 && mouseY < ypos+bsize*8){

    stroke (#D81CC3);
    }
    
    if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos + bsize*8 && mouseY < ypos+bsize*9){

    stroke (0);
    }
 
      if(mouseX > xpos && mouseX < xpos + bsize && mouseY > ypos + bsize*9 && mouseY < ypos+bsize*10){

    stroke (255);
    }
  
  
  
  
  
  }






  
  
  
  
  
}
  

  
  
  
  
  


