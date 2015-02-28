
void setup() {
background(500,500); 
size(500,500);
}

void draw () {
  background(500,500);

fill(242,7,35);
smooth();
ellipse(mouseX,mouseY,100,100); //head

fill(14,155,36);
smooth();
ellipse(mouseX,mouseY +65,30,30); //neck 1
ellipse(mouseX,mouseY +87,15,15); //neck 2

strokeWeight(2);
smooth();
line(mouseX -35,mouseY +340,mouseX -20,mouseY +246); //leg
line(mouseX +35,mouseY +340,mouseX +20,mouseY +246); //leg

strokeWeight(2);
fill(15,15,15);
smooth();
line(mouseX -110,mouseY +125,mouseX -50,mouseY +125); //arm
line(mouseX +50,mouseY +125,mouseX +110,mouseY +125); //arm
line(mouseX -110,mouseY +125,mouseX -110,mouseY +160); //forearm
line(mouseX +110,mouseY +125,mouseX +110,mouseY +90); //forearm

fill(random(250),random(250),random(250));
frameRate(10);
smooth();
ellipse(mouseX -110,mouseY +160,10,30); //hand
ellipse(mouseX +110,mouseY +90,10,30); //hand


fill(14,155,36);
smooth();
ellipse(mouseX -50,mouseY +125,15,15); //arm joint
ellipse(mouseX +50,mouseY +125,15,15); //arm joint
ellipse(mouseX -20,mouseY +250,15,15); //leg joint
ellipse(mouseX +20,mouseY +250,15,15); //leg joint

fill(random(150),random(150),random(150));
frameRate(10);
smooth();
ellipse(mouseX -40,mouseY +340,45,15); //foot
ellipse(mouseX +40,mouseY +340,45,15); //foot


fill(242,7,35);
smooth();
rect(mouseX -50,mouseY +95,100,150); //body

fill(random(225),random(225),random(225));
frameRate(10);
smooth();
rect(mouseX -12,mouseY +25,25,10); //mouth
triangle(mouseX -50,mouseY +245,mouseX,mouseY +140,mouseX +50,mouseY +245); //belly
ellipse(mouseX,mouseY -30,70,40); //hat

}






