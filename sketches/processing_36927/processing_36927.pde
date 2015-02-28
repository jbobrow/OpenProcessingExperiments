
void setup(){
  size(700,430);
  background(0);
  PFont catFont;
  catFont = loadFont("TempusSansITC-24.vlw");
  textFont(catFont,32);
  smooth();
}

void roundRect(float x, float y, float w, float h)
{
  float corner = w/10;
  float midDisp = w/20;
  
  beginShape();  
    curveVertex(x+corner,y);
    curveVertex(x+w-corner,y);
    curveVertex(x+w+midDisp,y+h/2.0);
    curveVertex(x+w-corner,y+h);
    curveVertex(x+w/2,y+h-midDisp);
    curveVertex(x+corner,y+h);
    curveVertex(x-midDisp,y+h/2.0);
    curveVertex(x+corner,y);
    curveVertex(x+w-corner,y);
    curveVertex(x+w+midDisp,y+h/2.0);
  endShape();
}

void draw(){
  
  //instructions at bottom
  fill(224,193,131);
  rect(0,350,700,80);
  fill(0);
  text("Use the mouse to pat the cat.",10,380);
  text("What happens if you rub him the wrong way?",10,420);
    
  //cat text 
  noStroke();
  if(mouseX >=100 && mouseX <=300 && mouseY >= 100 && mouseY <= 200){

        if (pmouseX > mouseX){
          fill(0);
          rect(400,75,300,100);
          fill(255);
          text("purr ... purrr ... ", 440, 100);
          text(".. purrrrr", 470, 130);
          println("happy cat");
        } else if (pmouseX < mouseX){
          fill(0);
          rect(400,75,300,100);   
          fill(255);      
          text("grrrrrr ... don't", 440, 100);
          text("do that! ", 470, 130);
          println("look out.  Kitty has claws.");
        } else if (pmouseX == mouseX){
          fill(0);
          rect(400,75,300,100);
          println("I hate it when they touch me there.");          
        } 
  } else {
      fill(0);
      rect(400,75,300,100);  
      fill(255);
      text("me ... me ... me .. ", 440, 100);
      println("Here I am.");        
  }
  
  //dark orange stuff
    //head and body
    noStroke();
    fill(219,128,9);
    roundRect(100,120,200,100);
    ellipseMode(CORNER);
    ellipse(300,50,90,90);
  
    //legs
    strokeWeight(20);
    stroke(219,128,9);
    line(280,240,305,290);
    line(260,270,245,290);
    line(150,240,160,290);
    line(130,270,115,290);
  
    //tail
    strokeWeight(10);
    stroke(219,128,9);
    noFill();
    curve(300,0,90,125,90,10,100,20);

  //light orange stuff
    //ears
    fill(224,193,131);
    strokeWeight(6);
    triangle(300,44,330,57,305,87);
    triangle(400,48,388,90,365,60);
    
    //stripes
    noFill();
    stroke(224,193,131);
    curve(125,125,175,125,175,160,150,175);
    curve(150,125,200,125,200,180,175,175);
    curve(175,125,225,125,225,200,200,175);
  
    //whiskers
    strokeWeight(3);
    stroke(224,193,131);
    line(270,100,320,110);
    line(265,112,315,115);
    line(270,125,318,120);
    line(370,110,420,110);
    line(365,115,422,119);
    line(370,120,420,130);

}





