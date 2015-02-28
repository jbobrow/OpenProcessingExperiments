
float X = 0;
float Y = 0;

void setup() {
background(0);
size(500, 500);
frameRate (50);
smooth();
}
  
void draw() {
 fill(255, 0, frameCount % 255, 50);
 stroke(frameCount % 255, 0,  255, 50); 
 fill(250, frameCount %100, X);
 X = random(225,200) ;
 quad(frameCount % 255, frameCount % 255, frameCount %50, frameCount %500, frameCount %425, frameCount %500, frameCount %450, frameCount %200);

line(200, frameCount %185,500- frameCount,500- frameCount);
line(500-frameCount,500-frameCount, frameCount%250,frameCount% 200);
line(frameCount% width, frameCount%100, 500, 300);
line(frameCount% width, frameCount%100, 200,500);
line(frameCount% width, frameCount%100, 200,100);
line(frameCount% width, frameCount%100, 100,100);
line(frameCount% width, frameCount%100, 50,500);
line(frameCount% width, frameCount%100, 10,500);
line(frameCount% width, frameCount%100, 5,500);
line(5,500,frameCount% width,frameCount%100);
line(200,300,frameCount% width,frameCount%100);
  
}
  
 

