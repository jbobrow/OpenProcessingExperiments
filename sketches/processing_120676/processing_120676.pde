
int modi = 1;
int counter = 0;
void setup(){
size(500,500);
background(0);
smooth();
}

void draw(){
 
if(mousePressed){ 
  
if(modi==1){  
noStroke();
float y = mouseY+random(-20,20); 
float x = mouseX+random(-20,20) ;
fill(255,255,255);
float r = random(0,10);
ellipse(x,y,r,r); 
stroke(255,0,0);
float dicke = random(30);
strokeWeight(dicke);
x = x + sin(frameCount/30.0)*30 ;
y = y + cos(frameCount/30.0)*30;
ellipse(x,y,5,5);
} 


if(modi==2){ 
fill(255,255,0);
ellipse(mouseX,mouseY,10,10);
float x = mouseX;
float y = mouseY;
float x2 = x + sin(frameCount/5.0)*30;
float y2 = y + cos(frameCount/5.0)*30;
stroke(0,0,150);
strokeWeight(2);
line(x,y,x2,y2);
} 

if(modi==3){ 
strokeWeight(1); 
stroke(0,150,50);
float x = mouseX;
float y = mouseY;
line(mouseX,mouseY,x+random(-20,20),y+random(-20,20));
} 
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
modi=3;
}

if(key=='c'){
background(0);
}

if(key == 's'){  
saveFrame(counter+".jpg");
counter++;
println(counter);
}
}
