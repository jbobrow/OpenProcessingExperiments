
void setup(){
   size(500,500);
//   smooth();
background(mouseX,random(0,00),mouseY) ;
}

void draw(){
  
 // background(100,255,100) ;
  stroke(mouseX,random(0,200),mouseY);
  fill(mouseX,random(0,200),mouseY);
  ellipse(mouseX,mouseY,10,10);

  stroke(0);
  fill(200,200,255) ;
  rectMode(CORNER) ;
  rect(400,300,100,200) ;
   
  stroke(0);
  fill(200,200,255) ;
  rectMode(CORNER) ;
  rect(300,200,100,300) ;



  if(mouseX > 400 && mouseY > 300) {
    stroke(0);
    fill(200,200,255) ;
    //rectMode(CORNER);
    ellipse(random(0,500),random(0,500),20,20);
    
    stroke(0);
    fill(0,200,0) ;
    rectMode(CORNER) ;
    rect(400,300,100,200) ;
  } 
   if(mouseX > 300 && mouseY > 200) {  
    stroke(0);
    fill(250,0,0) ;
    rectMode(CORNER) ;
    rect(300,200,100,300) ;
   
  }
  }

