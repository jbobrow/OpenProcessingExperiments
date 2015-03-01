
PImage flummi;
PImage hintergrund;
float counter = 0.0;

void setup()
{
  size(500,500);
  flummi = loadImage("flummi_2.png");
  hintergrund = loadImage("hintergrund2.png");
  
}

void draw()
{
  //Hintergrund
  pushMatrix();
 translate(height/2,width/2);
 //scale(0.35);
 imageMode(CENTER);
 image(hintergrund,0,0);
 popMatrix();
 
 

 //Flummi 
 
 pushMatrix();
 translate(250,320);
 scale(0.1);
 imageMode(CENTER);
 image(flummi,0,0);
 popMatrix();
 
 if (mouseX>= 250 && mouseX<=300 )
 { 
  translate(height/2,width/2);
// scale(0.35);
 imageMode(CENTER);
 image(hintergrund,0,0);
 
   float huepfen = map( sin(counter)*mouseY,1,-150,-10,10);
     translate(0,100+huepfen);
     scale(0.1);
     imageMode(CENTER);
     image(flummi,0,0);
 }
 

counter += 0.25;
}
 

 




