
PGraphics pg;
final int MAX = 20;
int type[] = new int[MAX];
color col[] = new color[MAX];
PVector pos[] = new PVector[MAX];
PVector siz[] = new PVector[MAX];
PVector vec[] = new PVector[MAX];
float deg[] = new float[MAX];
float adeg[] = new float[MAX];

void setup(){
  size(400, 400, OPENGL);
  pg = createGraphics(width, height);
  noStroke();
  
  textureMode(IMAGE);


  for(int i = 0; i < MAX; i++){
    init(i);
  }
}

void init(int i){
  type[i] = (int)random(2);
  pos[i] = new PVector(-300, -300);
  siz[i] = new PVector(random(200), random(200));
  vec[i] = new PVector(random(4) + 0.2, random(4) + 0.2);
  col[i] = color(random(255), random(255), random(255));
  deg[i] = random(360);
  adeg[i] = random(10) - 5;
}

void draw(){
  pg.beginDraw();
  pg.background(255, 255, 255);
  for(int i = 0; i < MAX; i++){
  pg.fill(col[i]);
    pg.pushMatrix();
    pg.translate(pos[i].x, pos[i].y);
    pg.rotate(radians(deg[i]));
    switch(type[i]){
      case 0:
        pg.ellipse(0, 0, siz[i].x, siz[i].y);
      break;
      case 1:
        pg.rect(0, 0, siz[i].x, siz[i].y);
      break;
    }
    pg.popMatrix();
    deg[i] += adeg[i];
    pos[i].add(vec[i]);
    if(pos[i].x >= 600 || pos[i].y >= 600){
      init(i);
    }
  }
  pg.endDraw();

  
  beginShape(TRIANGLE_FAN);

  texture(pg.get());
  vertex(width / 2, height / 2, 0, 0, 0);
  for(int i = 0; i <= 180; i++){
    
    float x = cos(radians(i * 2)) * width / 2 + width / 2;
    float y = sin(radians(i * 2)) * height / 2 + height / 2;
    
    float td = abs((i * 2) % 120 - 60);
    float tx = cos(radians(td)) * width / 2 + width / 2;
    float ty = sin(radians(td)) * width / 2 + width / 2;
    vertex(x, y, 0, tx, ty);
  }  
  endShape(CLOSE);
  
}
