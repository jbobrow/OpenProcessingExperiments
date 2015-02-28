
int x=5;
int direccion=1;


void setup(){
size (800,800);
background (0);
}

void draw(){
PFont font1;
PFont font2;

font1= loadFont ("BudmoJigglerBold-48.vlw");

textFont (font1);


for (int b=2; b<800; b+= 30){
for (int v=4; v<800; v+= 40){  

rotate (direccion);
fill (200, 100,0,80);

text ("123",x,b,v);


direccion=direccion -6;
}
}

font2= loadFont ("AvatarOutline-60.vlw");
textFont (font2);

for (int a=2; a<800; a+= 60){
for (int z=2; z<800; z+= 30){
  
rotate (direccion);
fill (0,100,255,30);

text ("ACD",a,x,z);


}
}

}



