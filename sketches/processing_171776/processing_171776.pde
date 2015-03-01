
void setup() {
  size(400, 300);
  background(253, 255, 240);
  strokeWeight(5);
  fill(255, 246, 111);
}

void draw() {
    background(#AEE7F0);
    println(mouseX + "," + mouseY);
    
    if (mousePressed == true){
      
  //cabeza
     fill(252, 232, 101);
     stroke(177, 165, 35);
     ellipse(100+mouseX, 150+mouseY, 150, 150);
  //ojos
    strokeWeight(2);
    stroke(0, 0, 0);
  //ojo1
    fill(255, 255, 255);
    ellipse(75+mouseX, 130+mouseY, 35, 35);
    fill(9, 9, 9);
    ellipse(75+mouseX, 130+mouseY, 20, 20);
  //ojo2
    fill(255, 255, 255);
    ellipse(125+mouseX, 130+mouseY, 35, 35);
    fill(9, 9, 9);
    ellipse(125+mouseX, 130+mouseY, 10, 10);
  //boca
  //line
    fill(222, 43, 63);
    ellipse(100+mouseX, 185+mouseY,30,20);
    line(105+mouseX, 160+mouseY, 95+mouseX, 160+mouseY);
  //pecas
  //point1
    strokeWeight(3);
    point(55+mouseX, 160+mouseY);
    point(60+mouseX, 160+mouseY);
    point(65+mouseX, 160+mouseY);
    point(60+mouseX, 165+mouseY);
  //point2
    strokeWeight(3);
    point(130+mouseX, 160+mouseY);
    point(135+mouseX, 160+mouseY);
    point(140+mouseX, 160+mouseY);
    point(135+mouseX, 165+mouseY);
    
    }
   else {
     background(#EFD5BE);
     
     println(mouseX + "," + mouseY);
  
  //ojo1
    fill(255, 255, 255);
    ellipse(75+mouseX, 130+mouseY, 35, 35);
    fill(9, 9, 9);
    ellipse(75+mouseX, 130+mouseY, 10, 10);
  //ojo2
    fill(255, 255, 255);
    ellipse(125+mouseX, 130+mouseY, 35, 35);
    fill(9, 9, 9);
    ellipse(125+mouseX, 130+mouseY, 10, 10);
  //boca
  //line
    fill(222, 43, 63);
    arc(100+mouseX, 185+mouseY, 30, 30, radians(8), radians(170));
    line(105+mouseX, 160+mouseY, 95+mouseX, 160+mouseY);
  
   }
}




