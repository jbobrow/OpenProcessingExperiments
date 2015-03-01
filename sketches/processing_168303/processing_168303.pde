
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  cc = {#870100, #D63800,#FF6200,#FFA900,#FFDD00 }
  
  flame_duration = 30;
  color_1 = cc[0];
  color_2 = cc[1];
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  if (counter <= flame_duration){
      //fill(cc[int(random(cc.length))]);
      fill(lerpColor(color_1,color_2,counter/flame_duration));
  }
  else{
       counter = 0;
       flame_duration = random(10,40);
       color_1 = color_2;
       color_2 = cc[int(random(cc.length))];
  }
  ellipse(width/3, height/2, 80, 80);
  ellipse(width*2/3, height/2, 80, 80);
}
