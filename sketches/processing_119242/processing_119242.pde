
//Maus langsam im Kreis bewegen
void setup(){
size(500,500);}

void draw(){
  background(80);
  
 fill(255,166,82);
 noStroke();
//Reihe 1 
pushMatrix();
 translate(0, mouseY/2.2);
 ellipse(25,25,25,25);
 ellipse(75,25,25,25);
 popMatrix();
pushMatrix();
 translate(mouseX/9.9,0);
 ellipse(150,25,25,25);
 ellipse(200,25,25,25); 
 popMatrix();
pushMatrix();
 translate(-mouseX/9.9,0);
 ellipse(300,25,25,25);
 ellipse(350,25,25,25);
 popMatrix();
pushMatrix();
 translate(0,mouseY/2.2);
 ellipse(425,25,25,25);
 ellipse(475,25,25,25);
 popMatrix();

//Reige 2 
  translate(0,75);
  fill(255,166,82);
  noStroke();
pushMatrix();
 translate(0, mouseY/3.3);
 ellipse(25,25,25,25);
 ellipse(75,25,25,25);
 popMatrix();
pushMatrix();
 translate(mouseX/9.9,0);
 ellipse(150,25,25,25);
 ellipse(200,25,25,25); 
 popMatrix();
pushMatrix();
 translate(-mouseX/9.9,0);
 ellipse(300,25,25,25);
 ellipse(350,25,25,25);
 popMatrix();
pushMatrix(); 
 translate(0, mouseY/3.3);
 ellipse(425,25,25,25);
 ellipse(475,25,25,25);
 popMatrix();

//Reihe 3
 translate(0,75);   
 fill(255,166,82);
 noStroke();
pushMatrix();
 translate(0, mouseY/6.6);
 ellipse(25,25,25,25);
 ellipse(75,25,25,25);
 popMatrix();
pushMatrix();
 translate(mouseX/9.9,0);
 ellipse(150,25,25,25);
 ellipse(200,25,25,25); 
 popMatrix();
pushMatrix();
 translate(-mouseX/9.9,0);
 ellipse(300,25,25,25);
 ellipse(350,25,25,25);
 popMatrix();
pushMatrix();
 translate(0, mouseY/6.6);
 ellipse(425,25,25,25);
 ellipse(475,25,25,25);  
 popMatrix();
 
//Reihe Mitte
  translate(0,75);   
  fill(255,166,82);
  noStroke();
  
  pushMatrix();
 ellipse(25,25,25,25);
 ellipse(75,25,25,25);
 popMatrix();
pushMatrix();
 translate(mouseX/9.9,0);
 ellipse(150,25,25,25);
 ellipse(200,25,25,25); 
 popMatrix();
pushMatrix();
 translate(-mouseX/9.9,0);
 ellipse(300,25,25,25);
 ellipse(350,25,25,25);
 popMatrix();
pushMatrix();
 ellipse(425,25,25,25);
 ellipse(475,25,25,25); 
 popMatrix(); 
//Reihe 3 von unten   
  translate(0,75);   
  fill(255,166,82);
  noStroke();
pushMatrix();
 translate(0,-mouseY/6.6);
 ellipse(25,25,25,25);
 ellipse(75,25,25,25);
 popMatrix();

 pushMatrix();
 translate(mouseX/9.9,0);
 ellipse(150,25,25,25);
 ellipse(200,25,25,25); 
 popMatrix();
 
 pushMatrix();
 translate(-mouseX/9.9,0);
 ellipse(300,25,25,25);
 ellipse(350,25,25,25);
 popMatrix();
 
pushMatrix();
 translate(0,-mouseY/6.6);
 ellipse(425,25,25,25);
 ellipse(475,25,25,25);
 popMatrix(); 

//Reihe 2 von unten
  translate(0,75);   
  fill(255,166,82);
 noStroke();
pushMatrix();
 translate(0,-mouseY/3.3);
 ellipse(25,25,25,25);
 ellipse(75,25,25,25);
 popMatrix();

pushMatrix();
 translate(mouseX/9.9,0);
 ellipse(150,25,25,25);
 ellipse(200,25,25,25); 
 popMatrix();
 
 pushMatrix();
 translate(-mouseX/9.9,0);
 ellipse(300,25,25,25);
 ellipse(350,25,25,25);
 popMatrix();
 
 pushMatrix();
 translate(0,-mouseY/3.3);
 ellipse(425,25,25,25);
 ellipse(475,25,25,25);  
 popMatrix();
 
//Reihe 1 von unten
  translate(0,75);   
  fill(255,166,82);
  noStroke();

pushMatrix();
 translate(0,-mouseY/2.2);
 ellipse(25,25,25,25);
 ellipse(75,25,25,25);
 popMatrix();

 pushMatrix();
 translate(mouseX/9.9,0);
 ellipse(150,25,25,25);
 ellipse(200,25,25,25); 
 popMatrix();
 
 pushMatrix();
 translate(-mouseX/9.9,0);
 ellipse(300,25,25,25);
 ellipse(350,25,25,25);
 popMatrix();

pushMatrix();
 translate(0,-mouseY/2.2);
 ellipse(425,25,25,25);
 ellipse(475,25,25,25); 
 popMatrix(); 
 
}
