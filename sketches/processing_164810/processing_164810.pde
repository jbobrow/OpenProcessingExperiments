
void setup(){
  background(#56C5DB);
  size(500,500);

}

void draw(){
  frameRate(30);
  noStroke();
  if(mousePressed && mouseY>=320){
  fill(#1D732A);
    curve(mouseX, mouseY, mouseX+random(-30,30), mouseY+random(60,100), mouseX+random(-30,30), mouseY+random(-30,30), mouseX+random(-30,30), mouseY+random(-30,30));
  }
  if(mousePressed && mouseY<=100){
  fill(#DCF3F7,50);
    ellipse(mouseX,mouseY,100,25);
  }
if (keyPressed) {
      fill(#56C5DB);
      rect(0,0,500,500);
      }

  if (mousePressed && (mouseY>100 && mouseY<240)){   
    
    fill(252,8,random(100,255));
    curve(mouseX-25, mouseY, mouseX-random(25,100),mouseY+25,mouseX-15,mouseY+50,mouseX,mouseY);                              
    curve(mouseX+25, mouseY, mouseX+25,mouseY+random(25,70),mouseX-15,mouseY+50,mouseX,mouseY);
    fill(252,8,255);
    ellipse(mouseX-25,mouseY+45,20,35);
    ellipse(mouseX-20,mouseY+25,20,15);
    fill(#FFEB0F);
    triangle(mouseX-11,mouseY+31,mouseX-11,mouseY+21,mouseX-5,mouseY+26);
    fill(0);
    ellipse(mouseX-18,mouseY+24,5,5);
    fill(255);
    ellipse(mouseX-18,mouseY+25,2,2);
    fill(#56C5DB,50);
    rect(0,115,500,200);
  }else{
    fill(#56C5DB,50);
    rect(0,115,500,200);
  }
}

