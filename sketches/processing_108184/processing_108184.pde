
int gato=0;

   float vel=0;
  void setup(){
    size(800,800);
    background(252,252,0);
  }
 
  void draw() {
    gato=gato+5;
    background(vel,0,0,0);
    vel= dist(mouseX, mouseY, pmouseX, pmouseY);// mide la velocidad
 
  stroke(18,4,20);
  fill(13,250,236);
  rect(600,600,600,600);
  fill(250,80,13);//naranja
    ellipse(gato,gato,250,250);
 
  fill(103,4,175);//morado
  ellipse(gato,mouseY,100,100);
  fill(182,242,247);//circulo interior
 
  ellipse(mouseX,gato,50,50);
  fill(88,250,40);//circulo interior verde
 
  ellipse(gato,gato,25,25);
  fill(31,13,250);
 
  rect(220,220,220,220);
    ellipse(gato,gato,25,25);
  if(gato>width){gato=0;}
 
}int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
