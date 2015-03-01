
boolean boton = false;
int x, vel;
int b, c;

int d=#35FAF8;
int e=#B0F76E;
int f=#FF7CE7;
int g=#615DFF;

void setup(){
size(400,400);
x = width/2;
vel = 5;
b = height/2;
c = 5;
}

void draw(){

background(0);
fill(#FF0303);
rect(150,300,100,100);

if (boton == false) {
  
frameRate(24);
fill(d);
d=d+e;

ellipse(x,height-150,20,20);
x=x+vel;
if((x<0+10)||(x>width-10)){
vel = -vel;
}
ellipse(x,height/2,20,20);
x=x+vel;
if((x<0+10)||(x>width-10)){
vel = -vel;
}
ellipse(x,height/2-50,20,20);
x=x+vel;
if((x<0+10)||(x>width-10)){
vel = -vel;
} 
ellipse(x,height/2-100,20,20);
x=x+vel;
if((x<0+10)||(x>width-10)){
vel = -vel;
} 
ellipse(x,50,20,20);
x=x+vel;
if((x<0+10)||(x>width-10)){
vel = -vel;
} 


} else if(boton ==true){

frameRate(10);
fill(f);
f=f+g;
rect(0,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
rect(40,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
rect(80,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
rect(120,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
rect(160,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
rect(200,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
rect(240,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
rect(280,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
rect(320,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
rect(360,b,20,80);
b=b+c;
if((b<0)||(b>height-180)){
c = -c;
}
}


}
void mousePressed(){
  if(mouseX>150 && mouseX<250 && mouseY>300 && mouseY<400 && mousePressed){
  boton = !boton;
  }
  }
