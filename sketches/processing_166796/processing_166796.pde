
float[][] eColor = new float[1][5];
float[][] speed = {{1.5, 2.5, 1.0, 2.2, 1.9}}; 

void setup(){
 size(400,200);
 background(255);
 smooth();
 strokeWeight(2);
 stroke(255);
 ellipseMode(CENTER);
 for(int g =0; g<1; g++){
 for(int a =0; a<5; a++){
   eColor[g][a] += speed[g][a];
 }
 }
 }
 
 void draw(){

 for(int b =0; b<5; b++){
fill(183,85,85);
 
 ellipse(b*100+50,200,100,100); //6
 }
  
for(int q =0; q<5; q++){
 fill(183,85,85);
 ellipse(q*100,160,100,100);
 } 
for(int g =0; g<1; g++){
 for(int a =0; a<5; a++){
  eColor[g][a] += speed[g][a];
  if (eColor[g][a] > 255 || eColor[g][a] < 0) speed[g][a]= -speed[g][a];
  fill(0,eColor[g][a],255,127);
  ellipse(a*100,160,80,80);
  }
 }                              //5
 
 
 
 for(int m =0; m<5; m++){
 fill(183,85,85);
 ellipse(m*100+50,120,100,100); //4
 
   noFill();
ellipse(m*100+50,120,80,80);
 } 
 
 for(int n =0; n<5; n++){
 fill(183,85,85);
 ellipse(n*100,80,100,100); //3
 }
 
 for(int t =0; t<1; t++){
  for(int u =0; u<5; u++){
  eColor[t][u] += speed[t][u];
  if (eColor[t][u] > 255 || eColor[t][u] < 0) speed[t][u]= -speed[t][u];
  fill(eColor[t][u],eColor[t][u],255,127);
ellipse(u*100,80,80,80);
 } 
 }
 
 for(int z =0; z<5; z++){
 fill(183,85,85);
 ellipse(z*100+50,40,100,100); //2
 
 
  noFill();
ellipse(z*100+50,40,80,80);
}

 for(int x =0; x<5; x++){

fill(183,85,85);
 ellipse(x*100,0,100,100);
 } //1 
for(int f =0; f<1; f++){
  for(int o =0; o<5; o++){
  eColor[f][o] += speed[f][o];
  if (eColor[f][o] > 255 || eColor[f][o] < 0) speed[f][o]= -speed[f][o];
  fill(eColor[f][o],255,eColor[f][o],127); 
 
ellipse(o*100,0,80,80);

}
}

 }


