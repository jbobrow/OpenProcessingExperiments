
int posX;

void setup(){
  size(800,800);
  background(255,170,0);
  posX=0;
  
  noCursor();
}

void draw(){
  
  background(255,170,0);
   
  //boca:  
    stroke(0);
    fill(240,220,109);
    ellipse(mouseX-80,mouseY,250,130);
    ellipse(mouseX+80,mouseY,250,130);
    
    stroke(240,220,109);
    fill(240,220,109);    
    ellipse(mouseX,mouseY+22,55,55);

  //ull esquerre:
    stroke(0);
    fill(255);
    ellipse(mouseX-60,mouseY-100,200,280);
     
  //ull dret:
    ellipse(mouseX+60,mouseY-100,200,280);
     
    strokeWeight(2);
    line(mouseX,mouseY-213,mouseX,mouseY);
    
    stroke(255);
    rect(mouseX-100,mouseY-213,97,213);
    
  //Pupila esquerra:  
    stroke(0);
    fill(0);
    ellipse(mouseX-40,mouseY-100,20,50);
    
  //Pupila dreta:  
    ellipse(mouseX+40,mouseY-100,20,50);
  
  //nas:  
    fill(234,168,215);
    ellipse(mouseX,mouseY+20,80,40);
    
  //ratlles esquerra:
    line(mouseX-230,mouseY+20,mouseX-222,mouseY+40);
    line(mouseX-240,mouseY+15,mouseX-225,mouseY+50);
    line(mouseX-250,mouseY+10,mouseX-228,mouseY+60);
    line(mouseX-260,mouseY+5,mouseX-231,mouseY+70);
    
    line(mouseX-250,mouseY-100,mouseX-250,mouseY-80);
    line(mouseX-258,mouseY-105,mouseX-258,mouseY-75);
    line(mouseX-266,mouseY-110,mouseX-266,mouseY-70);
    line(mouseX-274,mouseY-115,mouseX-274,mouseY-65);
    
    line(mouseX-222,mouseY-200,mouseX-230,mouseY-180);
    line(mouseX-225,mouseY-210,mouseX-240,mouseY-172);
    line(mouseX-228,mouseY-220,mouseX-250,mouseY-170);
    line(mouseX-231,mouseY-230,mouseX-260,mouseY-165);
    
  //ratlles dreta:
    line(mouseX+230,mouseY+20,mouseX+222,mouseY+40);
    line(mouseX+240,mouseY+15,mouseX+225,mouseY+50);
    line(mouseX+250,mouseY+10,mouseX+228,mouseY+60);
    line(mouseX+260,mouseY+5,mouseX+231,mouseY+70);
    
    line(mouseX+250,mouseY-100,mouseX+250,mouseY-80);
    line(mouseX+258,mouseY-105,mouseX+258,mouseY-75);
    line(mouseX+266,mouseY-110,mouseX+266,mouseY-70);
    line(mouseX+274,mouseY-115,mouseX+274,mouseY-65);
    
    line(mouseX+222,mouseY-200,mouseX+230,mouseY-180);
    line(mouseX+225,mouseY-210,mouseX+240,mouseY-172);
    line(mouseX+228,mouseY-220,mouseX+250,mouseY-170);
    line(mouseX+231,mouseY-230,mouseX+260,mouseY-165);
    
 }
