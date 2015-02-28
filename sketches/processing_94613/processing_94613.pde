
void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
   textFont(createFont("Arial",32))
}


var hours=0;
var minets=0;
var seconds=0;
var updateClock=function(){
    seconds = seconds+1;
    if(seconds==60){
        minets=minets+1;
        seconds=0;
    }
     if(minets==60){
        hours=hours+1;
        minets=0;
    }
    
};

window.setInterval(updateClock, 1000);

void draw() {

    background(23, 11, 10);
    fill(219, 215, 215);
    text("hours:" + hours, 40,120);
    text("minets:" + minets, 30,150);
    text("seconds:" + seconds, 20,180);  
};
