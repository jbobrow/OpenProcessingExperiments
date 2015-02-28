
PImage apartamento,Twitter;
int n;
void setup() {
  size (320, 300);
  background (255);
  PImage img;
  apartamento = loadImage("oi.jpg");
  Twitter=loadImage("Twitter.png");
}
void draw(){ 
  image(apartamento,0,0);
  noCursor();
  fill(0);
  image(Twitter,mouseX,mouseY,30,30);


if (mousePressed == true) { 
stroke(0);
strokeWeight(10);  
 rect(100, 54, 15, 7);  
 rect(180, 95, 15, 7); 
rect(100, 94, 17, 8); 
rect(140, 94, 17, 8); 
rect(140, 54, 15, 7);
rect(180, 54, 15, 7); 
rect(100, 119, 15, 7);
rect(180, 120, 15, 7);
rect(140, 119, 15, 7);
rect(140, 149, 15, 7);
rect(100, 149, 15, 7);
rect(180, 149, 15, 7);
rect(180, 179, 15, 7);
rect(140, 179, 15, 7);
rect(100, 179, 17, 7);
rect(100, 205, 17, 7);
rect(140, 205, 17, 7);
rect(180, 205, 17, 7);
fill(0);
rect(0, 0, 77, 260);
rect(220, 0, 177, 258);
rect(70, 0, 157, 27);

 
}

strokeWeight(10);
stroke(220,200,0);
textSize(20);
text("Bom dia!", 3, 90);
  if (keyPressed == true) {
   stroke(255);
    fill(255);
    textSize(18);
text("Boa noite!", 3, 90);
 fill(255);
  ellipse(n, 30, 20, 20);
  ellipse(n+10, 25, 20, 20);
  ellipse(n+20, 30, 20, 20);
  n=n+0.5
  } else {
    fill(255,0,0);
  }
  
  ellipse(25, 25, 50, 50);
  
}
