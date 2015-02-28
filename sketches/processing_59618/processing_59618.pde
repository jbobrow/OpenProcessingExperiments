
class duikboot {
float xboot;

boolean button = false;
int previousMouseX;
boolean b2 = true;
boolean swapDirection;
int teller = 0;

duikboot(){
 
xboot = 0;

}

void draw(){
   
  fill(25,125,255,150);
  for (int i = 0; i<40;i++){
      ellipse(-780+xboot-i*4,height*2/3+ 30*sin((frameCount*5)/10.0+3*i)+40,6,6); 
}
  
  teller += 1 ;
  if(teller >20000){
   teller = 0;
   xboot = 0;
}
  fill(200);
  noStroke();
  xboot+=2;
  
  if (xboot> width+width){
  xboot = -700;
  
  }
  
  fill(0);
  
  rect((-700+xboot)+80,height*2/3-30,30,30);
  rect(-700+xboot,height*2/3,160,80);
  ellipse(-700+xboot-7,height*2/3+40,80,80);
  ellipse(155-700+xboot,height*2/3+40,80,80);
  triangle(-740+xboot,height*2/3+40,-770+xboot, height*2/3,-770+xboot,height*2/3+80);
  rect(-790+xboot,height*2/3,20,80);
  
  fill(255);
  rect((-700+xboot+15)+80,height*2/3-25,5,20);
  ellipse(144-700+xboot,height*2/3+40,75,75);
  rect(-788+xboot,height*2/3+6,18,3);
  fill(0); 
  ellipse(144-704+xboot,height*2/3+42,73,73);
  rect(-700+xboot,height*2/3,160,80);  
  fill(255);
  rect(-700+xboot,height*2/3+7,160,3);
 
  if (button){
  if(b2){
  fill(255,0,0);
  
  if(previousMouseX > mouseX){
    swapDirection = true;
 
  }else if(previousMouseX < mouseX){
    swapDirection = false;  
}
  if(swapDirection == true){
  ellipse(mouseX-40,mouseY+3.2,5,5);
  triangle(mouseX,mouseY,mouseX,mouseY-10,mouseX-10,mouseY);
  triangle(mouseX,mouseY+5,mouseX,mouseY+15,mouseX-10,mouseY+5);
  fill(255);  
  rect(mouseX-40,mouseY,40,5);
   }else{
      ellipse(mouseX+40,mouseY+3.2,5,5);
      triangle(mouseX,mouseY,mouseX,mouseY-10,mouseX+10,mouseY);
      triangle(mouseX,mouseY+5,mouseX,mouseY+15,mouseX+10,mouseY+5);
      fill(255);  
      rect(mouseX,mouseY,40,5);
     }  
   }    
 }
 previousMouseX = mouseX;
}

void checkClick() {
   if (mouseX > (-900+xboot) && mouseX+30 < (-700+xboot+200)  && mouseY +10> height*2/3 && mouseY-20 < height*2/3+80) {
        button = true;
        b2 = true;
    }
  }
}


