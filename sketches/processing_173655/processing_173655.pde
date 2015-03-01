
size (800,800);
background (0);
smooth();
stroke (123,7,145);
int n =10700;
float [] xTop =new float [n];
float [] xBottom= new float [n];
for (int i = 0 ; i<n; i ++){
  xTop[i] = random (50,750);
  xBottom[i] = random (50,750);
  ellipse (xTop[i],xBottom [i],10,10);
}
  
