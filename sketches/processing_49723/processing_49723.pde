
void setup(){
  //Init
  size(1000,750);
  background(150,150,150);
  smooth();  
  
  //TV white background
  fill(255,255,255);
  stroke(255,255,255);
  beginShape(TRIANGLES);
    //Right/top half
    vertex(220,74);
    vertex(850,150);
    vertex(787,480);

    //Bottom/left half
    vertex(220,74);
    vertex(787,480);
    vertex(217,517);
  endShape();
  
  
  //TV screen
  strokeWeight(2);
  noFill();
  for(float y = 80; y < 550; y+=7){
    stroke(255-(random(150)+y/5), 255-(random(100)+y/5), 255-(random(50)+y/5));
    drawWavyLine(230,y, 820, 30,20);
  }
  
  //TV background things
  fill(150,150,150);
  stroke(150,150,150);
  beginShape(TRIANGLES);
    //Top
    vertex(220,60);
    vertex(850,50);
    vertex(850,150);

    //Right
    vertex(850,50);
    vertex(850,600);
    vertex(787,580);
    
    //Bottom
    vertex(800,480);
    vertex(800,700);
    vertex(40,517);
  endShape();
  
  //Background walls
  fill(200,200,200);
  stroke(200,200,200);
  strokeWeight(3);
  
  //Left
  line(150,0, 150,600);  

  //Right-top
  line(800,0, 800,140);  

  //Right-bottom
  line(800,400, 800,550);  
  
  //Top across
  line(150,600, 800,550);
  
  //Jut out across
  line(175,630, 890,575);
  
  //Jut left connector
  line(150,600, 175,630);

  //Jut right connector
  line(800,550, 890,575);
  
  //Back left down
  line(150,600, 150,800);
  
  //Jut left down
  line(175,630, 175,800);
  
  //Jut right down
  line(890,575, 890,800);


  
  //TV bezel
  fill(0,0,0);
  stroke(0,0,0);
  strokeWeight(25);
  line(220,74, 850,150);//Top
  line(220,74, 217,517);//Left
  line(217,517, 787,480);//Bottom
  line(787,480, 850,150);//Right
  
  
  //Lamp shade
  strokeWeight(0);
  fill(255,255,255);
  stroke(255,255,255);
  arc(100, 100, 130, 240, 0, PI);
  
  strokeWeight(0);
  fill(255,255,255);
  stroke(255,255,255);
  arc(100, 101, 130, 40, PI, TWO_PI);  
  
  //Lamp shade base
  strokeWeight(0);
  fill(0,0,0);
  stroke(0,0,0);
  arc(100, 210, 50, 100, 0, PI);
  
  strokeWeight(0);
  fill(0,0,0);
  stroke(0,0,0);
  arc(100, 211, 50, 20, PI, TWO_PI);
  
  //Lamp pole
  fill(0,0,0);
  stroke(0,0,0);
  strokeWeight(10);
  line(100,220, 100,800);
  
}
  
void drawWavyLine(float x1, float y1, float x2, float nodeWidth, float nodeHeight){  
  for(int i=0; i<(x2-x1)/nodeWidth; i+=2){
      bezier(x1+i*nodeWidth,y1, x1+i*nodeWidth+10,y1-nodeHeight, x1+i*nodeWidth+20,y1-nodeHeight,  x1+i*nodeWidth+30,y1);
      bezier(x1+i*nodeWidth+30,y1, x1+i*nodeWidth+40,y1+nodeHeight, x1+i*nodeWidth+50,y1+nodeHeight,  x1+i*nodeWidth+60,y1);
  }
}               
