
float theta;
float increment=.02;
float ran;
void setup(){
   size(640, 360);
  background(0);
}
void draw(){
  if (mousePressed){
  noiseDetail(8,0.65f);
  ran=random(width/2-130,width/2+130);
  for(int i=0; i<height/2; i++) {//sky
    stroke(i,i/2-10,255-i);
    line(0, i, width, i);
  }
  noStroke();
  for(int i=0; i<40; i+=1) {//stars
    fill(255,random(255));
    ellipse(random(width),random(height/2),0.1,0.1);
  }

  for(int i=0; i<50; i+=1) {//sun
    fill(250,226,10,255-(255/50)*i);
    ellipse(ran,height/2,40+i,40+i);
  }
  fill(255,150); //moon
  arc(80,80,30,30,radians(80),radians(260));
  loadPixels();
  float xoff = 0.0; // clouds
  for (int x = 0; x < width; x++) {
    xoff += increment;    
    float yoff = 0.0;   
    for (int y = 0; y < height/2; y++) {
      yoff += increment;
      float bright = noise(xoff,yoff)*255;
      if(bright>180){
        pixels[x+y*width] = color(255,bright,240);
      }
    }
  }
  updatePixels();
  noiseDetail(3,0.5);//mountains
  float noiseScale=0.02;
  for(int i=0;i<122;i+=30){ 
    float rand=random(100);
    for(int x=0; x < width; x++) {
      float noiseVal = noise((rand+x)*noiseScale,rand*noiseScale);
      stroke(183-((183-23)/120)*i,135-((135-124)/120)*i,252-((252-19)/120)*i);
      line(x, noiseVal*80+i/3+height/2-80, x, height);
     }
  }
  smooth();//tree
  stroke(255);
  float a = (random(640) / (float) width) * 90f;
  theta = radians(a);
  translate(random(width/10,width-width/10),random (height-60,height));
  line(0,0,0,-50);
  translate(0,-50);
  branch(50);
 }
}
void branch(float h) {
  h *= 0.66;
  if (h > 2) {
    pushMatrix();    
    rotate(theta);   
    line(0, 0, 0, -h);  
    translate(0, -h);
    branch(h);      
    popMatrix();   
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}





