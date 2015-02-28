
float SunDiam = 80;

float EarthDiam = 30;
float EarthOrbitRadius = 130;
float EarthAngle = 0;

float MoonDiam = 10;
float MoonOrbitRadius = 50;
float MoonAngle = 0;

void setup(){

  size(540,334);
  smooth();

}

void draw()
{

  background(0,0,0);
  translate(width/2,height/2);
  
  noStroke();
  
  //太陽を描画
  fill(255,200,64);
  ellipse(0,0,SunDiam,SunDiam);
  
  //地球を描画
  rotate(EarthAngle);
  translate(EarthOrbitRadius,0); //地球を中心に持ってくる
  fill(64,64,255);
  ellipse(0,0,EarthDiam,EarthDiam); //原点座標が地球になっている
  
  rotate(MoonAngle);
  translate(MoonOrbitRadius,0);
  
  fill(192,192,180);
  ellipse(0,0,MoonDiam,MoonDiam);
  
  EarthAngle += 0.01;
  MoonAngle += 0.02;
}
