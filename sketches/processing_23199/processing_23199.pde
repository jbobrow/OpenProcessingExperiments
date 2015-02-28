
void setup(){
size(300,500);
background(255);
smooth();
println("bellegrape:)");}


  
void draw(){
   
 stroke(56,40,12);
 strokeWeight(13);
 line(100,85,170,90);
 line(170,90,200,80);
 
 strokeWeight(18);
 line(165,95,160,115);
 
 strokeWeight(0.5);
 fill(102,15,168);
 ellipseMode(CORNER);
ellipse(100,150,35,35);
ellipse(145,250,45,45);
ellipse(160,200,50,50);

stroke(0);
 strokeWeight(0.5);
fill(100,22,180);
ellipse(110,160,7,7);
ellipse(150,265,8,8);
ellipse(175,215,10,10);
}

void mousePressed(){
  
  stroke(0);
  strokeWeight(0.5);
  fill(79,5,124); 
  ellipse(pmouseX,pmouseY,70,70);
  
  fill(71,19,102);
  ellipseMode(CORNER);
  ellipse(20+pmouseX,20+pmouseY,13,13);
}

void keyPressed(){
    background(255);
}




