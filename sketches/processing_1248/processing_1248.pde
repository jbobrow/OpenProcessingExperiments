
/**
 *  <strong>Trazos</strong><br>
 *  Herbert Spencer
 */
ArrayList trazos;
float grosor = 5.0;
boolean contornos;

void setup(){
  size(800, 400);
  trazos = new ArrayList();
  contornos = false;
  smooth();
  //strokeCap(SQUARE);
}

void mouseDragged() {
  trazos.add(new Trazo(mouseX, mouseY));
}

void mousePressed() {
  trazos.add(new Trazo(mouseX, mouseY));
}

void draw(){
  background(255);
  for(int i = trazos.size()-1; i >= 0; i--){
    Trazo t = (Trazo)trazos.get(i);
    t.trace();
  }
  if(key == ' ' && keyPressed){
    wiggle();
  }
  if(key == 'x' && keyPressed){
    wiggle2();
  }
}

/////////////////////////////////////////////

class Trazo{
  int largo, count;
  float[][] pos;
  float[] r;
  float[] ang;
  int seed;
  boolean drawing;

  Trazo(float x, float y){
    largo = round(random(20, 100));
    pos = new float[largo][2];
    r = new float[largo];
    ang = new float[largo];
    pos[0][0] = x;
    pos[0][1] = y;
    ang[0] = random(TWO_PI);
    r[0] = 0.1;
    //this.ang = ang;
    drawing = true;
    seed = round(random(3000));
    count = 1;

    for(int i = 1; i < largo; i++){
      noiseSeed(seed);
      float fac = map(i, 1, largo, 0.3, PI-0.3);
      ang[i] = ang[i-1] + ((noise((float)i/10.0) - 0.5) * .7);  
      r[i]   = (r[i-1]   + (noise((float)i/50) - 0.5) * grosor) * sin(fac) + 0.1;
      pos[i][0] = pos[i-1][0] + (cos(ang[i]) * 6);
      pos[i][1] = pos[i-1][1] + (sin(ang[i]) * 6);
    }
  }

  void trace(){
    if(contornos){
      stroke(0, 190);
      noFill();
    }
    else{
      fill(0, 190);
      noStroke();
    }
    if(drawing){  

      beginShape();
      curveVertex(pos[0][0], pos[0][1]);

      for(int i = 1; i < count; i++){
        float x = pos[i][0] + (cos(ang[i] - HALF_PI) * r[i]);
        float y = pos[i][1] + (sin(ang[i] - HALF_PI) * r[i]);
        curveVertex(x,y);
      }

      curveVertex(pos[count-1][0], pos[count-1][1]);

      for(int i = count-2; i > 1; i--){
        float x = pos[i][0] + (cos(ang[i] + HALF_PI) * r[i]);
        float y = pos[i][1] + (sin(ang[i] + HALF_PI) * r[i]);
        curveVertex(x,y);
      }

      curveVertex(pos[0][0], pos[0][1]);
      endShape();
      count ++;
      if(count == largo){
        drawing = false;
      } 
    }
    else{

      beginShape();
      curveVertex(pos[0][0], pos[0][1]);

      for(int i = 1; i < largo; i++){
        float x = pos[i][0] + (cos(ang[i] - HALF_PI) * r[i]);
        float y = pos[i][1] + (sin(ang[i] - HALF_PI) * r[i]);
        curveVertex(x,y);
      }

      curveVertex(pos[largo-1][0], pos[largo-1][1]);

      for(int i = largo-2; i > 1; i--){
        float x = pos[i][0] + (cos(ang[i] + HALF_PI) * r[i]);
        float y = pos[i][1] + (sin(ang[i] + HALF_PI) * r[i]);
        curveVertex(x,y);
      }

      curveVertex(pos[0][0], pos[0][1]);
      endShape();
    }
  }
}

void wiggle(){
  for(int i = trazos.size()-1; i >= 0; i--){
    Trazo t = (Trazo)trazos.get(i);
    noiseSeed(t.seed);
    for(int j = 0; j < t.largo; j++){
      t.r[j] += (noise((float)millis()/10.0) - 0.5) * 0.5;
      t.pos[j][0] += noise((float)(millis()+t.seed)/50.0) - 0.5;
      t.pos[j][1] += noise((float)(millis()+t.seed*2)/100.0) - 0.5;
    }
  }
}

void wiggle2(){
  for(int i = trazos.size()-1; i >= 0; i--){
    Trazo t = (Trazo)trazos.get(i);
    noiseSeed(t.seed);
    for(int j = 0; j < t.largo; j++){
      //t.r[j] += noise((t.r[j]/10.0) - 0.5) * 0.5;
      t.pos[j][0] += noise((t.pos[j][0])/50.0) - 0.5;
      t.pos[j][1] += noise((t.pos[j][1])/50.0) - 0.5;
    }
  }
}

void keyPressed(){
  if(key == 'h'){
    contornos = !contornos;
  }
  if(key == 'c'){
    trazos.clear();
  }
}












