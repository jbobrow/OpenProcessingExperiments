
float angle;

float posx = 0;

float posy = 0;

float dirx = 2;

float diry = 2;

float angleval = .05;

float followerx;
float followery;

float easing = 0.005;

float rr, gg, bb, r, g, b;

void setup() {
size(800, 800);
background(0);
smooth();

rr = random(255);
gg = random(255);
bb = random(255);

r = random(255);
g = random(255);
b = random(255);


}
void draw() {
  
  rr += (r - rr) * .01;
  gg += (g - gg) * .01;
  bb += (b - bb) * .01;
  
  posx += dirx;
  
  if(posx >= width){
    dirx = random(-3)-1;
    angleval = random(.3)-.1;
    
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if(posx <= 0){
    dirx = random(3)+1;
    angleval = random(.1)-.1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  posy += diry;
  
  if(posy >= height){
    diry = random(-3)-1;
    angleval = random(.3)-.1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if(posy <= 0){
    diry = random(3)+1;
    angleval = random(.3)-.1;
        r = random(255);
    g = random(255);
    b = random(255);

  }
  
  
  followerx += (posx-followerx)*easing;
  followery += (posy-followery)*easing;
  
translate(followerx, followery);
rotate(angle);

//fill(0, 15);
//noStroke();
//rect(0,0,width,height);

fill(rr,gg,bb, 15);
stroke(rr,gg,bb, 75);
strokeWeight(2);
ellipse(-15, -15, 30, 60);

println(r);

angle += angleval;

if(mousePressed){
  setup();
}
}


