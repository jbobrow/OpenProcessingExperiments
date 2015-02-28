
void setup(){
textFont(loadFont("a.vlw"));
}
void draw(){
background(255,0,0);
int m=minute(),s=second(),h=hour();
float hy=(height+20)/60*m;
float my=(height+20)/60*s;
float sy=map(millis()%1000,0,1000,0,120);
text(h,9,hy);
text(m,40,my);
text(s,70,sy);
}
                
