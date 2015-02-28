
int x = 10; 
int y = 10; 
int w = 20; 
int h = 20; 

void setup()
{  
  size (640,360);
  fill(0,102);
  smooth();
  background(255);
}

void draw()
{ 
  
  //rectangle gris de la barre
  noStroke();
  fill(200);
  rect(0, 0, 50, 360);
   
  //dessinateur
  if (mousePressed == true) { 
  stroke(4);
  line(mouseX,mouseY,pmouseX,pmouseY);
  }  
  
  //outil gomme
  
  //texte
  fill(0);
  textSize(8);
  text("Gomme", 5, 7);
  
  //rectangle
  stroke(0);
  fill(0);
  rect(x, y, w, h); 
  
  //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
  (mouseY > y) && (mouseY < y+h)) { 
    background(255);
  } 
 
 
 
  //outil forme
  
  //carre
  noStroke();
  fill(255);
  rect(x, 4*y, w, h);
  //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
    (mouseY > 4*y) && (mouseY < 4*y+h)) { 
  fill(random(0,255),random(0,255),random(0,255));
  rect(random(0,640), random(0,640), random(0,50), random(0,50));
    }
  
  //ellipse
  noStroke();
  fill(255);
  ellipse(2*x, 8*y, w, h);
  //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
    (mouseY > 8*y) && (mouseY < 8*y+h)) { 
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(random(0,640), random(0,640), random(0,50), random(0,50));
  }
  
  //ligne noir
  stroke(0);
  line(x-0.4, 11*y, 4*x, 11*y);
  //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
    (mouseY > 11*y) && (mouseY < 11*y+h)) { 
    float weight=dist(mouseX,mouseY,pmouseX,pmouseY);
    stroke(0,0,random(0,255));
    line(random(0,640), random(0,640), random(0,640),random(0,640));
  }
  
    //ligne rouge
  stroke(255,0,100);
  line(x-0.4,30*y,4*x,30*y);
  //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
    (mouseY > 30*y) && (mouseY < 30*y+h)) { 
    float weight=dist(mouseX,mouseY,pmouseX,pmouseY);
    strokeWeight(weight);
    line(random(0,630),random(0,630),random(0,630),random(0,630));

  }  
  
  
  
  //outil couleur

  //turquoise
  noStroke();
  fill(0, 138, 168);
  rect(10, 130, 25, 20);
  //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
    (mouseY > 13*y) && (mouseY < 13*y+h)) { 
      fill(0, 138, 168);
      ellipse(random(0,640), random(0,640), random(0,100), random(0,100));
}

 //bordeau
  noStroke();
  fill(134, 40, 100);
  rect(10, 160, 25, 20);
 //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
    (mouseY > 16*y) && (mouseY < 16*y+h)) { 
    fill(134, 40, 100);
    ellipse(random(0,640), random(0,640), random(0,100), random(0,100));
  }
  
  //violet
  noStroke();
  fill(108, 0, 130);
  rect(10, 190, 25, 20);
  //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
    (mouseY > 19*y) && (mouseY < 19*y+h)) { 
     fill(108, 0, 130);
     ellipse(random(0,640), random(0,640), random(0,100), random(0,100));
  }
  
  //rose
  noStroke();
  fill(203, 86, 158);
  rect(10, 220, 25, 20);
  //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
  (mouseY > 22*y) && (mouseY < 22*y+h)) { 
  fill(203, 86, 158);
  ellipse(random(0,640), random(0,640), random(0,100), random(0,100));
}
  
  //vert
  noStroke();
  fill(60, 107, 123);
  rect(10, 250, 25, 20);
 //condition
  if ((mousePressed == true) && (mouseX > x) && (mouseX < x+w) && 
    (mouseY > 25*y) && (mouseY < 25*y+h)) { 
    fill(60, 107, 123);
    ellipse(random(0,640), random(0,640), random(0,100), random(0,100));
    }
  
}

