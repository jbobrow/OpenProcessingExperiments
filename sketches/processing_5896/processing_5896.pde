
//original code by dotlassie
//modified by Stephanie Vecellio



int t,i,w=255,a[]=new int[w*w];

void setup(){
  size (800,800);
  background (255);


}

void draw(){


  beginShape(17);
  fill(random(255),random(100),random(255));
  a[t]=mouseY;
  a[t+1]=mouseX-w;
  for(i=0;i<t;i+=2)
    vertex(w+cos((t-i)/99f)*a[i+1],a[i]);
  if(a[t]>0)t+=2;
  endShape();

}

void mousePressed(){
  background(random(255),random(255),random(255)); 
}



