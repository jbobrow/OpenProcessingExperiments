
void setup()
{
  size(1600,800,P3D);
 // noLoop();
}

void draw()
{
  background(0);
 // noFill();

//camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);

stroke(255);
/*
rectMode(CENTER);
 for(int i=0; i<800; i+=50)  //center boxes
 {
    //rect(400,400,i,i);
   rect(0,0,i,i);
 }
*/


noFill();
/*
pushMatrix();
translate(400,0);//attempt to center axis
rotate(radians(45));//rotate axis
for(int i=0; i<1000; i+=50)  //rotated center boxes
 {
   // rect(282.25,282.25,i,i);
   rect(0,0,i,i);
 }


popMatrix();
*/


//fill (36,67,255,90);


 for(int i=0; i<800; i+=50)  //center cirlces
 {
  ellipse(400,400,i,i);
 

//ellipse(0,0,i,i);
 }
 
 

//fill(255,255,0,3);
stroke(255,255,0,60);
 for(int i=0; i<1500; i+=50)  //half edge cirlces
 {

  ellipse(0,0,i,i);
  ellipse(0,400,i,i);
  ellipse(400,0,i,i);
 
  ellipse(800,800,i,i);
  ellipse(0,0,i,i);
  ellipse(0,800,i,i);
  ellipse(800,0,i,i);
 
  ellipse(400,800,i,i);
  ellipse(800,400,i,i);
  }
 
 
/*
  line(0,0,800,800); // lines
  line(800,0,0,800);
  line(400,0,400,800);
  line(0,400,800,400);




for(int i=0; i<800; i+=50)  //middle side circles
 {

ellipse(200,400,i,i);

ellipse(600,400,i,i);

ellipse(400,200,i,i);

ellipse(400,600,i,i);

 }
 
 */
}
