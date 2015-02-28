
float x,y,r,g,b,alfa= 0;
float VarY = random(10);
float VarX = random(10);
float VarR = random(10);
float Varr = random(255);
float Varg = random(255);
float Varb = random(255);
float VarA = random(100);
float VarAng = random(100);
float radio,angulo;

void setup(){
  size(900,900);
  background(255,255,255);
  smooth();
  noFill();
}

void draw(){
  translate(width/2,height/2);
  sumas();
  angulo+=2*noise(VarAng)-1;
  float rad = (radians(angulo));
  
  x = cos(rad)*((noise(VarX)*400)-400);
  y = sin(rad)*((noise(VarY)*400)-400);
   radio = 50 + (noise(VarR)*50);
    r = noise(Varr)*255;
    g = noise(Varg)*255;
    b = noise(Varb)*255;
    alfa = noise(VarA)*100;
    stroke(r,g,b,alfa);
    ellipse(x,y,radio,radio);
}
void mouseClicked(){
  background(255);
}
void sumas(){
   VarY -=0.0005;
   VarX += 0.0005;
   VarR += 0.0005;
   Varr += 0.0005;
   Varg += 0.0005;
   Varb += 0.0005;
   VarA += 0.0005;
   VarAng += 0.001;
}


