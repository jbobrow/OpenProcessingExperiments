
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;

for(var i = 0; i<100000; i++){
  counter++;
  noStroke();
  var h,s,b;
  var x = random(0,1);
  var y = random(0,1);
  var b = random(200,255);
  if(x<=0.5 && y<=0.5){
      h = 122.5*x + 122.5*y;
      s = 122.5*x + 122.5*y;
  }else if(x<=0.5 && y>0.5){
      h = 122.5*x + 122.5*(1-y);
      s = 122.5*x + 122.5*(1-y);
  }else if(x>0.5 && y<=0.5){
      h = 122.5*(1-x) + 122.5*y;
      s = 122.5*(1-x) + 122.5*y;
  }else{
      h = 122.5*(1-x) + 122.5*(1-y);
      s = 122.5*(1-x) + 122.5*(1-y);
  }
      
  fill(h,b,s,50);
  
  ellipse((width)*x, (height)*y, 20*sin(counter), 20*sin(counter));
  
}
}
