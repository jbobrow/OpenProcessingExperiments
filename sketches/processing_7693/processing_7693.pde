
/* Kye Ehrlich
CMSC117
Self Portrait*/

void setup()
{
  size(500,500);
  smooth();
  colorMode(HSB); 
}


void draw()
{
  background(72,17,230);
 stroke(0);
 
 /*
  if(mousePressed)
  {
    println(mouseX);
     println(mouseY);
  }
  */
  
   beginShape(); //neck
  fill(20,100,220);
  vertex(224,340);
  vertex(220,390);
  vertex(284,390);
  vertex(278,340);
  endShape();
  
  fill(20,100,220);
  bezier(193,221,172,214,148,255,190,270);//left ear
  bezier(308,221,329,214,351,255,309,270);//right ear
  ellipse(250,250,120,200);//head
  
  
  strokeWeight(5);
  stroke(20,200,100);
  line(200,214,240,214);//left eyebrow
  line(260,214,296,214);//right eybrow
  
  strokeWeight(2);
  stroke(0);
  
  fill(0,0,0);            //hair
 ellipse(250,150,100,60);
 ellipse(210,170,80,40);
 ellipse(280,170,80,40);
 ellipse(180,200,60,40);
 ellipse(310,200,60,40);
 
  fill(0,0,255);
  ellipse(220,230,40,20);//left eye
  ellipse(280,230,40,20);//right eye
  
  fill(20,200,100);
  ellipse(220-(250-mouseX)/50,230,20,20);//left iris
  ellipse(280-(250-mouseX)/50,230,20,20);//right iris
  
  fill(0,0,0);
  ellipse(280-(250-mouseX)/50,230,10,10);//right pupil
  ellipse(220-(250-mouseX)/50,230,10,10);//left pupil
  
  beginShape(); //nose
  noFill();
  vertex(240,241);
  vertex(237,270);
  vertex(267,270);
  vertex(261,241);
  endShape();
  
  if(mousePressed==false)
  {
  fill(0,180,150);
  ellipse(250,300,65,15);//mouth
  }
  if(mousePressed==true)
  {
    fill(0,180,150);
  ellipse(250,300,65,5);//mouth2
  }
  
 
}

