
PImage trumpet; PImage oval; PImage petals; PImage cluster1; PImage ovalTransparent; PImage cluster2; PImage picture1; PImage picture2; PImage picture3;

float aspect; boolean paused = false;
boolean start = false;
boolean start2 = false;

void setup() {

size(800,800);
trumpet  = loadImage("Motif_1.png");
oval = loadImage("Motif_3.png");
petals = loadImage("Motif_5.png");
cluster1 = loadImage("Cluster_3.png");
ovalTransparent = loadImage("Motif_2 copy.png");
cluster2 = loadImage("Cluster 2.png");
picture1 = loadImage("picture1.png");
picture2 = loadImage("picture2.png");
picture3 = loadImage("CROPLEY.png");
}



void draw(){

  
  if(start == false){
  
  image(ovalTransparent,random(100,600),random(100,600),random(10,oval.width),random(10,oval.height));
  
  
  }
  
//  if(start2 == false){
//    
//    image(picture2,random(0,800),random(0,800),random(0,800),random(0,800));
//  }
  
//DRAWING RANDOM PETALS
if(!paused){
  aspect = random(0, 2.0);
  
  image(petals, random(0,350), random(0,350), petals.width/2, petals.height/2);
   image(oval, random(0,600), random(0,600), petals.width/4, petals.height/4);
  image(trumpet, random(-100,300), random(-100,300), trumpet.width/3, trumpet.height/3);
    fill(181,55,0, 10);
    rect(0,0,800,800);
}
}

//draw trupets wherever the mouse is pressed void mousePressed(){



void keyPressed(){

//if you press the c key, clear the sketch
if (key == 'c' || key == 'C') {
  background(random(0,150),random(0,50),random(0,10),10);
}

//press 'o' to draw a random oval once'
if (key == 'o' || key == 'O') {
  image(cluster1,  0,0, cluster1.width/2, cluster1.height/2);
}


//press the space bar to pause and unpause
if(key == ' '){
  //if it is paused (i.e. paused == true) make paused be false
  //i.e. if it's paused, unpause it.
  if(paused) {paused = false;}
  //otherwise, pause it.
  else {paused = true; }
}

if(key == 's'){
  //if it is paused (i.e. paused == true) make paused be false
  //i.e. if it's paused, unpause it.
  if(start) {start = false;}
  //otherwise, pause it.
  else {start = true; }
}

//press 'p' to draw a random oval once'
if (key == 'p' || key == 'P') {
  image(cluster2,  100,100, cluster2.width/2, cluster2.height/2);
}

//press 'o' to draw a random oval once'
if (key == '1' || key == '1') {
  image(picture1,  0,0, 800, 800);
}

//press 'o' to draw a random oval once'
if (key == '2' || key == '2') {
  image(picture2,  0,0, 800, 800);
}

//press 'o' to draw a random oval once'
if (key == '3' || key == '3') {
  image(picture3,  0,0, 800, 800);
}

//press 'o' to draw a random oval once'
if (key == '4' || key == '4') {
  image(picture2, random(0,800), random(0,800), random(0,800), random(0,800));
}

//if(key == 'q'){
//  //if it is paused (i.e. paused == true) make paused be false
//  //i.e. if it's paused, unpause it.
//  if(start2) {start2 = false;}
//  //otherwise, pause it.
//  else {start2 = true; }
//}

}




