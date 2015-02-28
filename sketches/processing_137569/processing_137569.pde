
String name = "MATTHEW";
char[] nameArray = name.toCharArray();
float x, y;
float[] xC, yC;
float[] nX, nY;
float r1, r2;
Boolean visible = true;
PFont f;
float c1,c2,c3;

void setup(){
  size(650,250);
  background(255);
  f = createFont("Papyrus", 80, false);
  xC = new float[nameArray.length];
  yC = new float[nameArray.length];
  c1 = 0;
  c2 = 0;
  c3 = 0;
}

void draw(){
 
  if (visible == true){
  background(255);
  fill(c1,c2,c3);
  textFont(f);
  x = 60;
  y = 150;
  for (int i = 0; i < nameArray.length; i++){
    text(nameArray[i],x,y);
    xC[i] = x;
    yC[i] = y;
    x+=78;
  } 
 }
 
 if (visible == false){
   fill(c1,c2,c3);
   background(255);
   for(int i = 0; i < nameArray.length; i++){
    text(nameArray[i], nX[i], nY[i]);
  }
   
   for(int i = 0; i < nameArray.length; i++){
      nX[i] = lerp(nX[i], xC[i], 0.08);
      nY[i] = lerp(nY[i], yC[i], 0.08);
  }
 }
}

void mouseClicked(){
  background(255);
  float newX;
  float newY;
  nX = new float[nameArray.length];
  nY = new float[nameArray.length];
  visible = false;
  for (int i = 0; i < nameArray.length; i++){
    newX = random(700);
    newY = random(700);
    nX[i] = newX;
    nY[i] = newY;
  }
  
  c1 = random(255);
  c2 = random(255);
  c3 = random(255);
}


