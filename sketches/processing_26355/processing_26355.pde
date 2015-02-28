
color fil;
    





void setup(){
  size(450,450);
  smooth();
  
  background(255);
  noStroke();
  fill(68,14,98);
  rect(25,400,100,60);
    fill(75,200,73);
  rect(175,400,100,60);
    fill(202,50,50);
  rect(325,400,100,60);
}
void draw(){
  if (mousePressed ==true){
    fill(fil);
    ellipse(mouseX,mouseY+10,5,5);
        ellipse(mouseX,mouseY-10,5,5);
           ellipse(mouseX+10,mouseY,5,5);
        ellipse(mouseX-10,mouseY,5,5);
   rect(mouseX-5,mouseY-5,10,10);
 

    if(mouseX>25 && mouseX<125 && mouseY>400 && mouseY<460 &&(mousePressed== true))
   {
     fil = color(68,14,98);
   
   }
   if(mouseX>175 && mouseX<275 && mouseY>400 && mouseY<460 &&(mousePressed== true))
   {
     fil = color(75,200,73);
  }
   if(mouseX>325 && mouseX<425 && mouseY>400 && mouseY<460 &&(mousePressed== true))
   {
     fil = color(202,50,50);
}
  }
}

 
  
