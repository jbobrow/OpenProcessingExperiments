
PImage nate;
PImage rug;
PImage grafitti;
PImage door;

  
void setup() {
  size(400, 400, P3D);
  nate=loadImage("nate.jpg");
  rug = loadImage("rug.jpg");
  grafitti = loadImage("Basketball_by_Artgar2.jpg");
  door = loadImage("door.jpg");
  


}

void draw() {
  background(130, 220, 220);     //sky
  smooth();
  
  

  float xPos = 50+150*cos(radians(.3*frameCount%360));
  float yPos = 50+150*sin(radians(.3*frameCount%360));
  
  //float xPos=50;
  //float yPos=200;
  camera(xPos, yPos, 40, 50, 50, 30, 0, 0, -1);
  
  
  
  

  //stroke(255, 0, 0);   //red pos x
  //line(0, 0, 0, 300, 0, 0);

  //stroke(0, 255, 0);  //green pos y
  //line(0, 0, 0, 0, 300, 0);

  //stroke(0, 0, 255);  //blue pos z
  //line(0,0,0,0,0,300);
  
  fill(20,120,20);          //lawn
  noStroke();
  beginShape();
  vertex(-500,-500,-1);
  vertex(500,-500,-1);
  vertex(500,500,-1);
  vertex(-500,500,-1);
  endShape(CLOSE);

  stroke(0);
  strokeWeight(2);
  fill(220,210,50);
  beginShape();  
  vertex(0, 0, 0);  //floor
  vertex(100, 0, 0);
  vertex(100, 100, 0);
  vertex(0, 100, 0);
  endShape(CLOSE);
  
  beginShape();     //rug on floor
  texture(rug);
  vertex(15,15,1,0,0);
  vertex(85,15,1,rug.width,0);
  vertex(85,85,1,rug.width,rug.height);
  vertex(15,85,1,0,rug.height);
  endShape(CLOSE);

  //.......y wall........

  fill(255);
  noStroke();
  beginShape();
  vertex(0, 30, 0);  //y axis wall outer
  vertex(0, 100, 0);
  vertex(0, 100, 80);
  vertex(0, 70, 80);
  vertex(0, 70, 30);
  vertex(0, 30, 30);
  endShape(CLOSE);


  beginShape();
  vertex(0, 0, 0);  //y axis wall inner
  vertex(0, 0, 80);
  vertex(0, 70, 80);
  vertex(0, 70, 60);
  vertex(0, 30, 60);
  vertex(0, 30, 0);
  endShape(CLOSE);

  stroke(0);            //y wall outline window
  line(0, 100, 0, 0, 100, 80);
  line(0, 100, 80, 0, 0, 80);
  line(0, 0, 80, 0, 0, 0);
  line(0, 70, 30, 0, 70, 60);
  line(0, 70, 60, 0, 30, 60);
  line(0, 30, 60, 0, 30, 30);
  line(0, 70, 30, 0, 30, 30);

  //..........back wall...........

  beginShape();         
  fill(255);
  vertex(0, 0, 80);
  vertex(100, 0, 80);
  fill(140, 100, 170);
  vertex(100, 0, 0);
  vertex(0, 0, 0);
  endShape(CLOSE);
  
  beginShape();
  texture(grafitti);
  vertex(100,-1,80,0,0);
  vertex(0,-1,80,grafitti.width,0);
  vertex(0,-1,0,grafitti.width,grafitti.height);
  vertex(100,-1,0,0,grafitti.height);
  endShape(CLOSE);
  
  
  //.........nate........
  
  
  
  beginShape();
  texture(nate);
  vertex(20,1,60,0,0);
  vertex(60,1,60,nate.width,0);
  vertex(60,1,20,nate.width,nate.height);
  vertex(20,1,20,0,nate.height);
  endShape(CLOSE);
  

  //.......x100 wall........

  noStroke();
  fill(255);
  beginShape();
  vertex(100, 30, 0);  //x100 axis wall outer
  vertex(100, 100, 0);
  vertex(100, 100, 80);
  vertex(100, 70, 80);
  vertex(100, 70, 30);
  vertex(100, 30, 30);
  endShape(CLOSE);


  beginShape();
  vertex(100, 0, 0);  //x100 axis wall inner
  vertex(100, 0, 80);
  vertex(100, 70, 80);
  vertex(100, 70, 60);
  vertex(100, 30, 60);
  vertex(100, 30, 0);
  endShape(CLOSE);

  stroke(0);            //x100 wall outline window
  line(100, 100, 0, 100, 100, 80);
  line(100, 100, 80, 100, 0, 80);
  line(100, 0, 80, 100, 0, 0);
  line(100, 70, 30, 100, 70, 60);
  line(100, 70, 60, 100, 30, 60);
  line(100, 30, 60, 100, 30, 30);
  line(100, 70, 30, 100, 30, 30);
  
  //......... awnings...........
  fill(0);
  beginShape();            //x100
  vertex(101,71,30);
  vertex(101,85,30);
  vertex(101,85,60);
  vertex(101,71,60);
  endShape(CLOSE);
  
  beginShape();
  vertex(101,29,30);
  vertex(101,15,30);
  vertex(101,15,60);
  vertex(101,29,60);
  endShape(CLOSE);
  
  beginShape();         //x0
  vertex(-1,71,30);
  vertex(-1,85,30);
  vertex(-1,85,60);
  vertex(-1,71,60);
  endShape(CLOSE);
  
  beginShape();
  vertex(-1,29,30);
  vertex(-1,15,30);
  vertex(-1,15,60);
  vertex(-1,29,60);
  endShape(CLOSE);

  //...........roof...........
  fill(130, 200, 140);
  beginShape();
  vertex(100, 100, 80);
  vertex(0, 100, 80);
  vertex(50, 50, 110);
  endShape(CLOSE);

  beginShape();
  vertex(100, 100, 80);
  vertex(100, 0, 80);
  vertex(50, 50, 110);
  endShape(CLOSE);

  beginShape();
  vertex(0, 0, 80);
  vertex(0, 100, 80);
  vertex(50, 50, 110);
  endShape(CLOSE);

  beginShape();
  vertex(0, 0, 80);
  vertex(100, 0, 80);
  vertex(50, 50, 110);
  endShape(CLOSE);

  //.....front wall.....
  noStroke();           //left FR LF window
  fill(255);
  beginShape();
  vertex(0, 100, 0);
  vertex(10, 100, 0);
  vertex(10,100,80);
  vertex(0,100,80);
  endShape(CLOSE);
  
  beginShape();         //below FR LF window
  vertex(10,100,0);
  vertex(25,100,0);
  vertex(25,100,20);
  vertex(10,100,20);
  endShape(CLOSE);
  
  beginShape();        //above FR LF window
  vertex(10,100,60);
  vertex(25,100,60);
  vertex(25,100,80);
  vertex(10,100,80);
  endShape(CLOSE);
  

  beginShape();        // right FR LF window
  vertex(25,100,0);
  vertex(40,100,0);
  vertex(40,100,80);
  vertex(25,100,80);
  endShape(CLOSE);
  
  
  stroke(0);                 //outline FR LF window
  line(10,100,20,10,100,60);
  line(10,100,20,25,100,20);
  line(10,100,60,25,100,60);
  line(25,100,20,25,100,60);
  
  noStroke();              //above door
  beginShape();
  vertex(40,100,40);
  vertex(40,100,80);
  vertex(60,100,80);
  vertex(60,100,40);
  endShape(CLOSE);
  
  noStroke();
  
  beginShape();        // right FR RT window
  vertex(75,100,0);
  vertex(60,100,0);
  vertex(60,100,80);
  vertex(75,100,80);
  endShape();
  
  beginShape();         //below FR RT window
  vertex(90,100,0);
  vertex(75,100,0);
  vertex(75,100,20);
  vertex(90,100,20);
  endShape(CLOSE);
  
  beginShape();        //above FR RT window
  vertex(90,100,60);
  vertex(75,100,60);
  vertex(75,100,80);
  vertex(90,100,80);
  endShape(CLOSE);
  
  stroke(0);                 //outline FR RT window
  line(90,100,20,90,100,60);
  line(90,100,20,75,100,20);
  line(90,100,60,75,100,60);
  line(75,100,20,75,100,60);
  
  noStroke();
  beginShape();
  vertex(60, 100, 0);
  vertex(75, 100, 0);
  vertex(75,100,80);
  vertex(60,100,80);
  endShape(CLOSE);
  
  beginShape();
  vertex(90,100,0);
  vertex(100,100,0);
  vertex(100,100,80);
  vertex(90,100,80);
  endShape(CLOSE);
  
  
  //.....front door.....
         
  beginShape();
  texture(door);
  
  vertex(40,100,0,door.width,door.height);
  vertex(40,100,40,door.width,0);
  vertex(26,114,40,0,0);
  vertex(26,114,0,0,door.height);
  endShape(CLOSE);
  
  stroke(0);        //door frame
  strokeWeight(5);
  line(40,100,0,40,100,40);
  line(40,100,40,60,100,40);
  line(60,100,40,60,100,0);
  line(60,100,0,40,100,0);  
  
  
}







