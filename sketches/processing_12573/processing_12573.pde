

  // AROS POR ICARO LOOPEZ DE MESA MOYANO

int radios = 50;
void setup(){
  
  size(900,900, P3D);
  background(255);
  frameRate(15);
  smooth();
 
}
void draw(){
  int s = millis();
 int a= width/radios;
 int b= height/radios;
 if (mousePressed == true){
   rotateX(map(mouseX,0 ,height , -PI, PI));
  rotateY(map(mouseY,0,width, -PI,PI));
  beginShape(QUAD_STRIP);
 
 for (float i=0; i<width; i+=a){
   // AQUI PODEMOS JUGAR CON LOS VALORES DEL COLOR
  
      stroke(random(50),random(200), random(200));
      
      strokeWeight(1);
       noFill();
        // AQUI PODEMOS INTERVENIR EL TAMAÑO DE LOS AROS
    ellipse(mouseX,mouseY,i++/4,i++/4);
    radios = s++;

  }
 }
}
void keyPressed(){
  background (255);
}



