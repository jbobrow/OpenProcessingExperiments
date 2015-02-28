

//clouds, stars,hour tabs

PFont f;

void setup() {
  colorMode (HSB, 100);
  size(400, 200);
  noStroke();
  f = createFont ("Arial",16,true);
}

void draw() {
   
  float s = map(second(), 0, 60, 0, 100);
  float m = map(minute(), 0, 60, 0, 100);
  float h = map(hour(), 9, 24, 0, 100);
  float a = 250.00-(s*12 + 125);   //morning
  float b = s*7-250;    //dawn
  float c = s*30-1450;    //night
  float d = s*10-900;   //dusk
  float e = s*8;   // sun/moon
  
sky (60,50,100,250,0,0,400,400);    // morning

sky (17,100,100,a,0,0,400,400);   // day

sky (0,100,100,b,0,0,400,400);   // dawn

sky (70,0,10,c,0,0,400,400);    // night

sky (90,100,100,d,0,0,400,400);   // dusk


sun (17,100,100,250,e,100,20,20);    // sun



   stroke(100);
  line(33.3, 25, 33.3, 35);   // hour tabs
  line(66.6, 25, 66.6, 35);   
  line(99.9, 25, 99.9, 35);   
  line(133.2, 25, 133.2, 35);   
  line(166.5, 25, 166.5, 35);   
  line(199.8, 25, 199.8, 35);   
  line(233.1, 25, 233.1, 35);   
  line(266.4, 25, 266.4, 35);  
  line(299.7, 25, 299.7, 35);   
  line(333.0, 25, 333.0, 35);  
  line(366.3, 25, 366.3, 35);  
  
  textFont(f,13);     //numbers           
  fill(100);                        
  text("8",30,17);  
  text("9",63,17);
  text("10",93,17);
  text("11",127,17);
  text("12",160,17);
  text("1",196,17);
  text("2",230,17);
  text("3",263,17);
  text("4",296,17);
  text("5",326,17);
  text("6",362,17);
  
  
  if(s>50){                              //stars
   for(float i=0; i<width; i+=20){
     for(float j=0; j<height; j+=20){
  ellipse(random(0,400),random(0,400),.5,.5);
   }
   }
  
  }
  
   for(float u=20; u<40; u++){
   for(float v=250; v<0; v--){
     ellipse(e,100,u,u); 

   }
 }

 sun (45, 50, 100,250,e - 400,100,20,20);    // moon

  
}

void sky(float hue,float saturation,float brightness,float transparency,float x,float y,float H,float W){
noStroke();
fill(hue,saturation,brightness,transparency);    
rect(x,y,H,W);

}

void sun(float hue,float saturation,float brightness,float transparency,float x,float y,float H,float W){
noStroke();
fill(hue,saturation,brightness,transparency);    
ellipse(x,y,H,W);

}



