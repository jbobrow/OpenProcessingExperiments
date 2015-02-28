
void setup (){
  size(600, 600);
  smooth ();
  background(0);
  noStroke ();
}

void draw (){
  

//Crown-corona
  fill (#F5B502);
  triangle(160, 150, 185, 25, 300, 150); 
  triangle(170, 150, 310, 5, 390, 150); 
  triangle(300,150, 435, 25, 450, 150); 
  
  //face-cara
 fill (#ACF7DF);
 ellipse(300,300,400,400);  

//eye 1- ojo 1   
  fill(300, 200,0);
  ellipse(170, 160,100, 100);

//eye 2- ojo 2 (COPYPASTE LEFTEYE -change first value)
   ellipse(420, 160,100, 100);

//pupils 

  fill(#053343);
  ellipse(170, 180, 60, 60);
  //(copypaste- change 1st value) 
  ellipse(420, 180, 60, 60);

//NOSE-nariz

  fill(#D80B5A);
 
  ellipse(290, 300, 6, 6);
  ellipse(315, 300, 6, 6);


//MOUTH-boca

pushMatrix ();
translate (460, 235);
rotate (45);
fill(#087C86);
ellipse(100, 200, 20, 200);
 popMatrix ();
  
//pajarita-b.tie

  fill (#D80246);
  triangle(200,500,200,550,280,530);
  triangle(310,530,400,550,400,500);
  
  pushMatrix();
  translate(195, 430);
  fill (#FCE321);
  ellipse (100, 100, 15, 15);
  popMatrix ();

}

