
//float rotation[] = new float[10];
//float spin[] = new float [10];

int total = 0;
int rotation = 0;
int spin = 0;

int[] placedrot = new int[total];
float[] placedspin = new float[total];
float[] placedx = new float [total];
float[] placedy = new float [total];

float[] speed = new float[total];

void setup()
{
  size(700, 400);
  background (255);
  stroke(0);
}

void draw_swirly(float myX, float myY) {
  rotation = 0;
  pushMatrix();
  translate(myX, myY);
  rotate(radians(spin));
  spin = spin +1;

  int i = 0;
  while(rotation<360) {
    rotate (radians(rotation));
    line (i,i,30,30);
    rotation = rotation+10;
    line (i,i,30,30);

    rotation = rotation+20;
    line (i,i,30,30);
    rotation = rotation+15;
  }
  popMatrix();
}

void draw()
{
  background(255);
  draw_swirly(mouseX, mouseY);

  int count = 0;
  while(count<total) {
    pushMatrix();
    translate(placedx[count], placedy[count]);
    rotate(radians(placedspin[count]));
    placedspin[count] = placedspin[count] + 1 + speed[count];
    speed[count] = speed[count]*1.01 + 0.01;
    
    placedrot[count] = 0;
    int i = 0;
    while(placedrot[count]<360) {
      rotate (radians(placedrot[count]));
      line (i,i,30,30);
      placedrot[count] = placedrot[count]+10;
      line (i,i,30,30);
  
      placedrot[count] = placedrot[count]+20;
      line (i,i,30,30);
      placedrot[count] = placedrot[count]+15;
    }
    
    popMatrix();
    count = count+1;
  }
}

void mouseClicked() {
  if (mouseButton== LEFT) {
    total = total + 1;
    placedrot = expand(placedrot, total);
    placedspin = expand(placedspin, total);
    placedx = expand(placedx, total);
    placedy = expand(placedy, total);
    speed = expand(speed, total);
    
    placedrot[total-1] = rotation;
    placedspin[total-1] = spin;
    placedx [total-1] = mouseX;
    placedy [total-1] = mouseY;
    speed[total-1] = 0;
  }
}


