
//Annika Zandee
void setup()
{
  size (400,600);
  background(50, 230,255);
  smooth ();
  frameRate(50);
}
void draw ()



{
  strokeWeight (3);
  stroke (255,255,255,100);
  fill(50,255,100);
  triangle(100,400,300,400,200,100);
 fill (255,255,255,50);
  ellipse (mouseX,mouseY,10,10);
  textAlign(CENTER);
  textSize(36);
  fill(0,0,0);
  text("let it snow",width/2,height/2);
 
  
  

}
void keyPressed()
{
  save("snapshot.png");
  background(50,230,255); 
}
   

