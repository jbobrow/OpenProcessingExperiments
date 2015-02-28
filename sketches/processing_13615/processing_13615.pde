

//Firefly
//by Brianna Hoftun

void setup() {
  size(600, 600);
  background(0);
} 

void draw() {
  background(0);
  fill(8,8,8,random(255));
  ellipse((mouseY), (mouseX+20), 70, 70);
  fill(16,16,16, random(255));
  ellipse((mouseY), (mouseX+20), 60, 60);
  fill(32,32,32,random(255));
  ellipse((mouseY), (mouseX+20), 50,50);
  fill(64,64,64,random(255));
  ellipse((mouseY), (mouseX+20), 40, 40);
  fill(128,128,128, random(255));
  ellipse((mouseY), (mouseX+20), 30, 30);
  fill(220,220,220,random(255));
  ellipse((mouseY), (mouseX+20), 20, 20);
  fill(255);
  ellipse((mouseY), (mouseX+20), 10, 10);
  
  fill(8,8,8,random(255));
  ellipse((mouseY+mouseX), (mouseX), 70, 70);
  fill(16,16,16, random(255));
  ellipse((mouseY+mouseX), (mouseX), 60, 60);
  fill(32,32,32,random(255));
  ellipse((mouseY+mouseX), (mouseX), 50,50);
  fill(64,64,64,random(255));
  ellipse((mouseY+mouseX), (mouseX), 40, 40);
  fill(128,128,128, random(255));
  ellipse((mouseY+mouseX), (mouseX), 30, 30);
  fill(220,220,220,random(255));
  ellipse((mouseY+mouseX), (mouseX), 20, 20);
  fill(255);
  ellipse((mouseY+mouseX), (mouseX), 10, 10);
  
  fill(8,8,8,random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 70, 70);
  fill(16,16,16, random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 60, 60);
  fill(32,32,32,random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 50,50);
  fill(64,64,64,random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 40, 40);
  fill(128,128,128, random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 30, 30);
  fill(220,220,220,random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 20, 20);
  fill(255);
  ellipse((mouseY-mouseX), (mouseX+mouseY), 10, 10);
    
  fill(140);
  triangle((mouseX-120), (mouseY-60), (mouseX-125), (mouseY-30), (mouseX-70), (mouseY-75));
  fill(125);
  triangle((mouseX-100), (mouseY-100), (mouseX-120), (mouseY-60), (mouseX-40), (mouseY-70));
  fill(110);
  triangle(mouseX, (mouseY-40), mouseX, (mouseY-160), (mouseX-100), (mouseY-100));
  fill(134,58,0);
  rect((mouseX-7), (mouseY-45),7,120);
  ellipse(mouseX, (mouseY-100), 35, 130);
  fill(70);
  ellipse(mouseX, (mouseY-100), 25, 120);
  
  fill(8,8,8,random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY), 70, 70);
  fill(16,16,16, random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY), 60, 60);
  fill(32,32,32,random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY), 50,50);
  fill(64,64,64,random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY), 40, 40);
  fill(128,128,128, random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY), 30, 30);
  fill(220,220,220,random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY), 20, 20);
  fill(255);
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY), 10, 10);
  
  fill(8,8,8,random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY+ (mouseX*2)), 70, 70);
  fill(16,16,16, random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY+ (mouseX*2)), 60, 60);
  fill(32,32,32,random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY+ (mouseX*2)), 50,50);
  fill(64,64,64,random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY+ (mouseX*2)), 40, 40);
  fill(128,128,128, random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY+ (mouseX*2)), 30, 30);
  fill(220,220,220,random(255));
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY+ (mouseX*2)), 20, 20);
  fill(255);
  ellipse(((mouseY*mouseX+10)/ (mouseX+1)), (mouseY+ (mouseX*2)), 10, 10);

  fill(255);
  textSize(18);
  text("Catch a firefly with the net and you shall receive delicious cake...", 75, 585);
}
      

