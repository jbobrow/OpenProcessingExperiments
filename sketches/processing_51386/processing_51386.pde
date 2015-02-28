
void setup(){
  
int xpos;
int ypos;
int interval;
int gradientWidth, gradientHeight;
float ratio;

size(440, 440);
background(36,53,196);

interval = 255/5;
ratio=0.75;




xpos = width/2;
ypos = height/2;

noStroke();
//blue circle
fill(64,112,211);
ellipse(xpos, ypos, width, height);
//purple elipse
fill(153,53,165);
ellipse(xpos,ypos,width,height*ratio);
//light blue circle
fill(66,173,198);
ellipse(xpos,ypos,width*ratio,height*ratio-15);
//red elipse
fill(219,24,2);
ellipse(xpos,ypos,width*ratio,height*ratio*ratio);
//mint circle
fill(75,180,123);
ellipse(xpos, ypos, width*ratio*ratio, height*ratio*ratio-20*ratio);
//orange elipse
fill(234,105,45);
ellipse(xpos, ypos, width*ratio*ratio, height*ratio*ratio-10*ratio-80);
//light lime circle
fill(204,229,130);
ellipse(xpos, ypos, width*ratio*ratio*ratio-20, height*ratio*ratio-20*ratio-80);
//faded salmon elipse
fill(242,153,108);
ellipse(xpos, ypos, width*ratio*ratio*ratio-20, height*ratio*ratio-20*ratio-80*ratio-120);
//yellow circle
fill(241,245,133);
ellipse(xpos, ypos, height*ratio*ratio-20*ratio-80*ratio-120, height*ratio*ratio-20*ratio-80*ratio-130);
}

