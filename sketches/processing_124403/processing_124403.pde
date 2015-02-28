
PImage bild;
int counter = 0;
float x = 0;
float y = 0;
void setup(){
 size(700,686);
 smooth();
 background(0); 
 frameRate(1150);
 bild = loadImage("ich.jpg");
}


void draw(){
 
noStroke();
x = mouseX+sin(frameCount/1250.0)*40;
y = mouseY+cos(frameCount/12.0)*20;
 
fill(255,0,0);
//ellipse(x,y,10,10);

float x2 = x+sin(frameCount/2.0)*10;
float y2 = y+cos(frameCount/2.0)*10;
 
 fill(bild.get(int(x2),int(y2)),200);
 ellipse(x2,y2,10,10);

float x3 = x2+sin(frameCount/ 400.0)*40;
float y3 = y2+cos(frameCount/400.0)*40;
 
 fill(bild.get(int(x3),int(y3)),500);
 ellipse(x2,y2,2,2);
stroke(bild.get(int(x),int(y)),110);
line(x,y,x3,y3);

}

void keyPressed(){
if(key == 'j'){  
saveFrame(counter+".jpg");
counter++;
println(counter);
}
}


