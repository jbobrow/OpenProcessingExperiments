
void setup(){
    size(400,400);
   // background(227,76,76);

}

void draw(){
  //noStroke();
   background(#A7A7A7);
   //fill(36,237,104);
  stroke(0);
  strokeWeight(5);
  //rect(100,100,100,100);
  
    
  //ellipse(200,200,100,100);
  //triangle(30,30,100,150,200,150);
 //quad(50,50,200,50,210,200,60,200);
  //line(20,20,250,250);
  
  //rect(mouseX-100,mouseY-100,200,200);
 // fill(232,40,40,0);
  //ellipse(200,200,75,75);
   //ellipse(200,200,50,50);
    //ellipse(200,200,25,25);
    line(10,20,10,380);
    textSize(32);
    fill(0);
text("1", 15, 40); 
text("2", 15, 140); 
text("3", 15, 260);
text("4", 15, 380); 
  fill(232,40,40,mouseY/2);
  ellipse(200,200,100,100);
  //line(mouseX-100,mouseY-100,150,150);
  //line(mouseX-100,mouseY+100,150,250);
  //line(mouseX+100,mouseY-100,250,150);
  //line(mouseX+100,mouseY+100,250,250);
  
  
  println(mouseX+" "+mouseY);
  
  
}


