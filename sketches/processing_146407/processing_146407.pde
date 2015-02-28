
/*
faccio un pennello che sempre disegna i fiori
Quando si muove il mouse piano, disegna i fiori
con un po' di random.
Quando si muove troppo veloce disegna dei punti 
piccolini come le traccie e le foglie.
Possiamo cambiare il colore dei fiori con il keyboard.
*/


//1Â° decide the background, the size and the color
void setup(){ 
  size(600, 800);
  background(255);
  smooth();
  frameRate(30);
  //2Â°the color of the flowers
} 

void draw(){
  //3Â° draw the green branch
  if(mousePressed == true){
    strokeWeight(random(8, 12));
    color verdeChiaro = color(233, 255, 188, random(85,100));
    color verdeScuro = color(169, 201, 182, random(80,100));
    color RAMO = lerpColor(verdeChiaro,verdeScuro,random(0,1));
    stroke(RAMO);
    line(mouseX, mouseY, pmouseX, pmouseY);
  } 
}

int flower_ALPHA = 80;
int flower_R = 231;
int flower_G = 60;  
int flower_B = 115;
color flower = color(flower_R, flower_G, flower_B, flower_ALPHA);

void keyPressed(){
    if (key == 'r' || key == 'R') {
      flower_R = (flower_R +1)%255;
      flower = color(flower_R, flower_G, flower_B, flower_ALPHA);
      fill(flower);
    } else if (key == 'a' || key == 'A') {
      flower_ALPHA = (flower_ALPHA +1)%100;
      flower = color(flower_R, flower_G, flower_B, flower_ALPHA);
      fill(flower);
    } else if (key == 'g' || key == 'G'){
      flower_G = (flower_G +1)%255;
      flower = color(flower_R, flower_G, flower_B, flower_ALPHA);
      fill(flower);
    } else if (key == 'b' || key == 'B'){
      flower_B = (flower_B +1)%255;
      flower = color(flower_R, flower_G, flower_B, flower_ALPHA);
      fill(flower);
    }else{
      noFill();
    }
  //4Â° draw the flowers
  noStroke(); 
  float r = random(8, 25); 
  float distance = dist(mouseX, mouseY, pmouseX, pmouseY);
  ellipse(mouseX+random(3-distance, distance-3), mouseY+random(3-distance, distance-3), r-distance/3, r-distance/3); 
}   

void keyReleased() {
  if (key=='c' || key=='C') {
    background(random(200,255), random(200,255), random(200,255), 255);
  }else if (key=='v' || key=='V') {
    background(255);
  } 
}   
