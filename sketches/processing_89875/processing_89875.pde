
//copied this entire section from Professor LeMasters wihtout really understanding why... at least it looks much better when I do!

Bird [] myBird;

PImage woods;

void setup(){
  size(800, 600);
  myBird=new Bird[1];
  for (int i=0;i<myBird.length;i++){
    myBird [i]=new Bird(0,0,1);
    
  }
  smooth();
 woods = loadImage ("woods.jpg");
}
 
void draw(){ 
  //BACKGROUND//   
pushMatrix();
  scale(0.35);
  image(woods,0,0);
popMatrix();
translate(height/2, width/2); 

pushMatrix();
for (int i=0;i<myBird.length;i++){
  myBird[i].moveBird();
  myBird[i].drawBird();
  popMatrix();
}
pushMatrix();
makeTree();
popMatrix();
//makeErnie();
//makeTitsy();
 
}


class Bird {

float x;
float y;
float s;

  Bird (float ax, float ay, float as) {
    x=ax;
    y=ay;
    s=as;
    
  }
  
void moveBird(){
//float myX=int();
  rotate(radians(frameCount)); // makes ernie rotate around the tree (or rather manipulated 0,0)
  translate(150,0);

}



void drawBird() {
  
    float sec = millis() /1000.0; // totally just copy+pasted this from http://processing.org/discourse/beta/num_1214309824.html

pushMatrix(); 
  //ERNIE//
  pushMatrix();
     rotate(radians(-frameCount)); //to make sure that Ernie doesn't spin too!

    //WINGS// FLAPPING WITH "IF" Command!
    fill(114,65,24);

    //owl-wing-right//
    if((int)sec%2==0){
       pushMatrix();
        translate(-20,3);
        rotate(radians(25));
        ellipse(0, 0, 20, 50);
        popMatrix();
      }
 
     else {
        pushMatrix();
        translate(-18,3);
        rotate(radians(3));
        ellipse(0, 0, 20, 50);
        popMatrix();
      }
    
      //owl-wing-right//
      if((int)sec%2==0){
         pushMatrix();
         translate(20, 3);
         rotate(radians(-25));
         ellipse(0, 0, 20, 50);
         popMatrix();
      }

      else {
         pushMatrix();
         translate(18, 3);
         rotate(radians(-5));
         ellipse(0, 0, 20, 50);
         popMatrix();
      }

      //BODY//
      fill(43,28,13);
      //owl-body//
      ellipse(00, 00, 40, 75);

      //HEAD//
      fill(55,33,14);
      //owl-head//
      ellipse(00, -36, 32, 30);

      //EYE-BROWS//
      fill(114,65,24);
      noStroke();
      //owl-ear-right//
      triangle(-11, -43, -14, -49, 1, -43);
      //owl-ear-left//
      triangle(1, -43, 14, -49, 11,-43); 

      //owl-eyes//
      stroke(0,0,0);
      //right//
      line(-8, -38, -3, -40);
      //left//
      line(3, -40, 8, -38);
 
      //what we in swedish call "näbb"//
      fill(183,124,6);
      triangle(0, -30, -2, -34, 2, -34);
 
 
      //OWL-FEET//
      fill(114,65,24);
      //owl-feet//
      ellipse(-10, 37, 10, 7);
      ellipse(10, 37, 10, 7);
   popMatrix(); 
popMatrix();
}

}
void makeTree(){
pushMatrix();
fill(46,31,10);
rect(00, 125, 105, 9);
rect(-25, 0, 50, 310); 
fill(0, 55, 0);
ellipse(0, 0, 200, 200);

//GREEN-APPLES//
fill(random(61),random(83),random(0));
ellipse(10,10,10,10);
ellipse(-10,-10,10,10);
ellipse(60,40,10,10);
ellipse(-60,50,10,10);
ellipse(60,-50,10,10);

//RED-APPLES//
fill(random(188),random(30),random(0));
ellipse(10,25,10,10);
ellipse(-50,-20,10,10);
ellipse(-30,-10,10,10);
ellipse(0,-50,10,10);
ellipse(0,80,10,10);
popMatrix();
}
void makeTitsy(){

  float sec = millis() /1000.0; // totally just copy+pasted this from http://processing.org/discourse/beta/num_1214309824.html

  
  //ERNIE's GF!

pushMatrix(); 
rotate(radians(-frameCount/2)); // makes ernie rotate around the tree (or rather manipulated 0,0)
translate(250,0);

pushMatrix(); 

     rotate(radians(-frameCount)); //to make sure that Ernie doesn't spin too!

//WINGS// FLAPPING WITH "IF" Command!
fill(114,65,24);

    //WINGS// FLAPPING WITH "IF" Command!
    fill(114,65,24);

    //owl-wing-right//
    if((int)sec%2==0){
        pushMatrix();
        translate(-18,3);
        rotate(radians(3));
        ellipse(0, 0, 20, 50);
        popMatrix();
      
      }
 
     else {
      pushMatrix();
        translate(-20,3);
        rotate(radians(25));
        ellipse(0, 0, 20, 50);
        popMatrix();
      }
    
      //owl-wing-right//
      if((int)sec%2==0){
         pushMatrix();
         translate(20, 3);
         rotate(radians(-25));
         ellipse(0, 0, 20, 50);
         popMatrix();
      }

      else {
         pushMatrix();
         translate(18, 3);
         rotate(radians(-5));
         ellipse(0, 0, 20, 50);
         popMatrix();
      }

//BODY//
fill(43,28,13);
//owl-body//
ellipse(00,00, 40, 75);

//HEAD//
fill(224,199,164);
//owl-head//
ellipse(00, -36, 32, 30);

//EYE-BROWS//
fill(114,65,24);
noStroke();
//owl-ear-right//
triangle(-11,-43, -14,-49, 1,-43);
//owl-ear-left//
triangle(1,-43, 14,-49, 11,+-43); 

//owl-eyes//
stroke(0,0,0);
//right//
line(-8,-38, -3,-40);
//left//
line(3,-40, 8,-38);
 
//what we in swedish call "näbb"//
fill(183,124,6);
triangle(0,-30, -2,-34, 2,-34);
 
 
//OWL-FEET//
fill(114,65,24);
//owl-feet//
ellipse(-10,37, 10, 7);
ellipse(10,37, 10, 7);

popMatrix();
 
popMatrix();
}



