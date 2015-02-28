
PImage[] img = new PImage[20];
PImage back;
int copy = 50;

float a = 0;
float b = 0.1;
void setup() {
  size(800, 900);
  background(255);
  
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".png");
    back = loadImage("back.png");
 }
 }

void draw() {
  
  //translate(width/2,height/2);
  
  
 pushMatrix();
 tint(255,100);
  //translate(width/2, height/2);
  rotate(b);
  b=b-0.01;
  //image(img[0], 0, 0, 200, 200);
  //image(img[1], 0, 0, 200, 200);
  popMatrix();
 
  //pushMatrix();
  a = a + 0.01;
 image(back,0,0);
  rotate(a);
  

  float r = random(200, 100);
  for(int i = 0; i <20; i++){image(img[i], copy*i, r);
  if(9<i){
  rotate(a);
}
  if(5<i){
    rotate(b);
  }
  //image(img[i], copy*i, r, 400, 400);
}
pushMatrix();
rotate(a); 
image(img[12],400,450,r/2,r/2);

popMatrix();

image(img[2], copy*2, r, 400, 400);
  image(img[6], copy*2, r, 400, 400);
  image(img[10], copy*2, r, 400, 400);
  image(img[14], copy*2, r, 400, 400);
  //popMatrix();
  image(img[3],copy, random(200, height), r, r);
  image(img[8], random(400, 400), random(200, height), r, r);
  
  image(img[12], random(400, 400), random(200, height), r, r);
  image(img[17], random(400, 400), random(200, height), r, r);
  image(img[19], random(400, 400), random(200, height), r, r);
  image(img[5], mouseX, mouseY);
  println(mouseX +":"+ mouseY); 



}

void keyPressed() {
  saveFrame("img-####.png");//if press key, and capture
}


