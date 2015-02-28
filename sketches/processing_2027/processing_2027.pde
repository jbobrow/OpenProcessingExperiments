
float tonoprincipal= random(245);


void setup () {
  size (800,400);
  colorMode(HSB,155);
  // Hue Saturation Brightness
  smooth();
  //noFill();
  background (49);
  smooth();
  //strokeWeight(22);
}

void draw (){
  //background(255);
  frameRate(10);
  //frameRate(10);
  translate(width/2*random(3), height/2*random(1));
  stroke(tonoprincipal+ random(350), 100 + random(50), 100 + random(50),80);
  strokeWeight(5+random(width));
  //strokeWeight(0.2*random(width/2));
  
  float diametro= random(width/2);
  ellipse(0,0,diametro, diametro);
  
    if(mousePressed){ //si el mouse de presiona
      size(800,800); //preparamos un fill rosa
    }
    
    else {
      size(800,400);
    }
}

