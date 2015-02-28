
int modi = 1;
int counter = 0;
color farbe1;

void setup(){

size(500,500);
background(0);
}

void draw(){
//println(modi);

if(modi==2){

// pushMatrix();
// translate(100,100); // alles was danach kommt verschieben um...
// translate(-100,-100); // danach folgende addieren sich...
// popMatrix();

farbe1 = color(random(255),random(255),random(255));
stroke(farbe1);
float dicke = random(20);
strokeWeight(dicke);
line(mouseX,mouseY,mouseX,mouseY);

if(mousePressed){
farbe1 = color(random(255),random(255),random(255));
stroke(farbe1);
strokeWeight(dicke);
line(mouseX,mouseY,pmouseX,pmouseY);
}
}
if(modi==3){
float x = 0;
float y = 0;
  
float s = sin(frameCount/10.0);
println(s);
fill(100+s*55.0,0,0);
ellipse(x,y,s*30,s*30);

x = mouseX + sin(frameCount/20.0)*130;
y = mouseY + cos(frameCount/20.0)*130;
ellipse(x,y,10,10);

x = x + sin(frameCount/2.0)*30;
y = y + cos(frameCount/2.0)*30;
ellipse(x,y,5,5);
}
}

void keyPressed(){
if(key=='1'){
modi = 1;
}
if(key=='2'){
modi = 2;
}
if(key=='3'){
modi = 3;
}

if(key== DELETE || key == BACKSPACE) background(random(255),random(255),random(255));
if(key=='b') background(0);
if(key=='w') background(255);

if(key=='s'){
saveFrame("Bild_"+counter+".png");
counter++;
}

}


