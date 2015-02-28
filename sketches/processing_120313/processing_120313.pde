
float r= 0;
float g= 0;
float b= 70;
float backgcolour=0; // variables set up for the background colour

float e= 80;
float f= 40;
float h= 0; // variables set up for the ground colour

float moonX;
float moonY;
float sunX;
float sunY; // variables for the sun and moon 

void setup(){
  size(700,500); // 700 by 500 pixels
  smooth();
  moonX=width/4; //
  moonY=height+20; //
  sunX=width/5.5; //
  sunY=height+10; //
  
}

void draw(){
  background(backgcolour); // black background 
  background(r,g,b); // variable colours to change the background
  ellipseMode(CENTER); 
  rectMode(CENTER);  // both ellipse and rectangle changes are centered
  
  fill(255);// 
  ellipse(moonX+400,moonY,60,60);//
  
  fill(200,120,0);//
  ellipse(sunX,sunY,60,60); //
  
  fill(e,f,h); // variable colours for the ground
  rect(0,470,1400,60);  // the rectangle will stretch across the bottom of the screen
  
  fill(175); // zoogs body
  rect(mouseX-50,mouseY+45,30,40);
  
  fill(255);  // zoogs head
  ellipse(mouseX-50,mouseY,60,60);  // zoogs head will follow the mouse pointer
  
  fill(200); // zoogs legs
  rect(mouseX-60,mouseY+73,8,15);
  rect(mouseX-39,mouseY+73,8,15);
  
  fill(150);//
  ellipse(mouseX-65,mouseY-5,10,17);
  ellipse(mouseX-35,mouseY-5,10,17);
  
  
  if(mouseX > width/2){  // turns the screen to black to give the effect of night
    b = b - 0.2;
  }
  
  else if(mouseX < width/2){ // turns the screen to blue to give the effect of day
    b = b + 0.2 ;
  }
  if(mouseX > width/2){ // makes the ground darker to give the effect of night
    f = f - 0.2;
  }
  else if(mouseX < width/2){ // makes the ground lighter to give the effect daylight
    f = f + 0.2;
  }
  
  if (mouseX > width/2){ //
    moonY= moonY - 2;
     
  }
  else if (mouseX < width/2){
    moonY= moonY + 2;
  
  }

  if(mouseX < width/3.2){
    sunY= sunY - 2;
  }
  
  else if (mouseX > width/2.7){
    sunY= sunY + 2;
  }
  
b = constrain(b,0,70); //

f = constrain(f,20,30); //

moonY= constrain(moonY,80,520); //

sunY= constrain(sunY,80,520); //

}



