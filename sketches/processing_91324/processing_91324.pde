
int t,i,w=255,a[]=new int[w*w];
void draw(){
background(w);smooth();beginShape(17);
a[t]=mouseY;a[t+1]=mouseX-w;
for(i=0;i<t;i+=2)
 vertex(w+cos((t-i)/99f)*a[i+1],a[i]);
if(a[t]>0)t+=2;
strokeWeight(2);

    int red = mouseX / 400 * 255;
    int green = mouseY / 400 * 255;
    int blue = (mouseX * mouseY) 
    stroke(red, green, blue);
endShape();
}
void setup() {
  size(1000, 1000);
}
