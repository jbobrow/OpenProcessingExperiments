
void setup()
{
  size(600,600);
  smooth();
  strokeWeight(2);
  frameRate(60);
  println("setup has been run");
 }

void draw()
{ 
  // doesn't work: println(mouseX,mouseY);
  background(0);
   //feet
  fill(200);
  triangle(150,550,240,475,220,430);
  triangle(450,550,360,475,380,430);

  //neck
  fill(9,253,78);
  //rectMode(CENTER);
  //rect(300,300,40,200);
  quad(mouseX-20,(mouseY-200),mouseX+20,(mouseY-200),320,400,280,400);
  
  //body
  ellipse(300,420,210,130);
  
  //head
  ellipse(mouseX,mouseY-200,270,200);
  
  //eye
  fill(255);
  ellipse(mouseX,mouseY-200,250,140);
  
  //pupil
  fill(0);
  ellipse(mouseX,mouseY-200,60,120);
  /*if (mouseX>245 && mouseX<425){
    ellipse(mouseX,180,60,120);
  }
   //ellipse(300,180,60,120);
   if(mouseX<=245){
   ellipse(mouseX+245,180,60,120);  
   }
   else if (mouseX>245){
   ellipse(mouseX,180,60,120);
   }*/
}
  
void mousePressed(){
  //eye closed
  fill(9,253,78);
  ellipse(mouseX,mouseY-200,250,140);
  //line(175,180,425,180);
}

