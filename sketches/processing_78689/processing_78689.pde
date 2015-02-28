
PImage andante;
PImage ants;
float pointillize =4;
void setup(){
 size(800,800);
 smooth();
 background(255);
 andante = loadImage("andante.gif");
 ants= loadImage("ants-decal.gif");
colorMode(HSB,360,100,100,100);
pushMatrix();
translate(10,10);
image(andante,0,0);
popMatrix();
 image(andante,0,0);
 photoFilter(); 
 for(int i=0; i<1000; i++){
  int x=int(random(width));
  int y= int(random(height));
  color cp= andante.get(x,y);
  float b= brightness(cp);
  float s= saturation(cp);
 if(b<100){
   noStroke();
  fill(random(255),random(255),random(255),random(10,40));
  ellipse(x*sin(x),y+cos(y),i/10,i/10);
   strokeWeight(random(.5));
  stroke(0,10);
  line(x,y,random(-i,i),5*random(-i,i));
 
 }

else if (b>150){
  s=0;
}
  else{
    strokeWeight(random(.5));
  stroke(0,10);
  line(x,y,random(-i,i),5*random(-i,i));
 } 
 }
}

void draw(){
  for(int i=0; i<1000; i++){
  float x=sin(i);
  float y= cos(i);
  fill(random(100),random(.5));
  ellipse(random(width),random(height),x,y);
 // next code (pontillize), taken from image section of the book. 
  int a= int(random(ants.width));
  int s= int(random(ants.height));
  int loc= a+s*ants.width;
  float h= hue(ants.pixels[loc]);
  float b= brightness(ants.pixels[loc]);
  if(b==0){
  noStroke();
  h= 245;
  fill(h,100);
  translate(50,0);
  ellipse(a,s,pointillize,pointillize);
  }
  }
}

void photoFilter(){
  andante.loadPixels();//without img, will load screen
  int andanteSize = andante.width*andante.height;//# of pixels
  for(int i=0; i <andanteSize;i++){
  color cp=andante.pixels[i];
  float h= hue(cp);
  float s= saturation(cp);
  float br= brightness(cp);
  if (br==0){
  andante.pixels[i]= color(90,10,90);
  }
  else if(br>0){
    andante.pixels[300]= color(10,10,200);
  }
  else{
    andante.pixels[130]= color(30,10,0);
  }
}
andante.updatePixels();
image(andante,0,0);
}



