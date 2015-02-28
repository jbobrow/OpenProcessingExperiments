
int counter;

void setup() {  //setup function called initially, only once
  size(displayWidth,displayHeight);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
   int akk = 110;
   int ka = 10;
   for(int i = 11; i < akk; i++){
       str qball = "those who march, end in march";
       strokeWeight(0.02);
       ellipse(random(1000),random(300),120,120);
       fill(random(233),255,255,random(0.9));
       for( int ao = 10; ao < 88; ao+=2){
           int aoa = ao * 10;
           int aob = ao * 2;
           ellipse(random(width),random(height),aoa,aoa);
           ellipse(random(width),random(height),aoa,aoa);
           ellipse(random(width),random(height),aoa,aoa);
           ellipse(random(width),random(height),aoa,aoa);
           fill(255,random(200),random(88),1);
       }
   }
}
