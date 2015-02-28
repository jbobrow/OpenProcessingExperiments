
int value=0;
float vel=0;


void setup(){
 
  size(800,800);
  background(0);
  colorMode(HSB);
 
  smooth();
  
  
}
void draw(){
  fill(0, 20);
  rect(0, 0, width, height);
  
  noCursor();

  noStroke();
  
   
  vel=dist(mouseX, mouseY, pmouseX, pmouseY);
  
  
  if(vel>=0){
    fill(vel*0.5, mouseX*0.5, 250);
    ellipse(mouseX, mouseY, 20, 20);
  }
  
    if(vel>=5){
      fill(vel*0.5, mouseX*0.5, 250);
      //fill(185, 26, 17);
    ellipse(mouseX, mouseY, 30, 30);
  }
  
    if(vel>=10){
      fill(vel*0.5, mouseX*0.5, 250);
      //fill(240, 95, 87);
       ellipse(mouseX, mouseY, 40, 40);
  }
    if(vel>=15){
      fill(vel*0.5, mouseX*0.5, 250);
      //fill(245, 151, 146);
       ellipse(mouseX, mouseY, 50, 50);
  }
    if(vel>=20){
     fill(vel*0.5, mouseX*0.5, 250);
      // fill(247, 203, 145);
    ellipse(mouseX, mouseY, 60, 60);
  }
  
    if(vel>=25){
      fill(vel*0.5, mouseX*0.5, 250);
      //fill(240, 168, 70);
    ellipse(mouseX, mouseY, 70, 70);
  }
  
    if(vel>=30){
     fill(vel*0.5, mouseX*0.5, 200);
     // fill(106, 125, 17);
       ellipse(mouseX, mouseY, 80, 80);
  }
    if(vel>=35){
      fill(vel*0.5, mouseX*0.5, 250);
      //fill(153, 94, 13);
       ellipse(mouseX, mouseY, 90, 90);
  }
}
