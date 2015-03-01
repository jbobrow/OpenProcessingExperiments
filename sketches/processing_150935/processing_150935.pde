

//========================================================== 
import ddf.minim.*; 

Minim minim; 
AudioInput input; 

//========================================================== 

void setup(){
size(800,800,P3D);
noStroke();
fill(255);
//==========================================================  


  minim = new Minim (this); 


  input = minim.getLineIn (Minim.MONO, 512); 


  //========================================================== 

} 
}

void draw(){
lights();
ambientLight(102,102,102);
directionalLight(255,255,255,-1,0,0);
pointLight(255,255,255,mouseX,110,50);
spotLight(255,255,255,mouseX,0,200,0,0,-1,PI,2);rotateY(PI/24);
background(0);
translate(width/2,height/2,-20);

int di=19;
for(int i= -height/2; i<height/2; i+=di*1.4){
for(int j= -height/2; j<height/2; j+=di*1.4){
pushMatrix();
translate(i,j,-j);
box(di,di,di);
popMatrix();
}
}
}

