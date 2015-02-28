
float s,S,n;
int i;
void setup(){size(200,100);}
void draw(){
width=300;
background(255);
fill(s=i=0);
float f=S/++n*100;
text(""+f.toFixed(2)+"% of this is white",20,40);
loadPixels();
while(i<width*height)if(pixels[i++]==-1)s++;
S+=s/height/width;
}



