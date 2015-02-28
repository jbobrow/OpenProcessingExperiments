
PImage img;



void setup() {
  size(600,566);
  smooth();

  img = loadImage("bild3.jpg");
}

int groesse1 = 10;

void draw() {
   randomSeed(0);
  background (255,50,100);

  
  for (int i = 0; i< width/10; i+= 1) {
    for (int j =0; j< height/10; j+=1){
      

      float groesse2 = 400-brightness(img.get(i*groesse1, j*groesse1));
      float r =  (img.get(i*groesse1, j*groesse1))/40;

      fill(img.get(i*groesse1, j*groesse1) );


      pushMatrix();
      translate(i*groesse1, j*groesse1);

strokeWeight(groesse2/50);
      line (groesse2/60,groesse2/60,groesse2/60,groesse2/60);




      popMatrix();
      

      
if(mousePressed== true){

  strokeWeight(groesse2/50);
      line (groesse2/2*random(0,20)*mouseX,groesse2/2*random(0,20)*mouseY,groesse2/2*random(0,20),groesse2/2*random(0,20));
  
}
  }
}
}



