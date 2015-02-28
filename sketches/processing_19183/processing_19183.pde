


ArrayList<ArrayList<PVector>>Lines; 
ArrayList<PVector> currentLine = new ArrayList();
float rotation = 0;
boolean spin = true;
boolean guides = true;
float rot_increment = 0.01; // rotation speed
int jointhresh = 100;

void setup(){
  size(600,600,P3D);
  Lines = new ArrayList();
  background(255);
  //smooth();
  frameRate(25);
  noCursor();
}

void draw(){
  background(255);
  noFill();
  translate(width/2,0,-100);
  // drawing reference lines
  if (guides){
  stroke(255,100,100,100);
  line(mouseX-width/2,0,0,0,0,0);
  line(mouseX-width/2,width,0,0,width,0); 
  line(mouseX-width/2,mouseY-10,0,mouseX-width/2,mouseY+10,0);
  line((mouseX-width/2)-10,mouseY,0,(mouseX-width/2)+10,mouseY,0);
  if (mousePressed) ellipse(mouseX-width/2,mouseY,5,5);
  }
   
  rotateY(rotation);
  // world reference lines
  if (guides){
  stroke(0,200,200,80);
  line(0,0,0,0,width,0); // ref lines
  line(-width/2,width,0,width/2,width,0);
  line(0,width,-width/2,0,width,width/2);
  line(-width/2,0,0,width/2,0,0);
  line(0,0,-width/2,0,0,width/2);
  }

  for (ArrayList<PVector> ln : Lines){
    // draw the main line for each polyline
    stroke(0,200);
    beginShape();
    for (PVector p : ln){
      vertex(p.x,p.y,p.z);
    }
    endShape();
    stroke(0,50);
    // draw the webbed lines
    for (PVector v : ln){
      for (PVector v2 : ln){
        float d = v.dist(v2);
        if ( jointhresh < d && d < jointhresh + 10 ) line(v.x,v.y,v.z,v2.x,v2.y,v2.z); 
      } 
    } 
  }
  
  stroke(255,0,0,150);
  beginShape();
  for (PVector c : currentLine){
    vertex(c.x,c.y,c.z);
  }
  endShape();
  
  if (spin) rotation += rot_increment;
  
  if (mousePressed) currentLine.add(new PVector(cos(rotation)*(mouseX-width/2),mouseY,sin(rotation)*(mouseX-width/2))); // add a point
}


void mousePressed(){
  currentLine = new ArrayList<PVector>(); // start a new line
}

void mouseReleased(){
   Lines.add(new ArrayList(currentLine)); // stash the current line in the main arraylist
   currentLine.clear(); // then clear it
}

void keyPressed(){
  if (key == 'c') Lines.clear();
  if (key == ' ') spin = !spin;
  if (keyCode == RIGHT && !spin) rotation += 0.05;
  if (keyCode == LEFT && !spin) rotation -= 0.05;
  if (keyCode == UP) jointhresh += 1;
  if (keyCode == DOWN) jointhresh -= 1;
  if (key == 'g') guides = !guides;
}


