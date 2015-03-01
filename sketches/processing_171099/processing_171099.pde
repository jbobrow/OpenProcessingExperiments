
int x, y;
int value1 = 250;
int value2 = 40;
int strokkke = 1;
void setup (){
  size (1200, 1200);
  background (255); 
}
void draw (){
//IF per les tecles i els seus resultats
  if (keyPressed){
    if(key == 'r'){
        background(random(255),0,0);
    }
    else if(key == 'g'){
        background(0,random(255),0);
    }
    else if(key == 'b'){
        background(0,0,random(255));
    }
    else if (key == 'a'){
        background(random(255),random(255),random(255));
    }
    else if (key == 'w'){
        background(255,255,255);
    }
    else if (key == 'e'){
      fill(random(255),random(255),random(255));
      ellipse(value1,value1,value2,value2);
    }
   
  }
  // IF per dibuixar amb el llapis quan estigui cliclat.
  if (mousePressed){
  strokeWeight(strokkke);
  line (mouseX, mouseY, pmouseX, pmouseY);
  }
  //IF perque les rodones aleatories segueixin el ratolí
  if(mousePressed){
    value1 = mouseX;
    value2 = mouseY;
  }
 
}
// IF perque l'amplada del llapís vagi variant amb les tecles + i -
void keyPressed() {
   if (key == '+'){
      strokkke = strokkke +1;      
    }
    else if (key == '-'){
      strokkke = strokkke -1;      
    }
}


