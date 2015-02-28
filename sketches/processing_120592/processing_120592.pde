

float x;
float y;
float dim = 80.0;
PFont f;
PFont g;

void setup() {
  size(displayWidth, displayHeight);
 
  
   println(PFont.list());
  f = createFont("days", 60);
  textFont(f);
  g = createFont("champagne_limousines",20);
  
}

void draw() {
  background(0);
  
  x = x + 0.8;

  // Vitesse
  
  
 if (x > width + dim) {
    x = -dim;
    
    //POUR FAIRE REVENIR LE TEXTE AU DEBUT
  } 
 if (y > height + dim) {
    y = -dim;
    
    //POUR FAIRE REVENIR LE TEXTE AU DEBUT
  } 
    pushMatrix();
  translate(x, height/2-dim/2);
  fill(255);
   textAlign(LEFT); 
    textFont(f);
   text("MUSIC",0,80-170);
      stroke(150);
       strokeWeight(4);
        line(-400,-75,0+270,-75);
        line(0+270,-75,-25+270,-75-25);
        line(0+270,-75,-25+270,-75+25);
   popMatrix();
  // Transforms accumulate. Notice how this rect moves 
  // twice as fast as the other, but it has the same 
  // parameter for the x-axis value
  pushMatrix();
  translate(x, dim);
  fill(150);
   textAlign(LEFT); 
   textFont(g);
   text("Music & NSA offices",0,300-20);
   text("Design workshop",0,320-20);
   popMatrix();
  
  
 
 pushMatrix();
   rotate(PI/2);
   
   translate(-x,0 );
  fill(255);
   textAlign(LEFT); 
      textFont(f);
   text("DESIGN",220,-480);
   
    fill(150);
   textAlign(LEFT); 
      textFont(g);
text("workshop & shop",220,-440);

   fill(50);
   strokeWeight(4);
   line(2000,-465,170,-465);
   line(170,-465,170+25,-465+25);
   line(170,-465,170+25,-465-25);
   
  popMatrix();
  
  
  
  
  
   pushMatrix();
  translate(-x, height/2-dim/2);
  fill(255);
   textAlign(LEFT); 
    textFont(f);
   text("RECEPTION",1050-80,160);
      fill(50);
       strokeWeight(4);
        line(920,180,2000,180);
        line(920,180,955,180+25);
        line(920,180,955,180-25);
   popMatrix();
  // Transforms accumulate. Notice how this rect moves 
  // twice as fast as the other, but it has the same 
  // parameter for the x-axis value
  pushMatrix();
  translate(-x, dim);
  fill(150);
   textAlign(LEFT); 
   textFont(g);
   text("JK Computer Center",1050-80,470 +70);
   text("Student Hub",1050-80,490+70);
   popMatrix();
}


