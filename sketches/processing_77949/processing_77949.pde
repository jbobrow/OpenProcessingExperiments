
void setup(){
  size(600,600);
  smooth();
  background(0);
}

void draw(){  

  if(mousePressed && (mouseButton==LEFT)){
    fill(random(255),random(255),random(255));
    stroke(255);
    triangle(mouseY,mouseX,mouseY-10,mouseX+20,width/2,height/2);
    fill(255,random(255),30);
    ellipse(mouseX,mouseY,30,30);
    //dibujaremos triangulos desde el centro y una circunferencia te seguirá
  }
  if(mousePressed==false){
    background(0);
    // al poner esto borramos todo lo que se haya dibujado
  }
  if(mousePressed && (mouseButton==RIGHT)){
    fill(38,234,193);
    ellipse(mouseX,mouseY,50,50);
    if(keyPressed && key =='a'){
      fill(random(255),125,random(255));
      rect(mouseX,mouseY,80,80);
    }

  }
  
}

