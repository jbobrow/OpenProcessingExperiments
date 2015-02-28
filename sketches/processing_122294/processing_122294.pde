

int modi = 1;
PImage bild;
int counter = 0;
int drawMode = 1;

int cs = 5;

float x = 0;
float y = 0;


void setup(){
 size(640,960);
 smooth();
 background(0); 
 frameRate(1150);
 bild = loadImage("bild3.jpg");
 String s = "Tasten: 1-5 s= Save";
text(s,510, 900, 90, 90);
}


void draw () {
  if (mousePressed) {
   
         switch(drawMode) {
      case 3:

      y = mouseY;
     noStroke();
int x1 = mouseX+int(random(-50,50));
  int y1 = mouseY+int(random(-50,50));
 
fill(255,0,0);
//ellipse(x,y,10,10);

float x2 = x1+sin(frameCount/10.0)*50;
float y2 = y1+cos(frameCount/10.0)*50;
 


float x3 = x2+sin(frameCount/ 100.0)*10;
float y3 = y2+cos(frameCount/100.0)*10;
 


 fill(bild.get(int(x3),int(y3)),30);

 ellipse(x3,y3,80,80);


    break;
    
     case 1:
float x5 = mouseY+sin(frameCount/10.0)*50;
float y5 = mouseX+cos(frameCount/10.0)*50;

strokeWeight(1);
stroke(bild.get(int(mouseX),int(mouseY)),40);

line(x5,y5,mouseX,mouseY);
        break;
        case 2:
 y = mouseY;
     noStroke();
x = mouseX+sin(frameCount/100.0)*40;
y = mouseY+cos(frameCount/100.0)*40;
 
float x4 = x+sin(frameCount/ 4.0)*80;
float y4 = y+cos(frameCount/4.0)*80;
 

 
stroke(bild.get(int(x),int(y)),60);
line(x,y,x4,y4);
        break;
        
      case 4:
for(int i = 0; i<1;i++){
int x = mouseX+int(random(- 50, 50));
int y = mouseY+int(random(- 50, 50));
fill(bild.get(x,y),40);
noStroke();
ellipse(x,y,random(15,35),random(15,35));
}
break;

case 5:

for(int i=0; i<10 ;i++){
  
  int x = mouseX+int(random(-50,50));
  int y = mouseY+int(random(-50,50));
  noStroke();
  fill(bild.get(x,y),40);
  ellipse(x,y,5,5);
}
        break;



    }


         
 
  }
}
void keyReleased() {
  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == '3') drawMode = 3;
  if (key == '4') drawMode = 4;
  if (key == '5') drawMode = 5;

}

void keyPressed() {

  if (key=='1') {
    //println("klick")
    modi = 1;
    saveFrame(counter+".jpg");
counter++;
println(counter);
  }
    if (key=='s'){
  saveFrame ("bild###.jpg");
  }
}






