
float[] a;
int start_time = 1000;


void setup() {

  size(400, 400);
  background(255, 255, 255, 5);


  a = new float[100];
}



void draw () {

  int i = 0;


  if ( millis() > start_time && millis() < start_time+2000 ) {
    ellipse(width/2, height/2, a[i]-5, a[i]-10);
  }

  if ( millis() > start_time+2000 ) {
    start_time = start_time + 1000;
  }



  while ( i <=  99) {
    stroke(0);
    fill(0, 0, 0, 0);
    ellipse(width/2, height/2, a[i]-5, a[i]-10);   

    a[i] = a[i] - random(-1, 100);

    fill(255, 255, 255, 0);

    ellipse(width/2, height/2, a[i]+5, a[i]+10);
    ellipse(width/2, height/2, a[i]+2, a[i]+4);
    fill(0, 0, 0, 10);
    ellipse(width/2, height/2, a[i]-2, a[i]-4);
    fill(255, 255, 255, 70);

    ellipse(mouseX, mouseY, a[i]+1, a[i]+1);

    a[i] = a[i] + random(-4, 99);
    i = i + 1;
  }

  while ( i < 0) {
    stroke(0);
    fill (0, 0, 0, 10);
    i = i -20;
    ellipse(width/2, height/2, i, i);   
    ellipse(width/2, height/2, i+60, i+10);
  }
}



