
// Create Globe
Globe globe;
// Is Globe Beiing Dragged?
boolean dragGlobe = false;
// Globe Radius
float gRad = 400;
// Mouse Speed
PVector ms;
// Background Image
PImage back = new PImage();

// Image Hit Points
PVector[] hits;

void setup(){
  size(600, 600);
  frameRate(60);
  
  // Load Image
  back = loadImage("background.jpg");
  
  // Initialize Globe
  globe = new Globe();
}

void draw(){
  //background(0, 40, 100);
  imageMode(CENTER);
  image(back, width/2, height/2);
  
  // Mouse Speed
  ms = new PVector(mouseX - pmouseX, mouseY - pmouseY);
  
  // Drag Globe
  if(dragGlobe){
    globe.drag(ms);
  }
  
  // Move Globe
  globe.move();
  
  // Display Globe
  globe.display();
}

void mousePressed(){
  // Globe Pressed
  if(dist(mouseX, mouseY, globe.gPos.x, globe.gPos.y) <= gRad/2){
    dragGlobe = true;
  } 
}

void mouseReleased(){
  // Globe Released
  dragGlobe = false;
}
class Flake {
  color fCol;
  PVector fPos;
  PVector fVel;
  float fRad;
  float wobbleDist;
  float wobbleSpeed;

  Flake(PVector gPos) {
    fCol = color(255);
    wobbleDist =  random(-0.8, 0.8);
    wobbleSpeed =  random(0.01, 0.05);
    fRad = random(1, 6);
    float a = random(0, 360);
    float d = random(0, gRad/2);
    fPos = new PVector((float)(d*Math.cos(radians(a))), (float)(d*Math.sin(radians(a))));
    fPos.add(gPos);
    fVel = new PVector(0, 1*(fRad/10));
  }

  void move(PVector gPos, PVector gVel) {
    if(fVel.y != 0){
      fVel.x += (float)(Math.cos(frameCount*wobbleSpeed)*wobbleDist)*0.01;
    }
    fVel.y += (1*(fRad/10))*0.001;
    
    if(dragGlobe){
      // Scatter Movement
    }
    
    float dx = fPos.x - gPos.x;
    float dy = fPos.y - gPos.y;
    float angle = atan2(dy, dx);
    
    PVector globeVel = new PVector(gVel.x, gVel.y);
    globeVel.mult(0.05);
    globeVel.mult(fRad/10);
    
    fVel.add(globeVel);
    fPos.add(fVel);
    
    if (dist(fPos.x, fPos.y, gPos.x, gPos.y) >= gRad/2 - fRad/2) {
      globeVel.mult(1.1);
      
      fPos.x = gPos.x + (float)((gRad/2 - fRad/2)*Math.cos(angle));
      fPos.y = gPos.y + (float)((gRad/2 - fRad/2)*Math.sin(angle));
      fVel.y = 0;
      fVel.x = 0;
    }
    
    /*for(int h=0; h<hits.length; h++){
      stroke(255, 0, 0);
      strokeWeight(2);
      point(gPos.x - gRad/2 + hits[h].x, gPos.y - gRad/2 + hits[h].y);
    }*/
    
    //if(hits.length == globe.scene.width){
      for(int i=0; i<hits.length; i++){
        if((int)fPos.x == gPos.x - gRad/2 + hits[i].x && 
           (int)fPos.y == gPos.y - gRad/2 + hits[i].y){
             
          //fCol = color(255, 0, 0);
          fVel.y = 0;
          fVel.x = 0;
          
          fPos.x = gPos.x - gRad/2 + hits[i].x;
          fPos.y = gPos.y - gRad/2 + hits[i].y;
        }
      }
    //}
  }

  void display() {
    noStroke();
    fill(fCol);
    ellipse(fPos.x, fPos.y, fRad, fRad);
    stroke(255);
    //line(fPos.x-fRad, fPos.y, fPos.x+fRad, fPos.y);
  }
}

class Globe{
  PVector gPos;
  PVector gVel;
  Flake[] flakes;
  PImage scene, sceneHit;
  Smoke[] smoke;
  
  Globe(){
    // Load Scene
    scene = loadImage("scene_2.png");
    sceneHit = loadImage("scene_2_hit.png");
    
    smoke = new Smoke[0];
    
    // Load Hit Points
    loadHitpoints();

    // Create Mask
    PGraphics sceneMask = createGraphics(400, 400, JAVA2D);
    sceneMask.beginDraw();
      sceneMask.noStroke();
      sceneMask.fill(255);
      sceneMask.ellipseMode(CORNER);
      sceneMask.ellipse(0, 0, 400, 400);
    sceneMask.endDraw();
    
    // Mask Scene
    //scene.mask(sceneMask);
    
    gPos = new PVector(width/2, height/2);
    gVel = new PVector(0, 0);
    flakes = new Flake[0];
    
    for(int i=0; i<1000; i++){
      flakes = (Flake[]) append(flakes, new Flake(gPos));
    }
  }
  
  void drag(PVector mouseSpeed){
    gVel = mouseSpeed;
  }
    
  void move(){
    gPos.add(gVel);
    
    gVel.x += (width/2 - gPos.x)*0.2;
    gVel.y += (height/2 - gPos.y)*0.2;
    
    //println("Globe Vel: " + gVel.x + " & " + gVel.y);
    
    gPos.x = constrain(gPos.x, gRad/2, width-gRad/2);
    gPos.y = constrain(gPos.y, gRad/2, height-gRad/2);
    
    gVel.mult(0.8);
  }
  
  void display(){
    noStroke();
    fill(0, 40);
    ellipseMode(CENTER);
    ellipse(gPos.x, gPos.y, gRad, gRad);
    imageMode(CENTER);
    image(scene, gPos.x, gPos.y);
    
    for(int f=0; f<flakes.length; f++){
      flakes[f].move(gPos, gVel);
      flakes[f].display();
    }
    
    // Dark Top
    beginShape();
      noStroke();
      fill(0, 40);
      vertex(gPos.x - gRad/2, gPos.y);
      bezierVertex(gPos.x - gRad/2, gPos.y - 110, gPos.x - 110, gPos.y - gRad/2, gPos.x, gPos.y - gRad/2);
      bezierVertex(gPos.x + 110, gPos.y - gRad/2, gPos.x + gRad/2, gPos.y - 110, gPos.x + gRad/2, gPos.y);
      // Under Side
      bezierVertex(gPos.x + gRad/2, gPos.y, gPos.x + gRad/2, gPos.y - 180, gPos.x, gPos.y - 180);
      bezierVertex(gPos.x - gRad/2, gPos.y - 180, gPos.x - gRad/2, gPos.y, gPos.x - gRad/2, gPos.y);
    endShape();
    
    // Dark Bottom
    beginShape();
      noStroke();
      fill(0, 80);
      vertex(gPos.x - gRad/2, gPos.y);
      bezierVertex(gPos.x - gRad/2, gPos.y + 110, gPos.x - 110, gPos.y + gRad/2, gPos.x, gPos.y + gRad/2);
      bezierVertex(gPos.x + 110, gPos.y + gRad/2, gPos.x + gRad/2, gPos.y + 110, gPos.x + gRad/2, gPos.y);
      // Under Side
      bezierVertex(gPos.x + gRad/2, gPos.y, gPos.x + gRad/2, gPos.y + 180, gPos.x, gPos.y + 180);
      bezierVertex(gPos.x - gRad/2, gPos.y + 180, gPos.x - gRad/2, gPos.y, gPos.x - gRad/2, gPos.y);
    endShape();
    
    pushMatrix();
    
    // Shine 1
    beginShape();
      translate(gPos.x, gPos.y);
      rotate(radians(20));
      float sRad1 = 190;
      noStroke();
      fill(255, 200);
      vertex(0, -sRad1);
      bezierVertex(sRad1*0.55, -sRad1, sRad1, -sRad1*0.55, sRad1, 0);
      // Under Side
      bezierVertex(sRad1, -sRad1*0.45, sRad1*0.45, -sRad1, 0, -sRad1);
    endShape();
    
    popMatrix();
    pushMatrix();
    
    // Shine 2
    beginShape();
      translate(gPos.x, gPos.y);
      rotate(radians(-80));
      float sRad2 = 190;
      noStroke();
      fill(255, 200);
      vertex(0, -sRad2);
      bezierVertex(sRad2*0.55, -sRad2, sRad2, -sRad2*0.55, sRad2, 0);
      // Under Side
      bezierVertex(sRad2, -sRad2*0.5, sRad2*0.5, -sRad2*0.9, 0, -sRad2*0.9);
    endShape();
    
    popMatrix();
    pushMatrix();
    
    // Shine 3
    beginShape();
      translate(gPos.x, gPos.y);
      rotate(radians(-80));
      float sRad3 = 180;
      float offset = 15;
      noStroke();
      fill(255, 200);
      vertex(0, -sRad3+offset);
      bezierVertex(sRad3*0.55, -sRad3+offset, sRad3, -sRad3*0.55, sRad3, 0);
      // Under Side
      bezierVertex(sRad3, -sRad3*0.5, sRad3*0.5, -sRad3*0.9+offset, 0, -sRad3*0.9+offset);
    endShape();
    
    popMatrix();
    
    // Smoke
    if(smoke.length < 200){
      smoke = (Smoke[]) append(smoke, new Smoke());
    }
    
    // Smoke Again
    for(int i=0; i<smoke.length; i++){
      smoke[i].move();
      smoke[i].display();
    }
  }
  
  void loadHitpoints(){
    
    sceneHit.loadPixels();
    hits = new PVector[0];
    
    // How many pixels to skip whilst sampling
    // Higher number = faster rendering
    int sampleSize = 3;
    
    for(int w=0; w<sceneHit.width; w+=sampleSize){
      
      for(int h=sceneHit.height-1; h>0; h-=sampleSize){
        
        color c = sceneHit.pixels[h*sceneHit.width + w];
        
        //println("Red: " + red(c) + "\nGreen: " + green(c) + "\nBlue: " + blue(c));
        
        if(red(c) + green(c) + blue(c) > 10){
          if(h>100){
            hits = (PVector[]) append(hits, new PVector(w, h));
          }
          //println(hits[w].x + " AND " + hits[w].y);
          //println(red(c) + green(c) + blue(c));
        }
        
      }
      
    }
    
  }
  
}
class Smoke{
  float speed;
  float gravity;
  float pRad;
  int life;
  
  PVector pPos;
  PVector pVel;
  
  Smoke(){
    speed = 0.1;
    gravity = 0.01;
    pRad = 10;
    life = 300;
    
    pPos = new PVector(globe.gPos.x + 5, globe.gPos.y + 90);
    pVel = new PVector(random(-speed, speed), random(-speed, speed));
  }
  
  void move(){
    // Distance from Mouse
    //float d = dist(globe.gPos.x, globe.gPos.y, pPos.x, pPos.y);
    //float r = constrain(life*0.1, 0, 10);
    
    // Radius - Distance From Mouse
    //pRad = r;
    
    pVel.y -= gravity;
    //pPos.x += (mouseX - pPos.x)*0.01;
    
    pPos.add(pVel);
    
    if(life <= 0){
      pPos = new PVector(globe.gPos.x + 5, globe.gPos.y + 90);
      pVel = new PVector(random(-speed, speed), random(-speed, speed));
      life = 300;
    }
    
    life -= 2;
  }
  
  void display(){
    noStroke();
    colorMode(HSB);
    fill(100, life*0.5);
    ellipse(pPos.x, pPos.y, 10-life/30, 10-life/30);
  }
  
}


