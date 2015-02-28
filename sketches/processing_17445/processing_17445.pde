
void setup() {
  size(200,200);
  background(110,50,5);
  smooth();
  
  //Cheese Tongue
  //stroke(50,30,0,80); //brown
  stroke(255,235,50);
  strokeWeight(2);
  line(0,110,200,110);
  fill(255,235,50);
  triangle(15,110,80,110,40,140);
}

void draw() {
  smooth();
//Buns
  noStroke();
  fill(235,175,2);
  rect(0,0,200,40);
  rect(0,170,200,40);
  
//Sesame
  fill(255);
  ellipse(100,20,5,7);
  ellipse(20,20,5,7);
  ellipse(50,10,5,7);
  ellipse(175,20,5,7);
  ellipse(150,10,5,7);
  ellipse(65,25,5,7);
  ellipse(135,25,5,7);
  
  
//Lettuce
  fill(0,200,0);
  //rect(0,58,200,5);
  //rect(0,157,200,5);
  
//Lettuce Top
  arc(10,59,20,10,PI/2,PI);
  arc(10,59,20,10,0,PI/2);
  arc(30,59,20,10,PI/2,PI);
  arc(30,59,20,10,0,PI/2);
  arc(50,59,20,10,PI/2,PI);
  arc(50,59,20,10,0,PI/2);
  arc(70,59,20,10,PI/2,PI);
  arc(70,59,20,10,0,PI/2);
  arc(90,59,20,10,PI/2,PI);
  arc(90,59,20,10,0,PI/2);
  arc(110,59,20,10,PI/2,PI);
  arc(110,59,20,10,0,PI/2);
  arc(130,59,20,10,PI/2,PI);
  arc(130,59,20,10,0,PI/2);
  arc(150,59,20,10,PI/2,PI);
  arc(150,59,20,10,0,PI/2);
  arc(170,59,20,10,PI/2,PI);
  arc(170,59,20,10,0,PI/2);
  arc(190,59,20,10,PI/2,PI);
  arc(190,59,20,10,0,PI/2);
  
//Lettuce Bottom
  arc(10, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(10, 160, 20, 10, TWO_PI-PI/2, TWO_PI);
  arc(30, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(30, 160, 20, 10, TWO_PI-PI/2, TWO_PI);  
  arc(50, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(50, 160, 20, 10, TWO_PI-PI/2, TWO_PI);
  arc(70, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(70, 160, 20, 10, TWO_PI-PI/2, TWO_PI);
  arc(90, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(90, 160, 20, 10, TWO_PI-PI/2, TWO_PI);
  arc(110, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(110, 160, 20, 10, TWO_PI-PI/2, TWO_PI);
  arc(130, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(130, 160, 20, 10, TWO_PI-PI/2, TWO_PI);
  arc(150, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(150, 160, 20, 10, TWO_PI-PI/2, TWO_PI);
  arc(170, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(170, 160, 20, 10, TWO_PI-PI/2, TWO_PI);
  arc(190, 160, 20, 10, PI, TWO_PI-PI/2);
  arc(190, 160, 20, 10, TWO_PI-PI/2, TWO_PI);
  
//Tomatoes
  fill(200,0,0);
  rect(0,40,200,10);
  rect(0,160,200,10);
  
//Onions
  fill(140,10,160);
  rect(0,50,200,9);
  
//Eyes
  fill(255);
  ellipse(50,85,25,25);
  ellipse(150,85,25,25);
  fill(110,50,5);
  ellipse(50,93,12,12);
  ellipse(150,93,12,12);
  fill(255);
  ellipse(53,93,4,4);
  ellipse(153,93,4,4);
  
//Nose
  ellipse(100,100,10,4);

//Ketchup + Mustard

  if (mousePressed == true) {
  stroke(255,0,0);
  strokeWeight(5);
  line(pmouseX,pmouseY,mouseX,mouseY);
  }
  else if (keyPressed == true){
    stroke(220,195,0);
    strokeWeight(5);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
}

//Squirt Ketchup
/*void mousePressed(){
  stroke(255,0,0);
  strokeWeight(10);
  line(pmouseX-10,pmouseY-10,mouseX,mouseY);

}*/
                                                                                
