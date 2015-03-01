
void setup() {
size(600,400);
}



void draw() {
  background(#dedbde);
  
   //left hair layer
  fill(67,41,7);
  arc(45,195,180,280,0,HALF_PI);
 
  //shape of the head
  fill(#eddfd3);
  ellipse(150,145,200,200);
  
  //body
  fill(0);
  stroke(255);
  rect(75,250,125,125);
  
  //------------------------
  //the hair
  //------------------------
  
  //left sideburn
  fill(67,41,7);
  arc(45,55,180,380,0,HALF_PI);
   
  //the bow
  fill(#efa0f0);
  quad(100,25,75,80,20,50,200,35);
  
  //left eye
  fill(255);
  ellipse(145,110,15,15);
    fill(0);
  ellipse(145,110,8,8);
  
 //-------------------------
 //mousepressed command
 //-------------------------
 
  //command
  if (mousePressed) {
    println("ow!");
 
    fill(85);
      ellipse(145,110,15,15);
} else {
    fill(255);
      ellipse(145,110,15,15);
}
  //------------------------
  
  //right eye
  fill(255);
  ellipse(185,110,15,15);
  
  //mouth
  fill(255);
  arc(185,160,80,80,0, PI+QUARTER_PI, CHORD);


}

