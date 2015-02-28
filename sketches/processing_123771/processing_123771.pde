
void setup() {
  size (400,400);
 
}

void draw() {
  background (0);
  fill (250,255,0);
  ellipse (width/2, height/2,width,height);
  
  if ( //random shapes
  mousePressed==true &&
  mouseX>=150 && mouseX<=250 &&
  mouseY>=150 && mouseY<=250)
  {
  fill (255);
  beginShape ();
  vertex (20,20);
  vertex (10,50);
  vertex (30,50);
  endShape (CLOSE);
  rect (375,20,10,10);
  strokeWeight (10);
  stroke (255);
  point (375,390);
  strokeWeight (1);
}
  
  
 if(  //top left
 mousePressed==true &&
 mouseX>=0 && mouseX<=200 &&
 mouseY>=0 && mouseY<=200
 )
 {
  
  fill (0);  //smiley face
  ellipse (150,150,50,50);
  ellipse (250,150,50,50);
  ellipse (200,285,50,50);
  ellipse (150,275,50,50);
  ellipse (250,275,50,50);
  ellipse (100,250,50,50);
  ellipse (300,250,50,50);}
  
  if (  //top right
  mousePressed==true &&
  mouseX>=200 && mouseX<=400 &&
  mouseY>=0 && mouseY<=200
  )
  {
    fill (0);  //frownyface
    ellipse (150,150,50,50);
    ellipse (250,150,50,50);
    ellipse (200,285,50,50);
    ellipse (150, 295, 50,50);
    ellipse (250, 295,50,50);
    ellipse (100,310,50,50);
    ellipse (300,310,50,50);}
    
  if (  //bottom left
  mousePressed==true &&
  mouseX>=0 && mouseX<=200 &&
  mouseY>=200 && mouseY<=400
  )
  {
    fill (0);  //straightface
    ellipse (150,150,50,50);
    ellipse (250,150,50,50);
    ellipse (200,285,50,50);
    ellipse (150,285,50,50);
    ellipse (100,285,50,50);
    ellipse (250,285,50,50);
    ellipse (300,285,50,50);}
    
  if (  //bottom right
  mousePressed==true &&
  mouseX>=200 && mouseX<=400 &&
  mouseY>=200 && mouseY<=400
  )
  {
    fill (0);  //surprisedface
    ellipse (150,150,50,50);
    ellipse (250,150,50,50);
    ellipse (200,225,50,50);
    ellipse (150,250,50,50);
    ellipse (250,250,50,50);
    ellipse (150,300,50,50);
    ellipse (250,300,50,50);
    ellipse (200,325,50,50);}
    
/* if (  //middle left...top left
 mouseX>=0 && mouseX<=100 &&
 mouseY>=150 && mouseY<=200
 )
 {  //hair smile
  PImage Hair;
  Hair=loadImage ("Hair.jpg");
  image (Hair,0,0,width,height);
  fill (250,255,0);
  ellipse (width/2, height/2,300,300);
  fill (0); 
  ellipse (150,150,50,50);
  ellipse (250,150,50,50);
  ellipse (200,285,50,50);
  ellipse (150,275,50,50);
  ellipse (250,275,50,50);
  ellipse (100,250,50,50);
  ellipse (300,250,50,50);  
}
 if (  //left midde...top right
 mousePressed==true &&
 mouseX>=100 && mouseY<=200 &&
 mouseY>=150 && mouseY<=200
 )
 {  //hair frown
 PImage Hair;
  Hair=loadImage ("Hair.jpg");
  image (Hair,0,0,width,height);
  fill (250,255,0);
  ellipse (width/2, height/2,300,300);
   fill (0);  //frownyface
    ellipse (150,150,50,50);
    ellipse (250,150,50,50);
    ellipse (200,285,50,50);
    ellipse (150, 295, 50,50);
    ellipse (250, 295,50,50);
    ellipse (100,310,50,50);
    ellipse (300,310,50,50);}
    
 if (  //left middle...bottom left
 mousePressed==true &&
 mouseX>=0 && mouseX<=100 &&
 mouseY>=200 && mouseY<=250
 )
 {  //hair straight
 PImage Hair;
  Hair=loadImage ("Hair.jpg");
  image (Hair,0,0,width,height);
  fill (250,255,0);
  ellipse (width/2, height/2,300,300);
  fill (0);  //straightface
    ellipse (150,150,50,50);
    ellipse (250,150,50,50);
    ellipse (200,285,50,50);
    ellipse (150,285,50,50);
    ellipse (100,285,50,50);
    ellipse (250,285,50,50);
    ellipse (300,285,50,50);}
    
 if (  //left middle...bottom right
 mousePressed==true && 
 mouseX>=100 && mouseX<=200 &&
 mouseY>=200 && mouseY<=250
 )
 {  //hair surprised
  PImage Hair;
  Hair=loadImage ("Hair.jpg");
  image (Hair,0,0,width,height);
  fill (250,255,0);
  ellipse (width/2, height/2,300,300);
  fill (0);  //surprisedface
    ellipse (150,150,50,50);
    ellipse (250,150,50,50);
    ellipse (200,225,50,50);
    ellipse (150,250,50,50);
    ellipse (250,250,50,50);
    ellipse (150,300,50,50);
    ellipse (250,300,50,50);
    ellipse (200,325,50,50);}
    
 if(  //right middle...top left
 mousePressed=true &&
 mouseX>=200 && mouseX<=300 &&
 mouseY>=150 && mouseY<=200
 )
 {  //mustache smile
 PImage Mustache;
 Mustache=loadImage ("Mustache.jpg");
 fill (250,255,0);
 ellipse (width/2,height/2,width,height);
 image (Mustache,150,200,100,50);
 fill (0);  //smiley face
  ellipse (150,150,50,50);
  ellipse (250,150,50,50);
  ellipse (200,285,50,50);
  ellipse (150,275,50,50);
  ellipse (250,275,50,50);
  ellipse (100,250,50,50);
  ellipse (300,250,50,50);} */

  
   
}
