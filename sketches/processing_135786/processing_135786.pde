
//construccion del bichito

void setup(){
 size(400,400);
 background(150);
}
void draw(){
  strokeJoin(ROUND);
   // alas;
  fill(255);
  quad(200,200,120,130,50,160,110,192);
  quad(200,200,280,130,350,160,290,192);
  //alas2
  quad(200,200,120,210,50,240,110,252);
  quad(200,200,280,210,350,240,290,252);  
  //cuerpo
  fill(10);
  rectMode(CENTER);
  rect(200,200,50,100);
  //cabeza//
  fill(250);
  ellipse(200,270,100,100);
  //ojos
  fill(10);
  stroke(random(255),random(24),random(100));
  ellipse(225,270,20,40);
  ellipse(175,270,20,40);
  
  curve(120,215,143,230,150,240,153,242);
  curve(280,215,257,230,250,240,247,242);
  
  stroke(10);
  strokeWeight(12);
  line(175,150,150,130);
  line(225,150,250,130);

  curve(162,300,257,295,250,300,247,310);
  curve(238,300,143,295,150,300,153,310);
 
  ellipseMode(CENTER);
  fill(random(255),random(24),random(100));
  ellipse(200,141,50,20);
  
  //antenas
  strokeWeight(2);
  ellipse(138,223,15,15);
  ellipse(262,223,15,15);
  strokeWeight(12);
  
  
  
  
println("  posx", abs(mouseX));
print("posy", abs(mouseY));
}
