
void setup() {
  size(350,400);
}

void draw() {
  background(255);
  
  // front row
  noStroke();
  fill(20,130,250,80);
  triangle(10,100, 105,70, 90,85);
 
  noStroke();
  fill(20,100,250,100);
  triangle(10,100, 20,150, 90,85);

  noStroke();
  fill(200,230,250,100);
  triangle(20,150, 90,85, 130,120);

  noStroke();
  fill(50,140,250,150);
  triangle(20,150, 130,120, 140,210);
  
  noStroke();
  fill(0,140,250,100);
  triangle(130,120, 140,210, 200,140);
  
  noStroke();
  fill(0,80,190,100);
  triangle(140,210, 200,140, 275,230);
  
  noStroke();
  fill(0,100,220,100);
  triangle(200,140, 270,130, 275,230);
  
  noStroke();
  fill(200,230,250,100);
  triangle(275,230, 270,130, 340,200);
  
  noStroke();
  fill(0,100,220,80);
  triangle(270,130, 285,110, 340,200);
  
  // octogon top
  noStroke();
  fill(20,130,250,60);
  triangle(105,70, 90,85, 160,65);

  noStroke();
  fill(20,130,250,60);
  triangle(90,85, 160,65, 130,120);

  noStroke();
  fill(20,130,250,60);
  triangle(160,65, 130,120, 200,140);
  
  noStroke();
  fill(20,130,250,60);
  triangle(160,65, 235,80, 200,140);
  
  noStroke();
  fill(20,130,250,60);
  triangle(270,130, 235,80, 200,140);

  noStroke();
  fill(20,130,250,60);
  triangle(270,130, 235,80, 285,110);
  
  // front point
  noStroke();
  fill(20,120,250,110);
  triangle(10,100, 20,150, 120,350);
  
  noStroke();
  fill(20,130,250,20);
  triangle(20,150, 140,210, 120,350);

  noStroke();
  fill(120,150,250,40);
  triangle(275,230, 140,210, 120,350);
  
  noStroke();
  fill(10,50,150,50);
  triangle(275,230, 340,200, 120,350);
  
  // behind row
  noStroke();
  fill(20,130,250,60);
  triangle(10,100, 105,70, 90,90);
  
  noStroke();
  fill(200,220,250,180);
  triangle(160,65, 105,70, 90,90);
  
  noStroke();
  fill(10,100,150,20);
  triangle(160,65, 200,110, 90,90);
  
  noStroke();
  fill(10,100,150,5);
  triangle(160,65, 200,110, 235,80);
  
  noStroke();
  fill(10,100,150,20);
  triangle(275,125, 200,110, 235,80);
  
  noStroke();
  fill(10,100,150,20);
  triangle(275,125, 285,110, 340,200);
  
  //behind point
  noStroke();
  fill(10,100,150,20);
  triangle(10,100, 90,90, 120,350);
  
  noStroke();
  fill(10,80,180,40);
  triangle(90,90, 200,110, 120,350);
  
  noStroke();
  fill(10,100,150,30);
  triangle(275,125, 200,110, 120,350);
  
  noStroke();
  fill(10,80,150,50);
  triangle(275,125, 340,200, 120,350);
}



