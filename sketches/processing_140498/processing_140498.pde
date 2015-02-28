
size (500,500);

float proporzione= 0.3;
float larghezza = width *proporzione;
float altezza=400*random(0.1,0.9);
float altezza2=400-altezza;
fill(255);
int colore=int(random(4));
if(colore==0){
  fill(255);
} else if(colore==1){
  fill(255,225,0);
} else if(colore==2){
  fill(255,0,0);
} else {
  fill(0,0,255);
}
       
rect(0,0,larghezza,altezza);
 fill(255);
 colore=int(random(4));
if(colore==0){
  fill(255);
} else if(colore==1){
  fill(255,225,0);
} else if(colore==2){
  fill(255,0,0);
} else {
  fill(0,0,255);
}
rect(0,altezza,larghezza,altezza2);
 fill(255);
 colore=int(random(4));
if(colore==0){
  fill(255);
} else if(colore==1){
  fill(255,225,0);
} else if(colore==2){
  fill(255,0,0);
} else {
  fill(0,0,255);
}
rect(0,399,larghezza,100);

float h=height*0.2;
float lunghezza=width*0.7;
float lunghezza1=lunghezza*random(0.1,0.9);
float lunghezza2=lunghezza-lunghezza1;

fill(255);
 colore=int(random(4));
if(colore==0){
  fill(255);
} else if(colore==1){
  fill(255,225,0);
} else if(colore==2){
  fill(255,0,0);
} else {
  fill(0,0,255);
}
rect(larghezza,399,lunghezza1,h);
fill(255);
 colore=int(random(4));
if(colore==0){
  fill(255);
} else if(colore==1){
  fill(255,225,0);
} else if(colore==2){
  fill(255,0,0);
} else {
  fill(0,0,255);
}
rect(larghezza+lunghezza1,399,lunghezza2-1,h);
fill(255);
 colore=int(random(4));
if(colore==0){
  fill(255);
} else if(colore==1){
  fill(255,225,0);
} else if(colore==2){
  fill(255,0,0);
} else {
  fill(0,0,255);
}

rect(larghezza,0,width-larghezza-1, 399);
