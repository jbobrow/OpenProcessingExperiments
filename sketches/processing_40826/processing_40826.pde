

void setup (){
  size(400,400);
  smooth();
  background(255);

}


void draw (){
    
  fill(255);
  noStroke();
  rect(0,0,400,400);
  
  
  fill(100);
  ellipse(200,200,20,20);

  stroke(0,0,0,30);
  strokeWeight(1);
  line(mouseX-10,0,mouseX-10,400);
  line(mouseX+10,0,mouseX+10,400);
  
  
  if((mouseX>=190)&&(mouseX<210)){
  
  fill(0);
  rect(0,0,400,400);
  
  fill(255);
  ellipse(200,200,20,20);

  fill(0);
  strokeWeight(20);
  stroke(255);
  ellipse(200,200,550,550);
  ellipse(200,200,500,500);
  ellipse(200,200,450,450);
  ellipse(200,200,400,400);
  ellipse(200,200,350,350);
  ellipse(200,200,300,300);
  ellipse(200,200,250,250);
  ellipse(200,200,200,200);
  ellipse(200,200,150,150);
  ellipse(200,200,100,100);
  
  fill(255);
  ellipse(200,200,10,10);
  }
 
   
 if(mouseX>220){
  fill(255);
  noStroke();
  rect(0,0,400,400);
  
  fill(100);
  ellipse(200,200,20,20);

  stroke(0,0,0,30);
  strokeWeight(1);
  line(mouseX-10,0,mouseX-10,400);
  line(mouseX+10,0,mouseX+10,400);
  } 

  } 


