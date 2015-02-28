
/*
*  Contructivist postcard generator by kof 2012
 */


ArrayList drawers;
int seed = 1;

String word[];

void setup() {
  size(900, 450, P2D);  

  colorMode(HSB);

  textFont(loadFont("BebasNeue-96.vlw"));
  textMode(SCREEN);

  rectMode(CENTER);


  reset();
}

void mousePressed() {
  reset();
}

void keyPressed() {
}

void reset() {


  randomSeed(seed);
  word = new String[2];
  word[0] = "";
  if(seed < 100){
    word[1]= ""+nf(seed,2);
  }else if(seed < 1000){
   word[1]= ""+nf(seed,3); 
  }else if(seed < 10000){
   word[1]= ""+nf(seed,4); 
  }else if(seed < 100000){
   word[1]= ""+nf(seed,5); 
  }else if(seed < 1000000){
   word[1]= ""+nf(seed,6); 
  }
  seed++;

  smooth();
  background(255);
  drawers  = new ArrayList();
  for (int i = 0; i< 5 ; i++)
    drawers.add(new Drawer((int)random(width), (int)random(height))); 




  noStroke();

  //for(int i = 20 ; i<255;i+=100)

  fill(random(255), random(10, 130), random(20, 120));

  float r = random(100, 255);
  ellipse(random(width), random(height), r, r);

  fill(random(255), random(10, 130), random(20, 120));

  pushMatrix();
  r = random(100, 255);
  translate(random(width), random(height));
  rotate( radians((int)random(100)*7.0) );
  rect(0, 0, r, r);
  popMatrix();

  fill(random(255), random(10, 130), random(20, 120));

  pushMatrix();
  r = random(100, 255);
  translate(random(width), random(height));
  rotate(radians((int)random(100)*7.0));
  triangle(
  cos(0)*r, sin(0)*r, 
  cos(radians(120))*r, sin(radians(120))*r, 
  cos(radians(240))*r, sin(radians(240))*r
    );
  popMatrix();



  fill(0);
  for (int i = 0 ; i < word.length;i++) {
    text(word[i], random(0, width-190), random(190, height));
  }
}



void draw() {
  loadPixels();
  for (int i =0 ; i<drawers.size();i++) {
    Drawer d = (Drawer)drawers.get(i);
    d.paint();
  }

  if (drawers.size()==0) {
    reset();
  }
}


