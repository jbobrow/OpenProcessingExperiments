
void setup (){
  size (250,250);
  background (0, 150);
  smooth ();
}
  
float q=150, w=150, qn=150, wn=150; ////////// <-- code inspired by 'Interactive Cloud Painter' created by Anson Ng
  
void draw (){
  if (keyPressed){
  if (key=='a'){
    frameRate(50);
  }
}
      
  
  stroke (255, 90);
    q = constrain(q, 0+random(0, 20), width-random(0, 20));
  w = constrain(w, 0+random(0, 20), height-random(0, 20));
  q = q + random(-5,5);
  w = w + random(-5,5);
     
  strokeWeight(random(1, 3));
  line(q,w,qn,wn);
  qn = q;
  wn = w;
    
  // green plants
    stroke (112,209,44, 110);
    q = constrain(q, 0+random(0, 20), width-random(0, 20));
  w = constrain(w, 0+random(0, 20), height-random(0, 20));
  q = q + random(-5,5);
  w = w + random(-5,5);
     
  strokeWeight(random(1, 3));
  line(q,w,qn,wn);
  qn = q;
  wn = w;
  
if (mousePressed){
    frameRate(15);
      stroke (219,20,113, 90);
    q = constrain(q, 0+random(0, 20), width-random(0, 20));
  w = constrain(w, 0+random(0, 20), height-random(0, 20));
  q = q + random(-5,5);
  w = w + random(-5,5); 
  strokeWeight(random(1, 3));
  line(q,w,qn,wn);
  qn = q;
  wn = w;
  }
}

void keyTyped(){
  if (key==' '){
    background (0,150);
  }
}

