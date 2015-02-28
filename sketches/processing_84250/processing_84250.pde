


int r;
float RAD = sqrt(3)/4;
int generazione = 7;
float c1=random(200);
float c2=random(200);
float c3=random(200);
int t;
float z;



void setup() {
//  frameRate(10);
  size(1000, 960,P3D);
  //noStroke();
  fill(c1, c2, c3);
  
  c1 = 48;
  c2 = 161;
  c3 = 134;
  t=0;

//  println(c1+" "+c2+" "+c3);
z = (height/2) / tan(PI/6);
}

void draw() {

  lights();

 //spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);


  
 noStroke();

  r  = 300;
  background(51, 51, 51);
  fill(c1, c2, c3);


  pushMatrix();

  translate(width/2, height/2-r/2, 0);
  rotateX(1.39);

  //triangolo(0, 0, 0, r, 2);
  triangolo(0, 0, 0, r, generazione);
    fill(255-c1, 255-c2, 255-c3);
  sphere(5000);
  popMatrix();
  // stop();
  //  camera(t, t, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 1);
  //camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
t++;
//if(t>width) stop();
// saveFrame("images/output-####.jpg");
//generazione = (int)(map(t,0,width,3,8));

camera(width/2, height/2, z, mouseX, mouseY, 0, 0, 1, 0);
//camera(0,0,0,width/2,height/2,0,1,0);
}



void triangolo(float x, float y, float z, float r, int gen) {
  // println("generazione "+gen);
  //println("raggio "+r);

 noStroke();
  pushMatrix(); 
  scale(r);
  translate(x, y, z);


  if (gen==1) {
  


    beginShape(TRIANGLE_STRIP);
fill(c1,c2,c3);
    vertex(-1, -1, -1);
    vertex( 1, -1, -1);
    vertex( 0, 0, 1);


    vertex( 1, -1, -1);
    vertex( 1, 1, -1);
    vertex( 0, 0, 1);

vertex( 1, 1, -1);
    vertex(-1, 1, -1);
    vertex( 0, 0, 1);

    vertex(-1, 1, -1);
    vertex(-1, -1, -1);
    vertex( 0, 0, 1);
    
    fill(255-c1,0,c3);
    vertex(-1, 1, -1);
    vertex(-1, -1, -1);
    vertex(1, 1, -1);
    vertex(1, -1, -1);
    endShape(CLOSE);
    //
 //   stroke(0, 0, 255);
  // point(0, 0, 0);
  }
  else {



    // fill(j*50, 0, 0);  
    triangolo(0, 0, 1, 0.5, gen-1);
    triangolo(-1, -1, -1, 0.5, gen-1);
    triangolo(1, -1, -1, 0.5, gen-1);
    triangolo(1, 1, -1, 0.5, gen-1);
    triangolo(-1, 1, -1, 0.5, gen-1);
  }
  
  popMatrix();

}


void mousePressed() {
if(generazione>6) return;
  generazione++;
}

void keyPressed(){
  
 if(key == 'w') z = z- 10;
 if(key == 's') z = z+ 10;
}


