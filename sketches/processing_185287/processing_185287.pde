
//Design three static or animated objects that each move in relation to the mouse in a different way.


//Design three static or animated objects that each move in relation to the mouse in a different way.
float disc1rot;
float disc2rot;
float xpos;
float ypos;
PImage djhand;
void setup(){
  size(700,400);
  ellipseMode(CENTER);
  rectMode(CENTER);
  frameRate(30);
  djhand = loadImage("http://i.imgur.com/6fhnHhu.png");
 
}
 
void draw(){
  background((mouseX/2),(mouseY/2),50,100);
   
  pushMatrix();
  translate(100,100);
   
  fill(150);
  rect(100,100,300,300);
  rect(400,100,300,300);
   
  popMatrix();
  pushMatrix();
    fill(255);
    ellipse(70,300,20,20);
    ellipse(100,320,40,40);
    ellipse(370,300,20,20);
    ellipse(400,320,40,40);
  popMatrix();
   
     pushMatrix();
  spin();
   popMatrix();

  image(djhand, mouseX-160, mouseY-100,djhand.width/2, djhand.height/2);

}

 
void spin()
{
   pushMatrix();
  translate(200,200);
   rotate(disc1rot);
   pushMatrix();
  fill(0);
  ellipse(0,0,250,250);
  popMatrix();
  pushMatrix();
  fill(255);
  ellipse(0,0,70,70);
  ellipse(70,0,30,30);
  ellipse(-70,0,30,30);
  rect(0,0,10,10);
 popMatrix();
 popMatrix();
 
 pushMatrix();
  translate(500,200);
   rotate(disc2rot);
   pushMatrix();
  fill(0);
  ellipse(0,0,250,250);
  popMatrix();
  pushMatrix();
  fill(255);
  ellipse(0,0,70,70);
  ellipse(70,0,30,30);
  ellipse(-70,0,30,30);
  rect(0,0,10,10);
 popMatrix();
 popMatrix();
 
 
    
  
 if(mouseX-200 == 0)
  {
    
   disc1rot = (3.14/2);
      if(mouseY >200)
      {
        disc1rot = (-3.14/2);
      }
  }   
  else if(mouseX < width/2)
  {     
    disc1rot = atan(((mouseY-200) / (mouseX-200)));
  }
  else if(mouseX-500 == 0)
  {
    disc2rot = (3.14/2);
  }
  else if(mouseX > width/2)
  {
    disc2rot = atan(((mouseY-200) / (mouseX-500)));
  }
  
}




