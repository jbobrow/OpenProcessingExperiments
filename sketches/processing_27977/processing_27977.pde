

// festlegen aller gebrauchten variablen
float zufallA, zufallB;

// stage einrichten
void setup(){
size(300,300);
smooth();

}



void draw(){

noStroke();
fill(255,30);
rect(0, 0, width, height);
 fill(0);
  stroke(0);


if(mousePressed){
  zufallA = random((-mouseX/4),mouseX/4);
  zufallB = random((-mouseY/4),mouseY/4);
 
  ellipse(150+zufallA,150+zufallB,100,100);
}
else{
ellipse(150,150,100,100);
}

}






