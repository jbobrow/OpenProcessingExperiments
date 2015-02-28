
void setupstars(){
  for (int i = 0; i < stars; i++) {
    myArray[i][0] = int(random(width));
    myArray[i][1] = int(random(height));
}
}

void cond(){
  fill(150);
  pushMatrix();
  translate(width/2, height/2);
  if (mousePressed == true){
    G = G1;
    k = 1;
    background(0);
    stroke(255);
    line(x0,y0,-width/2+mouseX, -height/2+mouseY);
    noStroke();
    popMatrix();
    RenderBodies();
    pushMatrix();
    translate(width/2, height/2);
    fill(150);
    ellipse(x0,y0,2*planetRadius,2*planetRadius);
    velocity.x = (-width/2+mouseX - x0)/30;
    velocity.y = (-height/2+mouseY - y0)/30;
  }
    popMatrix();
  if ((mousePressed == false) && (k == 0)) {
    ellipse(mouseX, mouseY,2*planetRadius,2*planetRadius);
    x0 = -width/2+mouseX;
    y0 = -height/2+mouseY;
  }
  if ((mousePressed == false) && (k == 1)) {
    location.x = x0;
    location.y = y0;
    k = 2;
} 
}

void RenderVisuals() {
  tail();
  grid();
  RenderBodies();
  MassScale();
  renderText();
}

  void tail(){
    noStroke();
    fill(0,10);
    rect(0,0,width,height);
  }  

  void grid(){
    if (keyPressed == true){
    float A = 100; //circle separation
    float B = 16;  //number of lines
    pushMatrix();
    translate(width/2, height/2);
    stroke(150);
    fill(0,0,0,0);
    for (int i = int(A); i < width; i += A) {
      ellipse(0,0,2*i,2*i);
    }
    for (int i = 0; i < B; i ++) {
    rotate(i*2*PI/B);
    line(0,0,0,width);
    }
    popMatrix();
  }}
  
  void RenderBodies(){
    displaystars();
    planet();
    sun();
  }
  
    void displaystars(){
      for (int i = 0; i < stars; i++) {
      fill(255);
      ellipse(myArray[i][0],myArray[i][1],1.5,1.5);
    }}
    
    void planet(){
      pushMatrix();
      translate(width/2, height/2);
      fill(150);
      ellipse(location.x,location.y,2*planetRadius,2*planetRadius);
      popMatrix();
    }
    
    void sun(){
      pushMatrix();
      translate(width/2, height/2);
      fill(#F9FA00);
      ellipse(0,0,2*sunRadius,2*sunRadius);
      popMatrix();
    }
  
  void MassScale() {
    float a = 5*M;
    fill(150);
    rect(10,a,40,20);
    if ((mousePressed == true) && (mouseX < 50) && (mouseX > 10)){
    M = mouseY/5;
    }
  }
  
  void renderText(){
   fill(255);
   text("v = " +velocity.mag(), 5, 15);
   text("escape velocity = " + ve, 5, 45);
   text("initial escape velocity = " + ve0, 5, 75);
  }

void Calculations() {
  gravity();
  collision();
  EscapeVelocity();
}

  void gravity(){
    r = location.mag();
    acceleration.x = location.x/(-r)*G*M/(r*r);
    acceleration.y = location.y/(-r)*G*M/(r*r);
    velocity.add(acceleration);
    location.x += dt*velocity.x;
    location.y += dt*velocity.y;
  }

  void collision(){
    if (r < sunRadius + planetRadius) {
      G=0;    
      velocity.x=0;
      velocity.y=0;
      pushMatrix();
      translate(width/2, height/2);
      stroke(255);
      line(-(sunRadius+10),-(sunRadius+10),sunRadius+10,sunRadius+10);
      line(-(sunRadius+10),sunRadius+10,sunRadius+10,-(sunRadius+10));
      popMatrix();
    }}

  void EscapeVelocity(){
    ve0 = sqrt(2*G*M/sqrt(x0*x0+y0*y0));
    ve = sqrt(2*G*M/r);
  }


