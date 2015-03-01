
//Eric Conejo Tejada

void setup (){
  size(800,800);
}
 
void draw (){
  background(0,mouseX-100,mouseY-100);
  smooth();
  
  fill(235,215,175);
  stroke(1);
  bezier(mouseX-100,mouseY,mouseX-100,mouseY+150,mouseX+100,mouseY+100,mouseX+100,mouseY);//mano
  bezier(mouseX-90,mouseY+50,mouseX-100,mouseY+50, mouseX-150,mouseY,mouseX-100,mouseY);//dedo pulgar
  bezier(mouseX-100,mouseY,mouseX-100,mouseY-75,mouseX-50,mouseY-75,mouseX-50,mouseY);//dedo indice
  bezier(mouseX-50,mouseY,mouseX-50,mouseY-100,mouseX,mouseY-100,mouseX,mouseY);//dedo corazón
  bezier(mouseX,mouseY,mouseX,mouseY-75,mouseX+50,mouseY-75,mouseX+50,mouseY);//dedo anular
  bezier(mouseX+50,mouseY,mouseX+50,mouseY-50,mouseX+100,mouseY-50,mouseX+100,mouseY);//dedo meñique
  
  fill(255,255,0);
  noStroke();
  rect(mouseX-50,mouseY-25,52,16,8);//anillo
    
  if (mousePressed){
    fill(235,215,175);
    stroke(1);
    bezier(mouseX-50,mouseY,mouseX-50,mouseY-200,mouseX,mouseY-200,mouseX,mouseY);//dedo corazón
    bezier(mouseX-40,mouseY-50,mouseX-40,mouseY-60,mouseX-10,mouseY-60,mouseX-10,mouseY-50);//arruga
    
    fill(255,0,0);
    noStroke();
    bezier(mouseX-40,mouseY-110,mouseX-40,mouseY-180,mouseX-10,mouseY-180,mouseX-10,mouseY-110);//uña
    
    fill(255,255,0);
    rect(mouseX-50,mouseY-25,52,16,8);//anillo
    
    fill(0);
    text("FUCK!!",mouseX-42,mouseY-12); //texto
  } 
}

