
float counter=0;
boolean bStop;
 
void setup(){
  size(250,250);
  smooth();
  frameRate(10);
}
 
void draw(){
background(41,36,33);
noStroke();

// white bezier 
if(counter>0){
fill(255,90);
bezier (125, 250, random(width),
random(height), random(width), random(height), 125, 200);
}
// red bezier
if(counter>20){
fill(255,0,0,90);
bezier (125, 250, random(width),
random(height), random(width), random(height), 125, 100);
}
// blue bezier
if(counter>40){
fill(0,0,255,90);
bezier (125, 50, random(width),
random(height), random(width), random(height), 125, 250);
}
// green bezier
if(counter>60){
fill(0,255,0,90);
bezier (125, 0, random(width),
random(height), random(width), random(height), 125, 250);
}
// reset counter
if(counter>100){
  counter=0;
} 
counter++;
println(counter);
}

// pause & play
void keyPressed(){
if(key==' ')
{
  bStop = !bStop;
  if (bStop)
    noLoop();
  else
    loop();
}
}

