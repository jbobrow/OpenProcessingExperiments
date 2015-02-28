
//David Muslimov's Mandala
//An exercise in processing with shapes and colors
//For Math-103-01 with Nick Lally
 
 
 
void setup() {
  size(400,400);
  background(0,0,255);
  smooth();
}
 
 
 
void draw() {
   
  //outer portion of mandala square and circle
  //with ellipses at the sides
   
  fill(random(255),0,255,50);
  rect(100,100,200,200);
  noFill();
  stroke(random(255),0,255,50);
  ellipse(200,200,200,200);
  noStroke();
   
   
  fill(random(255),0,255,50);
  ellipse(0,200,175,600);
  ellipse(400,200,175,600);
  noFill();
   
  //inner portion square and circle with triangles in between
  stroke(random(255),0,255,255);
  triangle(200,200,0,300,100,400);
  triangle(200,200,300,0,400,100);
  triangle(200,200,400,300,300,400);
  triangle(200,200,0,100,100,0);
  noStroke();
   
  fill(random(255));
  rect(150,150,100,100);
  noFill();
  stroke(random(255));
  ellipse(200,200,100,100);
   
  //copy of center square and circle but random color version
  fill(random(255),0,255,50);
  rect(150,150,100,100);
  noFill();
  stroke(random(255),0,255,50);
  ellipse(200,200,100,100);
   
createImage(400,400);
  //was thinking to have an image of buddha flicker in when you move the mouse
  //but wasn't sure how mouseMoved and Pimage worked, would like to learn
  //how to better write and organize code in the future...
  //it was slow getting started, but soon i was actually having fun experimenting!
  
  //^^original processes^^
  //conditionals (Thu Feb 3 2011)
  

ellipse (mouseY, mouseX, mouseY, mouseY);
fill (random(255),255,255,0);

//the ellipses 'dirty' up the image; reflecting time spent 
//meditating upon a feigned infinite structure, such as a
//flower frozen in stasis, pointing one into a 'better'
//direction by reminding that there are more efficient and
//worthwile things to be doing;
    
  }
   
                
