
void setup(){
size (800,800);
background (0);


}

void draw (){

for (int i= 3; i<900; i+=160){
for (int a= 0; a<900; a+=150){
for (int e= 0; e<900; e+=150){
stroke (150);
 line(e,e,i,a);

}
}
}


for (int b= 3; b<800; b+=250){
for (int c= 5; c<800; c+=150){
fill (50,100,250, 30);
stroke(2);
  ellipse (700,700,c,b);
}
}


for (int t= 3; t<400; t+=150){
for (int f= 2; f<400; f+=150){
fill (250,255,0, 30);
rectMode (CENTER);
  ellipse (f,t,30,30);
  
  
}
}

for (int t= 3; t<400; t+=150){
for (int f= 2; f<400; f+=150){
fill (10,100,200, 10);
 rectMode (CENTER);
  ellipse (f,t,50,50);
}
}
}



