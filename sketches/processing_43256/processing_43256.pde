
float data [] = {1.005,0.095,0.080,0.062,0.60,0.058,0.070,0.060,0.090,1.030,0.058,1.018};
int dates [] = {1979,1984,1988,1992,1996,2002,2006,2007,2008,2009,2010,2011};
int x;
void setup(){
  background(0);
  size(1300,400);
  smooth();
}
void draw(){
  //for (int j = 0; j <dates. length; j++){
  for (int i = 0; i <data. length; i ++){
    smooth();
    float ellsize = map (data[i],40000,70000,0,200);
    x = i*108;
   fill(255,ellsize,ellsize);
    ellipse (x+80,data[i]*-200+350, ellsize, ellsize);
    fill(0);
    text (data[i], i*108+10,data[i]*-200+350);
    text (dates[i], i*108+10,dates[i]*200+350);
    fill(255,20,20);
    text("PRICE OF GAS 1979 - 2011", 200, 30);
    text("ADJUSTED FOR INFLATION", 200, 45);
   
  }
}


