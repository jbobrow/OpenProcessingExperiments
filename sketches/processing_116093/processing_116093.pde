
float angle;
float speed = 0.5;
float a = 0.1;
 
PImage back;
PImage backgroundimg;
PImage bluel;
PImage body;
PImage head1;
PImage head2;
PImage head3;
PImage head4;
PImage lefta;
PImage leftm;
PImage redl;
PImage righta;
PImage rightm;
PImage stard;
PImage deaths;

void setup(){
  size(500,600);
  smooth();
  frameRate(60);
  back = loadImage("back.png");
  backgroundimg = loadImage("backgroundimg.png");
  bluel = loadImage("bluel.png");
  body = loadImage("body.png");
  head1 = loadImage("head1.png");
  head2 = loadImage("head2.png");
  head3 = loadImage("head3.png");
  head4 = loadImage("head4.png");
  lefta = loadImage("lefta.png");
  leftm = loadImage("leftm.png");
  redl = loadImage("redl.png");
  righta = loadImage("righta.png");
  rightm = loadImage("rightm.png");
  stard = loadImage("stard.png");  
  deaths = loadImage("deaths.png");  

  
}

void draw(){

//////background/////
  pushMatrix();
  imageMode(CORNER);
  image (backgroundimg ,0,0);
  popMatrix();

/////Mandara//// 
  pushMatrix();
  imageMode(CENTER);
  translate(width/5, height*2/5);
  rotate(PI/2+a);
  a++;
  image(leftm,0,0);
  popMatrix();
 
 
  pushMatrix();
  imageMode(CENTER);
  translate(width*4/5, height*2/5);
  rotate(PI/2-a/2);
  a++;
  image(rightm,0,0);
  popMatrix();
 
///////////////////
  imageMode(CORNER);
  pushMatrix();
  rotate(PI/2+a/6);
  translate(width/6,height/6);
  image(redl,0,0);
  popMatrix();
  pushMatrix(); 
  rotate(PI/2-a/6);
  translate(width/2,height/2);
  image(bluel,0,0);
  popMatrix();
 
/*/////arm//// 
  pushMatrix();
  imageMode(CENTER);
  image(lefta,width/4,height*2/5);
  popMatrix();
  
  pushMatrix();
  imageMode(CENTER);
  image(righta,width*3/4,height*2/5);
  popMatrix();
 */
 

////body////  
  pushMatrix();
  imageMode(CENTER);
  image(body,width/2,height/2);
  popMatrix();
  
  ////face////  
  pushMatrix();
  imageMode(CENTER);
  image(head3,width/2+6, height/4+40);
  popMatrix();
  
  
 ////deathstar////  
  pushMatrix();
  imageMode(CENTER);
  image(deaths,width/2, height*4/5);
  popMatrix();
  
  
 ////starD////  
  pushMatrix();
  imageMode(CORNER);
  rotate(PI/2+a/25);
  image(stard,width/3, height/2);
  popMatrix();  
 }


