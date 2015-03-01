
float hoy=30;
float ayer=random(width,height);

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
hoy=hoy*1.00098;
ayer=ayer*1.00069;
 rect(35,hoy,hoy,hoy);
 rect(hoy,189,hoy,hoy);
  rect((35*hoy),hoy,hoy,hoy);
 rect(hoy,189,hoy,hoy); rect(35,hoy,hoy,hoy);
 rect(ayer,ayer,ayer,ayer);
}
