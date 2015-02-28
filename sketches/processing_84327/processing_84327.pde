
//Directions...

//Use the number keys, "-" and "=" to turn on 12 lights
//pointed toward center arranged in a circle. 

//Current light is reflected on sphere in center.
//Lines are drawn at random weight from current light to previous light.
//Go bat shit on a number pad for a cool effect.

float background = 0.0; //gray value of background
float sizesp = 50; //size of sphere (big gets real laggy)
float c = 50; //gray value of ball
float x = width/2; // x val of last light on
float y = height/2;// y val of last light on
float size = 350;//size() x or y * .5
float s = 70; //stroke weight

void setup(){
 size (700,700,P3D); //x and y val should be equal
  smooth();
}

void draw(){
  background(background);
  strokeCap(ROUND);
  
  if (keyPressed){
    if(key == '1'){
  stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2, 0);
  directionalLight(255, 255, 255, 0, 1, 0);
    }
  }
  
    if (keyPressed){
    if(key == '2'){
  stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2 + 172.9, height/2 - 304.15);
  directionalLight(255, 255, 255, -.333, .666, 0);
    }
  }
  
    if (keyPressed){
    if(key == '3'){
  stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2 + 302.05, height/2 - 176.4);
  directionalLight(255, 255, 255, -.666, .333, 0);
    }
  }
  
    if (keyPressed){
    if(key == '4'){
  stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width, height/2);
  directionalLight(255, 255, 255, -1, 0, 0);
    }
  }
  
    if (keyPressed){
    if(key == '5'){
        stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2 + 303.45, height/2 + 173.95);
  directionalLight(255, 255, 255, -.666, -.333, 0);
    }
  }
  
    if (keyPressed){
    if(key == '6'){
        stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2 + 176.4, height/2 + 302.4);
  directionalLight(255, 255, 255, -.333, -.666, 0);
    }
  }
  
    if (keyPressed){
    if(key == '7'){
      stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2, height);
  directionalLight(255, 255, 255, 0, -1, 0);
    }
  }
  
    if (keyPressed){
    if(key == '8'){
        stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2 - 174.65, height/2 + 303.1);
  directionalLight(255, 255, 255, .333, -.666, 0);
    }
  }
  
    if (keyPressed){
    if(key == '9'){
        stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2 - 302.75, height + 175);
  directionalLight(255, 255, 255, .666, -.333, 0);
    }
  }
  
    if (keyPressed){
    if(key == '0'){
        stroke(random(255));
  strokeWeight(random(s));
  line(x, y, 0, height/2);
  directionalLight(255, 255, 255, 1, 0, 0);
    }
  }
  
    if (keyPressed){
    if(key == '-'){
        stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2 - 304.15, height/2 - 172.9);
  directionalLight(255, 255, 255, .666, .333, 0);
    }
  }
  
    if (keyPressed){
    if(key == '='){
        stroke(random(255));
  strokeWeight(random(s));
  line(x, y, width/2 - 177.8, height - 301.35);
  directionalLight(255, 255, 255, .333, .666, 0);
    }
  }
  

  pushMatrix();
  translate(width/2, height/2);
  lights();
  noStroke();
  fill(c);
  sphere(sizesp);
  popMatrix();
  
}

void keyReleased(){
 if (key == '1'){
  x = width/2;
  y = 0;
 } 
 
 if (key == '2'){
  x = width/2 + .5*size;
  y = height/2 - .865*size;
 } 
 
 if (key == '3'){
  x = width/2 + .862*size;
  y = height/2 - .506*size;
 } 
 
 if (key == '4'){
  x = width;
  y = height/2;
 } 
 
 if (key == '5'){
  x = width/2 + .868*size;
  y = height/2 + .496*size;
 } 
 
 if (key == '6'){
  x = width/2 + .496*size;
  y = height/2 + .868*size;
 } 
 
 if (key == '7'){
  x = width/2;
  y = height;
 } 
 
 if (key == '8'){
  x = width/2 - 495*size;
  y = height/2 + 868*size;
 } 
 
 if (key == '9'){
  x = width/2 - .858*size;
  y = height/2 + .512*size;
 } 
 
 if (key == '0'){
  x = 0;
  y = height/2;
 } 
 
 if (key == '-'){
  x = width/2 - .872*size;
  y = height/2 - .488*size;
 } 
 
 if (key == '='){
  x = width/2 - .507*size;
  y = height/2 - .861*size;
 } 
}


