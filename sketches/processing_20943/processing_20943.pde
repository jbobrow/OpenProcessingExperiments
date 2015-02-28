
void setup(){
   size(400, 400,P3D);
     
  }

 int x = 80;  //neptune
 int y = 10;   //moon

 PImage img;
  void draw(){
   
    camera(width/2, 0, 400, width/2, height, 0, 0, 1, 0);  
   img = loadImage("sky.jpg");
   background (img);
    lights();

//sun
translate(width/2,height/2,0);
float x = 5;
  noStroke();
 translate(x,200,0);
  fill(245,225,5);
 sphere(50);
 
//neptune
pushMatrix();
noStroke();
rotateY(radians(x * frameCount * -PI/6 * 0.25));
translate(200,0,0);
fill(0,255,0);
sphere(20);




//moon
rotateY(radians(y*-PI/6* 0.05));
translate(40,0,0);
fill(225,240,226);
sphere(10);
popMatrix();



y+=75;
}



