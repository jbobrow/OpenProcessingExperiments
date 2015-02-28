
/*
Konkuk University
SOS iDesign

Name: Kim Hyun Gi
ID: hyungi216

*/

PImage img;

void setup(){
size (600, 600);
background(255,255,255);
// noLoop();
smooth();
colorMode (RGB);
img= loadImage("ho.jpg");
// put the image in the same folder as the processing file
}



void draw(){
println(mouseX + " : " + mouseY);

// here you add your code with all shapes and colors.



colorMode(RGB);

// cloth
fill(209,39,30);
stroke(5);
ellipse(278,582,70,70);

 //sholder
 fill(212,38,27);
quad(0,547,0,600,88,600,88,507);
quad(514,530,600,544,600,600,514,600);


// mangto
fill(82,38,29);
stroke(5);
ellipse(150,566,230,200);
ellipse(410,566,230,200);
 
 //face
 stroke(0);
 fill(230,167,119);
 ellipse(286,301, 530,530);
 
 //ribon
fill(197,188,85);
rect(239,575,80,17,20);
 fill(219,107,79);
 
 noStroke();
 ellipse(427,318,123,148);//right face
 ellipse(152,343,118,148);//left face


fill(212,81,69) ;
 stroke(0);
  ellipse(286,325,152,152);//nose
 
 noFill();
 stroke(0);
 strokeWeight(5);
 


 bezier(286,160,292,78,380,80,404,176);//right eye brow
 bezier(132,213,138,110,229,80,252,164);//left eye brow
 
 
 bezier(126,265,236,262,233,423,138,421); //left face line
 bezier(432,238,350,240,325,410,456,393); //right face line
 bezier(178,411,241,468,361,456,404,389);
 
 
 fill(0,0,0);
 ellipse(205,225,45,80); //left eye
 ellipse(343,209,45,80);//right eye

fill(255,255,255);
noStroke();
rect(154,309,23,23,10);
rect(270,283,25,30,10);
rect(404,280,23,23,10);
 
//bonus

 if(mousePressed){
  fill(mouseX,width-mouseX,0);
  ellipse(286,325,152,152);
  
   noStroke();
  fill(255,255,255);
rect(270,283,25,30,10);

 translate(mouseX, mouseY);
  fill(width-mouseX,mouseX,mouseY,127);
  stroke(0);
  strokeWeight(3);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
 }

}
void keyPressed(){
setup();
 

}

