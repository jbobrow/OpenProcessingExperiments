
/*int num = 200;
float theta;
float[][] t = new float[num][2];
PGraphics pg;

void setup(){
  size(600,600);
  // background(0);
  //smooth();
   for(int i = 0; i<num; i++){
    t[i][0] = random(-300,width);
    t[i][1] = random(-300,height);
  }
  pg = createGraphics(600,600, P2D);
}

void draw(){
  image(pg, 0,0);
  pg.beginDraw();
  pg.background(0);
  noCursor();
  //pg.fill(0,10);
 // pg.rect(0,0,width,height);
 pg.noFill();
   pg.translate(width/2,height/2);
    theta+=.01;
    for (int j = 0; j<num; j++){
    //t[j][0] += random(-1,1);
    //t[j][1] += random(-1,1);
    t[j][0] += random(sin(t[j][1]));
    t[j][1] += random(cos(t[j][0]));
    pg.rotate(radians(theta));
    pg.point(t[j][0],t[j][1]);
    
  for(int i = 0; i<num; i++){
    
  if(dist(t[i][0],t[i][1],t[j][0],t[j][1])<200){
    /// if dist between cords is less than 20, than draw a bezier conecting they.
    pg.beginShape();
    float Dist = dist(t[j][0],t[j][1],t[i][0],t[i][1]);
    float c1 = map(Dist,t[i][0],t[i][1],100,120);
    float c2 = map(Dist,t[i][0],t[i][1],100,200);
    float c3 = map(Dist,t[j][0],t[j][1],200,200);
    colorMode(HSB);
    pg.stroke(c1,c3,c2,8);
    pg.vertex(t[i][0],t[i][1]);
    pg.bezierVertex(t[i][0] ,t[i][1] ,( sin(t[i][0]) - cos(t[j][0]) ), ( cos(t[i][1]) - sin(t[j][1]) ), t[j][0], t[j][1]);
    pg.endShape();
   }
  }
 }
    pg.endDraw();
}

*/

