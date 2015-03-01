
import ddf.minim.*;

Minim minim;
AudioSample crash;
AudioSample Heartbeat;
AudioPlayer bgmusic;

float now; 
float r; 

void setup(){ 
size(700,450); 
minim = new Minim(this);
bgmusic = minim.loadFile("bgmusic.mp3");
bgmusic.loop();
} 

void draw(){
if (millis()-now > 1000) { // has 5 sec elapsed? 

for (int i =0; i <=2; i++) { r = random(0,2); } 

now = millis(); // reset the counter 

//image1 + text + sound 
if (r> 0 && r< 1){ 
loadImage("crash.jpg");
fill(0,0,255); 
rect(0,0,100,100); 
fill(0); 
text("'Beebbbbbbbbb' 'Bomb' A serious car accident happens followed by a huge noise.", 10,10); 
crash = minim.loadSample("crash.mp3");
} 

//image2 + text + sound 
if (r>1 && r <2){ 
loadImage("2.jpg");
fill(255,0,0); 
ellipse(50,50,100,100); 
fill(0); 
text("He awakes. Looking down to his body and his discovers that his right leg has been removed.", 10,10); 
Heartbeat = minim.loadSample("Heartbeat.mp3");
} 

} 
println(r); 
}
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
