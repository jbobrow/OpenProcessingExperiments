
void setup(){
  size(300,300);
}

void draw(){
  if(mouseX >= width/2){ //mouse on right side
    noStroke();
    fill(0,150,150);
    rect(width/2,0,width/2,height); //right composition
    
    fill(0,50,50);
    rect(0,0,width/2,height); //left composition
    
    //green grass.mouseY controls height and color. when mouse is on right side.
    fill(0,mouseY,0);
    rect(0,mouseY,10,height);
    fill(0,mouseY+25,0);
    rect(10,mouseY-50,5,height+50);
    fill(0,mouseY+150,0);
    rect(15,mouseY+70,20,height);
    fill(0,mouseY+15,0);
    rect(35,mouseY-30,15,height+30);
    fill(0,mouseY+100,0);
    rect(50,mouseY-10,30,height+10);
    fill(0,mouseY-10,0);
    rect(80,mouseY-50,10,height+50);
    fill(0,mouseY-50,0);
    rect(90,mouseY+25,25,height);
    fill(0,mouseY,0);
    rect(115,mouseY+100,10,height+100);
    fill(0,mouseY+25,0);
    rect(125,mouseY+50,25,height);
    
    //bars that grow twice as fast as above bars. when mouse is on right side.
    
    fill(0,mouseY,0);
    rect(150,2*mouseY,5,height);
    fill(0,mouseY+100,0);
    rect(155,2*mouseY-10,20,height+10);
    fill(0,mouseY,0);
    rect(175,2*mouseY+100,30,height);
    fill(0,mouseY-50,0);
    rect(205,3*mouseY,20,height);
    fill(0,mouseY,0);
    rect(225,3*mouseY-10,15,height+10);
    fill(0,mouseY+150,0);
    rect(240,3*mouseY+50,25,height);
    fill(0,mouseY,0);
    rect(265,2*mouseY+100,15,height);
    fill(0,mouseY-50,0);
    rect(280,2*mouseY-10,20,height+10);
    
  }else{ //mouse on left side
  
    fill(0);
    rect(width/2,0,width/2,height); //right composition
    
    fill(255);
    rect(0,0,width/2,height); //left composition
    
    fill(0);
    rect(0,width/2,mouseY,5);
    fill(0);
    rect(0,width/3,mouseY,10);
    fill(0);
    rect(0,width/4,mouseY,15);
    
    if(mouseY>=150){
      fill(255);
      rect(150,width/2,mouseY,5);
      fill(255);
      rect(150,width/3,mouseY,10);
      fill(255);
      rect(150,width/4,mouseY,15);
    }
    
    
  }
}

  


