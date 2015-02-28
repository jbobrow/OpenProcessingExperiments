
PImage rocky; 
PImage blur; 
int whiteness; 
int prevSecond, prevMin, prevHour; 
color[] bcolor = {
  #063260, #13587F, #021931, #24455C
    , #689EA1
};

int frames; 
int colr;

//Blight 
Blight myBlights[]; 
float bx, by; 
int  blightCount;

//jelly
Jelly myJelly; 
float jx, jy; 

// bubbles
Wave waveArray[];
int waveCount; 
int jSize; 



void setup() {
  size(600, 1000);
  background(#00131C);
  frameRate(10);
  whiteness = 0; 

  rocky = loadImage("rocky.png");
  blur = loadImage("blur.png");


  waveCount = 20;
  waveArray = new Wave[waveCount];
  for (int i = 0;i< waveCount; i++ ) {
    float size = random(7, 20); 
    waveArray[i] = new Wave(20 + i* 30, height, size);
  }

  jx = random(10, width-10); 
  jy = random(10, height-10); 
  jSize = 10; 
  myJelly = new Jelly(jx, jy, jSize);


  blightCount = 50;
  myBlights = new Blight[blightCount];
  for (int i = 0;i< blightCount; i++ ) {
    float bSize = random(2, 7);
    bx = random(10, width-10);
    by = random(10, height-10);
    myBlights[i]  = new Blight(bx, by, bSize);
  }
}

void draw() {
  int s = second(); 
  int m = minute();
  int h = hour(); 

  for (int i = 0; i < waveCount; i++ ) {
    waveArray[i].make();
    waveArray[i].update();
  }

  myJelly.render(); 
  myJelly.update(jSize); 


  if (frames % 60 == 0) {
    int index = int(random(0, bcolor.length));
    colr = bcolor[index];
  }

  drawParticles(); 

  noStroke();
  fill(colr, 40);
  rect(0, 0, width, height); 


  tint(255, 30);
  image(blur, 0, 0);
  tint(100, 50);
  image(rocky, 0, 0);


  if (h != prevHour) {
    if ((whiteness < 100) &&(h > 1)) {
      whiteness += 5;
    }
    else {
      whiteness = 0;
    }
  }

  if (m != prevMin) {
    if ((jSize < 100) && (m > 1)) {
      jSize += 1.5;
    }
  }
  else {
    jSize = 10;
  }

  for (int i = 0;i< blightCount; i++ ) {
    if (s != prevSecond) {   
      myBlights[i].render();
      myBlights[i].update();
    }
  }

  prevSecond = s;
  prevMin = m;
  prevHour = h; 
  frames ++;
}


void drawParticles() {
  noStroke();
  fill(#D8F2F9, 50);
  ellipse(random(0, width), random(0, height), 5, 5);
  fill(#D1F2BA, 50);
  ellipse(random(0, width), random(0, height), 10, 10);
  fill(#FF4D6A, 50);
  ellipse(random(0, width), random(0, height), 7, 7);
}

class Blight {
  float x; 
  float y; 
  int angle; 
  float size; 
  float speed; 
  color[] blcolor = {
    #EBBA57, #D28B44
  };
  int col; 

  Blight(float bx, float by, float s) {
    x = bx; 
    y = by;
    size = s; 
    angle = 0;
  }

  void render() {
    int index = int(random(0, blcolor.length));
    col = blcolor[index]; 
    fill(col, 80); 
    ellipse(x, y, size, size);
    ellipse(x, y+2, size, size);
  }

  void update() { 
    speed = random(-20, 20);
    x += speed * sin(angle); 
    y += speed; 
    angle += random(2, 10); 

    if (y > height) {
      y = 0;
    }

    if (y < 0) {
      y = height;
    }

    if (x > width) {
      x = 0;
    }

    if (x < 0) {
      x = width;
    }
  }
}

class Jelly {
  float x; 
  float y; 
  float size;
  float speed;
  color [] jcolor = {
    #DDBBD9, #E8CBC0, #DAA3DC, #DCF297, #9BF6FD, #C6BDEA
  };  
  int col; 
  float angle; 



  Jelly(float px, float py, float s) {
    x = px; 
    y = py; 
    size = s; 
    speed = random(15, 45);
    col = #DAA3DC;
  }

  void render() {
    stroke(col);
    strokeWeight(1);
    noFill();
    ellipse(x, y, size, size);
    strokeWeight(1);
    ellipse(x, y, size/2, size/2);
    strokeWeight(1);
    ellipse(x, y, size/4, size/4);
  }

  void update(int jSize) {
    size = jSize; 
    x += speed * cos(angle*0.0003); 
    y += speed; 
    angle += random(1, 5); 

    if (x < 0) {
      speed = -speed; 
      int index = int(random(0, jcolor.length));
      col = jcolor[index];
    }

    if (x > width) {
      speed = -speed; 
      int index = int(random(0, jcolor.length));
      col = jcolor[index];
    }

    if (y < 2.5) {
      speed = -speed; 
      int index = int(random(0, jcolor.length));
      col = jcolor[index];
      float rx = x; 
      float ry = y + 20; 
      ellipse(rx, ry, 20, 8);
      ellipse(rx, ry, 100, 8);
      ellipse(rx, ry, 200, 8);
    }

    if (y >= height) {
      speed = -speed; 
      int index = int(random(0, jcolor.length));
      col = jcolor[index];
    }
  }
}

class Jelly {
  float x; 
  float y; 
  float size;
  float speed;
  color [] jcolor = {
    #DDBBD9, #E8CBC0, #DAA3DC, #DCF297, #9BF6FD, #C6BDEA
  };  
  int col; 
  float angle; 



  Jelly(float px, float py, float s) {
    x = px; 
    y = py; 
    size = s; 
    speed = random(15, 45);
    col = #DAA3DC;
  }

  void render() {
    stroke(col);
    strokeWeight(1);
    noFill();
    ellipse(x, y, size, size);
    strokeWeight(1);
    ellipse(x, y, size/2, size/2);
    strokeWeight(1);
    ellipse(x, y, size/4, size/4);
  }

  void update(int jSize) {
    size = jSize; 
    x += speed * cos(angle*0.0003); 
    y += speed; 
    angle += random(1, 5); 

    if (x < 0) {
      speed = -speed; 
      int index = int(random(0, jcolor.length));
      col = jcolor[index];
    }

    if (x > width) {
      speed = -speed; 
      int index = int(random(0, jcolor.length));
      col = jcolor[index];
    }

    if (y < 2.5) {
      speed = -speed; 
      int index = int(random(0, jcolor.length));
      col = jcolor[index];
      float rx = x; 
      float ry = y + 20; 
      ellipse(rx, ry, 20, 8);
      ellipse(rx, ry, 100, 8);
      ellipse(rx, ry, 200, 8);
    }

    if (y >= height) {
      speed = -speed; 
      int index = int(random(0, jcolor.length));
      col = jcolor[index];
    }
  }
}
