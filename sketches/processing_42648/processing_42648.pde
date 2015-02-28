
void setup() {
  size(600, 600);
  smooth();
}

void draw()

{

  if (mousePressed) {
   
    fill(0);
    rect(0, 0, width, height);
    //cropo//
     fill(#9AFC08);
     ellipse(mouseX+25, mouseY-50, 400, mouseY/2+200);
   //bulbi//
    fill(#FFF300);
    ellipse(mouseX-50, mouseY-50, 120, 120);
    ellipse(mouseX+100, mouseY-50, 120, 120);
   //occhietto sinistro//
  fill(0);
    ellipse(mouseX-50, mouseY-50, 40, 50);
    ellipse(mouseX+100, mouseY-50, 40, 50); 
    //trucco sinistro//
    fill(#790793);
    arc(mouseX+100, mouseY-50, 120,120, PI, TWO_PI);
    fill(#FFF300);
    arc(mouseX+100, mouseY-48, 120,60, PI, TWO_PI);
     //trucco destro//
     fill(#790793);
     arc(mouseX-50, mouseY-51, 120,120, PI, TWO_PI);
    fill(#FFF300);
    arc(mouseX-50, mouseY-50, 120,60, PI, TWO_PI);
    
    
  } else{
    background(#000000);
    //corpo prima//
    fill(#9AFC08);
    ellipse(mouseX+25, mouseY-50, 400, mouseY/2+200);
    //occhi//
  fill(#790793);
    ellipse(mouseX-50, mouseY-50, 120, 120);
    ellipse(mouseX+100, mouseY-50, 120, 120);
      }
    
    //testa//
  }


