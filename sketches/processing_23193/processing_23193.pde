
void setup(){
  
  size(500,500); //size of screen
  smooth(); //less pixelated
  frameRate(40); //frames per second
  
}

void draw(){ 
  background(106,207,246);
  fill(0,255,0);
  noStroke();
  rect(0,400,500,120);
  
  ellipseMode(CENTER);
  
  //legs
  stroke(0);
  line(mouseX+70,mouseY+220,mouseX+50,mouseY+300);
  stroke(0);
  line(mouseX+130,mouseY+220,mouseX+150,mouseY+300);
  
  //feet
  fill(0);
  ellipse(mouseX+50,mouseY+300,30,20);
  ellipse(mouseX+150,mouseY+300,30,20);  
  
  //body
  fill(242,230,179);
  ellipse(mouseX+100,mouseY+100,150,280);
  
  //face
  fill(255);
  ellipse(mouseX+100,mouseY+30,100,80);
  
  //eyes
 fill(0);
  ellipse(mouseX+70,mouseY+30,20,20);
  fill(0);
  ellipse(mouseX+130,mouseY+30,20,20);
  
  //eyes
  fill(255);
  ellipse(mouseX+70,mouseY+30,5,10);
  fill(255);
  ellipse(mouseX+130,mouseY+30,5,10);
  
  //mouth
  stroke(0);
  line(mouseX+80,mouseY+50,mouseX+120,mouseY+50);
  
   //arms
  stroke(0);
  line(mouseX+60,mouseY+100,mouseX+60,mouseY+140);
  stroke(0);
  line(mouseX+140,mouseY+100,mouseX+140,mouseY+140);
  
  //hands
  ellipse(mouseX+60,mouseY+140,20,20);
  ellipse(mouseX+140,mouseY+140,20,20);
  
}


void mousePressed(){
  frameRate(5);
 
 //blink
  fill(255);
  noStroke();
 ellipse(mouseX+70,mouseY+30,22,22);
 
 stroke(0);
 line(mouseX+60,mouseY+30,mouseX+80,mouseY+30);
 
 fill(255);
  noStroke();
 ellipse(mouseX+130,mouseY+30,22,22);
 
 stroke(0);
 line(mouseX+120,mouseY+30,mouseX+140,mouseY+30);
 
 
}

void keyPressed(){
  frameRate(5);
  
  noStroke();
  fill(0,0,255);
  
  //rain
   ellipse(50,0,5,20);
  ellipse(100,20,5,20);
  ellipse(150,0,5,20);
  ellipse(200,20,5,20);
  ellipse(250,0,5,20);
  ellipse(300,20,5,20);
  ellipse(350,0,5,20);
  ellipse(400,20,5,20);
  ellipse(450,00,5,20);
  
  ellipse(50,50,5,20);
  ellipse(100,70,5,20);
  ellipse(150,50,5,20);
  ellipse(200,70,5,20);
  ellipse(250,50,5,20);
  ellipse(300,70,5,20);
  ellipse(350,50,5,20);
  ellipse(400,70,5,20);
  ellipse(450,50,5,20);
  
  ellipse(50,100,5,20);
  ellipse(100,120,5,20);
  ellipse(150,100,5,20);
  ellipse(200,120,5,20);
  ellipse(250,100,5,20);
  ellipse(300,120,5,20);
  ellipse(350,100,5,20);
  ellipse(400,120,5,20);
  ellipse(450,100,5,20);
  
   ellipse(50,150,5,20);
  ellipse(100,170,5,20);
  ellipse(150,150,5,20);
  ellipse(200,170,5,20);
  ellipse(250,150,5,20);
  ellipse(300,170,5,20);
  ellipse(350,150,5,20);
  ellipse(400,170,5,20);
  ellipse(450,150,5,20);
  
   ellipse(50,200,5,20);
  ellipse(100,220,5,20);
  ellipse(150,200,5,20);
  ellipse(200,220,5,20);
  ellipse(250,200,5,20);
  ellipse(300,220,5,20);
  ellipse(350,200,5,20);
  ellipse(400,220,5,20);
  ellipse(450,200,5,20);
  
   ellipse(50,250,5,20);
  ellipse(100,270,5,20);
  ellipse(150,250,5,20);
  ellipse(200,270,5,20);
  ellipse(250,250,5,20);
  ellipse(300,270,5,20);
  ellipse(350,250,5,20);
  ellipse(400,270,5,20);
  ellipse(450,250,5,20);
  
   ellipse(50,300,5,20);
  ellipse(100,320,5,20);
  ellipse(150,300,5,20);
  ellipse(200,320,5,20);
  ellipse(250,300,5,20);
  ellipse(300,320,5,20);
  ellipse(350,300,5,20);
  ellipse(400,320,5,20);
  ellipse(450,300,5,20);
  
   ellipse(50,350,5,20);
  ellipse(100,370,5,20);
  ellipse(150,350,5,20);
  ellipse(200,370,5,20);
  ellipse(250,350,5,20);
  ellipse(300,370,5,20);
  ellipse(350,350,5,20);
  ellipse(400,370,5,20);
  ellipse(450,350,5,20);


 ellipse(50,400,5,20);
  ellipse(100,420,5,20);
  ellipse(150,400,5,20);
  ellipse(200,420,5,20);
  ellipse(250,400,5,20);
  ellipse(300,420,5,20);
  ellipse(350,400,5,20);
  ellipse(400,420,5,20);
  ellipse(450,400,5,20);  
  
   ellipse(50,450,5,20);
  ellipse(100,470,5,20);
  ellipse(150,450,5,20);
  ellipse(200,470,5,20);
  ellipse(250,450,5,20);
  ellipse(300,470,5,20);
  ellipse(350,450,5,20);
  ellipse(400,470,5,20);
  ellipse(450,450,5,20);
  
  //clouds
  fill(150);
  ellipse(30,0,80,50);
  ellipse(100,0,100,80);
  ellipse(130,0,70,60);
  ellipse(170,0,80,90);
  ellipse(250,0,150,90);
  ellipse(310,0,80,80);
  ellipse(370,0,100,70);
  ellipse(460,0,120,80);
  
}

