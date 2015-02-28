
int s=255,i,j;
void setup(){size(s,s);}
void draw(){
j++;
loadPixels();
for(i=0;i<s*s;i+=1){if(j>random(i))pixels[i]=color(s,i/j,i/j);};
updatePixels();
}
//comment is sence :p

