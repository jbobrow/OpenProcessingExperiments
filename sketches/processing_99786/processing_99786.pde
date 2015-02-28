
int x=100;
int x1=400;

void setup () {
  size(500, 500);
  background(126, 230, 255);
  rectMode(CORNERS);

}

void draw () {
  
    frameRate(30);
        ellipse(x,height/2,20,20);
    x+=1;  
    ellipse(x1,height/2,20,20);
    x1+=-1; 
  if (mouseX<width/2) {
    background(126, 230, 255);

    float r=random(80);
    float s=random(100);     
    stroke(255);
    strokeWeight(1);
    fill(170, r, 255);
    rect(width/100, height/25, width/12.5, height/2);
    strokeWeight(2);

    fill(160, s, 255);
    rect(width/100, height/8, width/8, height/2);
    strokeWeight(3);
    fill(200, r, 255);
    rect(width/100, height/4, width/4, height/2);
    strokeWeight(4);

    fill(215, r, 255);
    rect(width/100, height/2, width/2, height);

    fill(230, s, 255);
    strokeWeight(5);
    rect(width/100, height/1.25, width/1.25, height);
    frameRate(30);
    ellipse(x,height/2,20,20);
    x+=1;  
}

  else {
  background(126, 230, 255);
    strokeWeight(1);
    stroke(1);    
    fill(255, 255, 0);
    rect(width/12.5+5, height/25, 90+width/1.25, height/8);
    fill(255, 255, 100,150);
    rect(width/8, height/8, 90+width/1.25, height/4);
    fill(255,255,150,100);
    rect(width/4, height/4, 90+width/1.25, height/2);
    fill(255,255,200,75);
    rect(width/2, height/2, 90+width/1.25, height/1.25);
    fill(255,255,225,40);
    rect(width/1.25, height/1.25, 90+width/1.25, height);
    frameRate(30);
    ellipse(x1,height/2,20,20);
    x1+=-1; 
  }
    
    
//  if ((mouseY>220) && (mouseY<280)) {
;
  }
  /*    else if ((mouseY>height/25)&&(mouseY<height/8)) {
   stroke(255);
   strokeWeight(1);
   fill(170, 180, 255);
   rect(width/100, height/25, width/12.5, height/2);
   }
   if ((mouseY>height/8)&&(mouseY<height/4)) {
   strokeWeight(2);
   float s=random(255);
   fill(160, 75, 255, s);
   rect(width/100, height/8, width/8, height/2);
   }
   
   
   if ((mouseY>height/4) && (mouseY<height/2)) {
   strokeWeight(3);
   fill(200, 75, 255);
   rect(width/100, height/4, width/4, height/2);
   }
   
   if ((mouseY>height/2)&&(mouseY<height/1.25)) {
   strokeWeight(4);
   float r=random(65);
   fill(215, r, 255);
   rect(width/100, height/2, width/2, height);
   }
   else {
   fill(230, 65, 255);
   strokeWeight(5);
   rect(width/100, height/1.25, width/1.25, height);
   }*/




