
float px = 1;
float v = 5;
void setup(){
  size(1000,1000);
}
void draw(){
  v=v-5;
  background(0);
 rect(8000+v,60,300,306);
 rect(5000+v,800,40,50);
 rect(2000+v,500,100,78);
 rect(1500+v,700,490,20);
 rect(1600+v,200,680,78);
 rect(1000+v,904,50,40);
 rect(3300+v,204,480,500);
 rect(2400+v,920,90,306);
 rect(3348+v,502,680,20);
 rect(2950+v,830,60,230);
ellipse(150,mouseY,60,60);
}

