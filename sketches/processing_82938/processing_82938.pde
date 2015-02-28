
//////// 7 Farbkontraste nach Itten/////////////
//Matthias Schäfer//

/* To Do:
-Farben randomizen
-Quiz "Welcher Farbkontrast ist das? */

int rgb;


void setup(){
  background(255);
  size(700,500);
  fill(0);
  noStroke();
  rect(500,0,200,500);
  fill(255);
  text("1. Farbe-an-sich-Kontrast",510,20);
  text("2. Hell-Dunkel-Kontrast",510,40);
  text("3. Kalt-Warm-Kontrast",510,60);
  text("4. Komplementärkontrast",510,80);
  text("5. Simultankontrast",510,100);
  text("6. Qualitätskontrast",510,120);
  text("7. Quantitätskontrast",510,140);
  
}

void draw(){
  if(keyPressed == true){
    if(key == '1'){
     fill(0,0,255);
     rect(0,0,500,500);
     fill(255,0,0);
     rect(100,100,300,300);
     fill(255,255,0);
     rect(175,175,150,150);
    }
    if(key == '2'){
     fill(34,18,105);
     rect(0,0,500,500);
     fill(255,255,0);
     rect(100,100,300,300);
    }
    if(key == '3'){
     fill(27,134,121);
     rect(0,0,500,500);
     fill(224,60,0);
     rect(100,100,300,300);
    }
    if(key == '4'){
     fill(41,129,0);
     rect(0,0,500,500);
     fill(188,23,12);
     rect(100,100,300,300);
    }
    if(key == '5'){
     fill(255,251,0);
     rect(0,0,500,500);
     fill(201,201,201);
     rect(100,100,300,300);
    }
    if(key == '6'){
     fill(23,57,84);
     rect(0,0,500,500);
     fill(71,179,255);
     rect(100,100,300,300);
    }
     if(key == '7'){
     fill(235,109,0);
     rect(0,0,500,500);
     fill(20,75,152);
     rect(225,225,25,25);
    }
  }

}
