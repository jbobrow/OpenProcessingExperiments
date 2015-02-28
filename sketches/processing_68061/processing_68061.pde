
/*Elaborado por Santiago Vargas Nolasco*/

int x=0;

void setup(){
size(400,400);
smooth();
background(0,0,0);
frameRate(3);
}

void draw(){ 
stroke(255,255,0);//colorea la circunferencia
if(x==0){
background(0);
fill(255,255,0);//llenar rostro
arc(200,200,100,100,HALF_PI-QUARTER_PI,TWO_PI-QUARTER_PI);//rostro
fill(0,0,0);//llenar ojo
ellipse(180,180,20,20);//ojo
x=1;
}else{
background(0);
fill(255,255,0);//llenar rostro
arc(200,200,100,100,0,TWO_PI);//rostro
fill(0,0,0);//llenar ojo
ellipse(185,180,20,20);//ojo
x=0;
}
}

