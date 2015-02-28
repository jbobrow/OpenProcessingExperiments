
//homework 9
//copyright CarolineRecord Pittsnurgh PA 2011

void setup()
{
  size (500, 500, P3D);
  background (0);
}


void draw()
{
  noLoop();
  background (0
  
  );
  noStroke();
  directionalLight(200, 50, 100, 400, -400, -50); //lightling the clouds
  directionalLight(200, 0, 0, 400, 400, -50); //lighting the box 
  pushMatrix();
  translate (40, 40);
  fill(255);
  sphere (80);
  translate (70, 40, -10);
  text("word", 15, 30);
  sphere (80);
  translate (80, 30);
  sphere (80);
  translate (80, 70);
  text("word", 15, 30);
  sphere (80);
  translate (50, 40, 50);
  sphere (80);
  translate (50, 20,30);
  sphere (80);
  translate (50, 90);
  text("word", 15, 30); 
 sphere (80);
  popMatrix();
  
  directionalLight(60, 200, 50, 400, 400, -50); //lighting the box 
 pushMatrix ();
  translate (20,height/2,10);
  box (80);
  translate (10,16,20);
  box (80);
   translate (30,50,-50);
  box (80);
    translate (10,3,80);
  box (80);
    translate (80,80);
  box (80);
    translate (-40,-40, 70);
  box (80);
    translate (70,30, 60);
  box (80);
  
  popMatrix ();
  
  pushMatrix();
  translate (0,0, 60);
  fill (255,230);
  ellipse( width/2-70,height/2,300,300);
  fill (255);
  translate (0,0, 200);
  text("word", width/2,height/2);
  popMatrix();



}

                                
