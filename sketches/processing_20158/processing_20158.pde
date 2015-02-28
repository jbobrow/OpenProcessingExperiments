
int has;
int px[];
int py[];
int r[];
color c[];
int i;

void setup(){
  size(220,220);
  noStroke();
  px = new int[7];
  py = new int[7];
  r = new int[7];
  c = new color[7];
  reset();
}

void reset(){
  for(i=0;i<7;i++){
    px[i]=int(random(50,150));
    py[i]=int(random(50,150)); 
    r[i]=int(random(0,8));
    c[i]=color( random(128,255),random(128,255),random(128,255)); //color((255.0/8.0)*(1+i),128,128);
  }
  has = -1;
}

void draw(){
  loadPixels();
  background(0);
  for(i=0;i<7;i++){
    pushMatrix();
    translate(px[i],py[i]);
    rotate(r[i]*radians(45));
    fill(c[i]);
    scale(1.5);
    switch(i){
    case 0:
    case 1: // Big ones.
      beginShape(TRIANGLES);
      vertex(-48,-16);
      vertex(16,-16);
      vertex(16,48);
      endShape();
      break;
    case 2:
    case 3: // Small ones.
      beginShape(TRIANGLES);
      vertex(-24,-8);
      vertex(8,-8);
      vertex(8,24);
      endShape();
      break;
    case 4: // Medium
      beginShape(TRIANGLES);
      vertex(-16,0);
      vertex(16,32);
      vertex(16,-32);
      endShape();
      break;
    case 5: // Square
      rect(-16,-16,32,32);
      break;
    case 6: // Diamond
      beginShape(QUADS);
      vertex(-16,0);
      vertex(-16,-32);
      vertex(16,0);
      vertex(16,32);      
      endShape();
      break;
    }    
    popMatrix();
  }
  if( mousePressed && (has != -1) ){
    px[has] += mouseX-pmouseX;
    py[has] += mouseY-pmouseY;
  }
  // Draw frame
  noStroke();
  fill(0);
  rect(0,0,width,4);
  rect(0,0,4,height);
  rect(width-4,0,4,height);
  rect(0,height-4,width,4);
}

void mousePressed(){
  if( mouseButton == LEFT ){
    color mouseC = get(mouseX,mouseY);
    for(int j=0;j<7;j++){
      if( c[j] == mouseC ){
        has = j;
      }
    }   
  }
}

void mouseReleased(){
  has = -1;
  for(i=0;i<7;i++){
    if( px[i] < 0 || px[i] > width || py[i] < 0 || py[i] > height ){
      px[i]=int(random(50,150));
      py[i]=int(random(50,150));
      c[i]=color( random(128,255),random(128,255),random(128,255));
      r[i]=int(random(0,8));
    }
  }
}

void mouseClicked(){
  if( mouseButton == RIGHT ){
    color mouseC = get(mouseX,mouseY);
    for(int j=0;j<7;j++){
      if( c[j] == mouseC ){
        r[j]=(r[j]+1)%8;
      }
    }   
  }  
}

void keyReleased(){
  if( key == ' '){
    reset();
  }
}


