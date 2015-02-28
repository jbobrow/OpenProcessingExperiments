
float angulo = 0.0;

void setup(){
  size(1300, 760);
  smooth();
    noStroke();
}

void draw(){
  angulo = angulo + 0.85;
  
  fill(255);
  
  angulo = angulo + 0.85;
  translate(450, 400);
  rotate(angulo);
  rect(0, 0, 150, 1);
  
  fill(80,11,106,7); // fucsia oscuro
  rect(250, 190, 300, height);
  
 
  fill(255);
  rotate(angulo);
  rect(0, 0, 200, 1);
  
  //fill(255);
  rotate(angulo);
  rect(0, 0, 80, 1);
  
  //fill(255);
  rotate(angulo);
  rect(0, 0, 230, 1);
  
  //fill(255);
  rotate(angulo);
  rect(0, 0, 200, 1);
  
  //fill(255);
  rotate(angulo);
  rect(0, 0, 250, 1);
  fill(95, 15,247,5); //violeta
  rect(0, 0, 450, height);
   
  fill(255);
  rotate(angulo);
  rect(0, 0, 120, 1);
  
  //angulo = angulo + 0.5;
  fill(15, 21,183,7); //azul
  rect(0, 0, 150, height);
  
  fill(255);
  rotate(angulo);
  rect(0, 0, 110, 1);
  
  //angulo = angulo + 0.52;
  fill(120,146,229);
  rotate(angulo);
  rect(0, 0, 280, 1);
  
   rotate(angulo);
  rect(0, 0, 270, 1);
  
   //angulo = angulo + 0.52;
   rotate(angulo);
  rect(0, 0, 260, 1);
  
  fill(15, 67,247,7); //azul claro
  rect(0, 0, 200, height);
  
  

}


