
//PImage img0 , img1, img2, img3; //make image slot
PImage[] img = new PImage[20]; //Pimage can be int,float ect...
float r = 0;
float r1 = 0;
float r2 = 0;


void setup() {
  //frameRate(30);
  size(800, 800);
  background(0);
  
  for(int j = 0; j<20; j++){
  img[j]= loadImage( j + ".png");} //image load. use for, so...
  
}


void draw(){

float a = random(0,800);
float b = random(0,800);
float a1 = random(400,800);
float b1 = random(0,400);

image(img[0], a,b); // where will images sit
image(img[1],100,0);
image(img[3],100,100);
image(img[15],a,b);

pushMatrix();
rotate(r);
image(img[2], width/2, height/2);
popMatrix();

r = r+0.1;

for(int i = 0 ; i<10 ; i++){image(img[3],i*10,400); println(i);}
for(int k = 0 ; k<10 ; k++){image(img[4],5*k,5*k); println(k);}

image(img[5],300,300);
image(img[14], 250,250);

pushMatrix();
rotate(r1);
translate(300,300);
image(img[8], 0, 0);
image(img[9],0,0);
popMatrix();

image(img[11],a1,b1);
image(img[12],b1,a1);

r1 = r1 + 0.01;

image(img[10],width/2,height/2);

pushMatrix();
rotate(r2);
image(img[13], r2,r2 );
popMatrix();

r2 = r2 + 0.2;

image(img[6], 2*b,2*a);
image(img[7],120+a,120+b);
image(img[2],0,100+r);

image(img[16],b1,a);

image(img[17], 400,400);
image(img[18], r*10,r*10);
image(img[19], mouseX,mouseY);


}

void keyPressed(){
 saveFrame("img-####.png");
}


