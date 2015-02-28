
void setup(){
  size(500, 500);
  smooth();
}
color c1 = color(0,255,0);
color c2 = color(150);
color c3 = color(0,255,0);
color c4 = color(150);
void draw(){
  background(c2);
  fill(c4);
  rect(100,400,300,50);
  fill(200);
  ellipse(50,250,40,40);
  fill(c1);
  ellipse(50,250,30,30);
  if(dist(mouseX,mouseY, 50,250)<15){
    c1=color(255,0,0);
    
  }else{c1=color(0,255,0);}
  if(dist(mouseX,mouseY,50,250)<15 && mousePressed){
    c2=color(255,255,0);
    for (int x=10;x<width;x+=20) {
    for (int y=10;y<height;y+=20) {
      fill(c1, c2, c3, 50);
      noStroke();
      ellipse(x, y, 20, 20);
    }
  }

  }else{c2=color(150); stroke(0);}
  fill(200);
  ellipse(450,250,40,40);
  fill(c3);
  ellipse(450,250,30,30);
  if(dist(mouseX,mouseY, 450,250)<15){
    c3=color(255,0,0);
  }else{c3=color(0,255,0);}
  if(dist(mouseX,mouseY,450,250)<15 && mousePressed){
    c4=color(random(1,255),random(1,255),random(1,255));
    text("RAVE BOX",150,425);
  }else{c4=color(150);}
  
  
}

