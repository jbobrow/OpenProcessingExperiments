
float increment=0.25;
boolean creixement=true;



void setup() {
  size(600, 400);
  background(0);
  fill(255,10);
  noStroke();
  cursor(CROSS);


}

void draw() {
   fill(0);
  rect(0,0,width,height);
  
  if (creixement==true){
    increment=increment+0.25;
    if(increment==30){
      creixement=false;
    }
  }
  
  if (creixement==false){
    increment=increment-0.25;
    if(increment==1){
      creixement=true;
    }
  }
  

  
    for(int i = 0; i < 20; i++) {
    fill(0,180,220,20);
    ellipse(mouseX,mouseY,i*(increment/10)+10,i*(increment/10)+10);  
  }
 
 for(int i = 0; i < 20; i++) {
     fill(255,100-i*5);
    ellipse(mouseX,mouseY,i*(increment/10),i*(increment/10));  
  }



}
