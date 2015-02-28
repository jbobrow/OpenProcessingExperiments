


void setup(){
size (700,500);
background(230,242,57);
frameRate(30);
smooth();

stroke(79,77,42);
strokeWeight(15);
line(200,200,200,500);

stroke(135,67,22);
strokeWeight(14);
line(500,500,500,230);

stroke(80,40,8);
strokeWeight(15);
line(375,500,375,190);

stroke(96,40,14);
strokeWeight(13);
line(105,240,105,500);

stroke(130,77,22);
strokeWeight(8);
line(80,420,80,200);

stroke(95,77,15);
strokeWeight(7);
line(290,420,290,210);

stroke(72,60,10);
strokeWeight(8);
line(430,420,430,195);

stroke(140,90,20);
strokeWeight(7);
line(575,420,575,205);

stroke(79,51,45);
strokeWeight(4);
line(60,380,60,190);
}

void draw(){
  if (mousePressed== true){
  if(mouseY > 250) {
    stroke(random(66,156),random(42,119),random(7,52));
    strokeWeight(random(1,10));
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
  
  
  else{
    noStroke();
    fill(random(25,98),182,random(35,150),random(70,100));
    ellipse(mouseX,mouseY,random(100,250),random(100,250));
  }
  }
  
  if(keyPressed){
    
    if (key == 'a'){
    fill(random(140,255),random(0,80),random(0,42));
    stroke(230,242,57);
    strokeWeight(2);
    ellipse(mouseX,mouseY,random(10,15),random(15,20));
  }
  else if (key == 'f'){
    fill(random(166,252),129,random(120,252),70);
    stroke(255,200,200);
    strokeWeight(1);
    ellipse(mouseX,mouseY,10,10);
    ellipse((mouseX-5),(mouseY-5),10,10);
    ellipse((mouseX-5),(mouseY+5),10,10);
  }
  }
  
}

