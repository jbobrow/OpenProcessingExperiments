
int vector[];

void setup() {
  vector = new int[5];
  setOrigin();
  size(500,500);
  
}

void setOrigin() {
    vector[0] = 20;
    vector[1] = 40;
    vector[2] = 60;
    vector[3] = 80;
    vector[4] = 100;
}

void setChange() {
    vector[0] = 30;
    vector[1] = 50;
    vector[2] = 70;
    vector[3] = 90;
    vector[4] = 110;  
}

void draw() {
  background(255);
  stroke(0);
  fill(0);
  rect(0,0,20,height);
  rect(width-20,0,20, height);
  rect(0,height-20,width,20);
  
  for(int i=0;i<5;i++) {
    fill(random(255),random(255),random(255));
     strokeWeight(i*3);
     rect(vector[i],vector[i]*i,8*i,6*i); 
    
  }
  
}


void mouseMoved() {
  if(mouseX < 20
    || mouseX > (width - 20)
      || mouseY > (height - 20)
  ) {
    setChange();
  }
  else
    setOrigin();
  
  
}

