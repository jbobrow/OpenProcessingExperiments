
//posició mosca
float pmoscax = 100; 
float pmoscay = 100;
float velocitatx = 3 ;
float velocitaty= 3 ;
float moscaialesx = 9;
float moscaialesy = 32;
PImage taula;
PImage matamoscas;
PImage sang;


void setup (){
  size(600,400);
  taula = loadImage("taula.jpg");
  matamoscas = loadImage("matamoscas.gif");
  sang= loadImage("sang.png");
    //mata mosca
   
}


void draw(){
  
  //fondo taula fusta
  image(taula,0,0); 
  
  //cos mosca
  fill (0);
  noStroke();
  ellipse(pmoscax,pmoscay,15,30); 
  
  //ala mosca dreta
  pushMatrix();
  ellipseMode(CORNER);
  translate(pmoscax+6,pmoscay+3);
  noStroke();
  rotate(radians(random(342,350))); //algo raro pasa con la rotación, revisar
  fill(255,255,255,150);
  ellipse(0,5,9,25);
  popMatrix();
  
    //ala mosca esquerra
  pushMatrix();
  ellipseMode(CORNER);
  translate(pmoscax,pmoscay);
  noStroke();
  rotate(radians(random(12,20)));
  fill(255,255,255,150);
  ellipse(0,5,9,25);
  popMatrix();
  
  //moviment mosca
  pmoscax = pmoscax + velocitatx;
  pmoscay = pmoscay + velocitaty;
  if((pmoscax + moscaialesx >= width-10) || (pmoscax - moscaialesx <=0)){
    velocitatx = -velocitatx;
  }
  if((pmoscay + moscaialesy >= height) || (pmoscay - moscaialesy <=-30)){
    velocitaty = -velocitaty;
  }
  
    //pal matamoscas
  fill(216,183,129);
  stroke(150,100,100);
  strokeWeight(1);
  rect(mouseX,mouseY,10,250);
  
  // matamosques quadrat
  fill(0,0,0,0);
  stroke(255);
  strokeWeight(2);
  rect(mouseX-43,mouseY-100,100,100);
  image(matamoscas,mouseX-43,mouseY-100,100,100);


}
  //aleatorietat mosca
  void mousePressed(){
  velocitatx = random(-3,3);
  velocitaty = random(-3,3);
  pmoscax = random(0,width);
  pmoscay = random(0,height);
  }
  




