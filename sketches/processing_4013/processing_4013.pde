
//created by stephen wang
//inspired by Daria Lanz'straffic light coding
//http://www.openprocessing.org/visuals/?visualID=2454

 

void setup() {
  size(500, 300);
  smooth ();
}

void draw() {
  background(116,218,232);

  
color door = color(53, 113, 62);
color window1 = color(204, 153, 0);
color window2 = color(204, 153, 0);
color Floor = color(153, 20, 10);
color Ceiling = color (85, 113, 53);
color wall1 = color (97, 128, 234);
color wall2 = color (97, 128, 234);
color wall3 = color (199, 206, 232);
color light1 = color (255, 248, 100);
color light2 = color (255, 248, 100);

fill(wall3);
rect(0, 0, 480, 280);
fill(door);
rect(195, 80, 120, 200);
fill(window1);
rect(40, 80, 90, 100);
fill(window2);
rect(370, 80, 90, 100);
fill(Floor);
rect(0, 280, 500, 10);
fill(wall1);
rect(0, 0, 20, 280);
fill(wall2);
rect(480, 0, 20, 280);

fill(light1);
ellipse(100, 20, 40, 40);
fill(light2);
ellipse(400, 20, 40, 40);
fill(Ceiling);
rect(0, 0, 500, 20);
  
  if(mousePressed) {
    color (199, 206, 232);
    rect(195, 80, 120, 200);
  } else {
    stroke(232);
  }
  
  
  
 if (mouseX > 35 && mouseX < 80 && mouseY > 75 && mouseY < 140) { 
   
    fill(199, 206, 232);
     rect(40, 80, 90, 100);
  } 
  else if (mouseX > 350 && mouseX < 390 && mouseY > 60 && mouseY < 100) { 
    fill(199, 206, 232);
    rect(370, 80, 90, 100);
  } 
  else if (mouseX > 150 && mouseX < 300 && mouseY > 30 && mouseY < 150) { 
    fill(199, 206, 232);
    rect(195, 80, 120, 200);
  }
  
  else if (mouseX > 150 && mouseX < 300 && mouseY > 30 && mouseY < 150) { 
    float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(204, 204, 204, -dirX, -dirY, -1); 
  translate(width/2 - 100, height/2, 0); 
   ellipse(100, 20, 40, 40);
  translate(200, 0, 0); 
   ellipse(400, 20, 40, 40);
    
  }
   else if (mouseX > 150 && mouseX < 300 && mouseY > 30 && mouseY < 150) { 
    fill(199, 206, 232);
    ellipse(400, 20, 40, 40);
  }
}


