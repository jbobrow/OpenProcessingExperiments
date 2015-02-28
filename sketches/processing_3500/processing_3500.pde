
PImage ritoque;
int spacer;
void setup(){
  spacer = 15;
  ritoque = loadImage("ritoque.JPG");
  size(ritoque.width, ritoque.height);
  noStroke();
  noLoop(); 
  colorMode(HSB, 255);
  smooth();
  background(255);
}

void draw(){
  int spacer = 15; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < 164; x += spacer){
      color c = ritoque.get(x,y);
      pincelada1(x, y, c, spacer);
    }
  }

  for(int y = 0; y < height; y += spacer){
    for(int x =164; x < 328; x += spacer){
      color c = ritoque.get(x,y);
      pincelada2(x, y, c, spacer);
    }
  }
  for(int y = 0; y < height; y += spacer){
    for(int x =328 ; x < 492; x += spacer){
      color c = ritoque.get(x,y);
      pincelada3(x, y, c, spacer);
    }
  }

  for(int y = 0; y < height; y += spacer){
    for(int x =492 ; x < 656; x += spacer){
      color c = ritoque.get(x,y);
      pincelada4(x, y, c, spacer);
    }
  }

  for(int y = 0; y < height; y += spacer){
    for(int x =656 ; x < 820; x += spacer){
      color c = ritoque.get(x,y);
      pincelada5(x, y, c, spacer);
    }
  }
}




void pincelada1(float x, float y, color c, float amp){
  int puntos = round(random(1,10));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + random(-10, 10);
    float s = saturation(c) + random(5);
    float b = brightness(c) + random(-5, 10);
    pushMatrix();
    translate(x,y);
    rotate(PI/5);

    fill(h,s,b);
    float tam = random(2, amp/2);
    rect(2*random(-amp, amp),4*random(-amp, amp), 3*tam, tam);
    popMatrix();
  }
}

void pincelada2(float x, float y, color c, float amp){ 
  int puntos = round(random(1,10));//cantidad de pinceladas 
  for(int i = 0; i <= puntos; i=i*i+1){ 
    float h = hue(c) + random(-10, 10); 
    float s = saturation(c) + random(5); 
    float b = brightness(c) + random(-5, 10); 
    pushMatrix(); 
    translate(x-15,y-15); 
    rotate(PI/4); 

    fill(h,s,b); 
    float tam = random(2, amp/2); 
    rect(2*random(-amp, amp),4*random(-amp, amp), 3*tam, tam); 
    popMatrix(); 
  }
} 
void pincelada3(float x, float y, color c, float amp){ 
  int puntos = round(random(1,10));//cantidad de pinceladas 
  for(int i = 0; i <= puntos; i=i*i+1){ 
    float h = hue(c) + random(-10, 10); 
    float s = saturation(c) + random(5); 
    float b = brightness(c) + random(-5, 10); 
    pushMatrix(); 
    translate(x-15,y-15); 
    rotate(PI/3); 

    fill(h,s,b); 
    float tam = random(2, amp/2); 
    rect(2*random(-amp, amp),4*random(-amp, amp), 3*tam, tam); 
    popMatrix(); 
  } 
}
void pincelada4(float x, float y, color c, float amp){ 
  int puntos = round(random(1,10));//cantidad de pinceladas 
  for(int i = 0; i <= puntos; i=i*i+1){ 
    float h = hue(c) + random(-10, 10); 
    float s = saturation(c) + random(5); 
    float b = brightness(c) + random(-5, 10); 
    pushMatrix(); 
    translate(x-15,y-15); 
    rotate(PI/2); 

    fill(h,s,b); 
    float tam = random(2, amp/2); 
    rect(2*random(-amp, amp),4*random(-amp, amp), 3*tam, tam); 
    popMatrix(); 
  } 
}
void pincelada5(float x, float y, color c, float amp){ 
  int puntos = round(random(1,10 ));//cantidad de pinceladas 
  for(int i = 0; i <= puntos; i=i*i+1){ 
    float h = hue(c) + random(-10, 10); 
    float s = saturation(c) + random(5); 
    float b = brightness(c) + random(-5, 10); 
    pushMatrix(); 
    translate(x-15,y-15); 
    rotate(PI/1.8); 

    fill(h,s,b); 
    float tam = random(2, amp/2); 
    rect(2*random(-amp, amp),4*random(-amp, amp), 3*tam, tam); 
    popMatrix(); 
  } 
} 


void keyPressed(){
  redraw(); 
}





