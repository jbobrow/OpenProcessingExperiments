
void setup(){
  size(500,500);

}
void draw(){
background(random(255),random(255),random(255));

int m=minute(),s=second(),h=hour();
float hy=(height+20)/60*m;
float my=(height+20)/60*s;
float sy=map(millis()%2000,0,2000,0,500);


 fill(random(255),random(255),random(255));
textSize(60);
text(h,30,hy);
textSize(400);
text(m,15,my);
textSize(60);
text(s,400,sy);
}
