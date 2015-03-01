
int[] Xlist = new int[10];

int[] Ylist = new int[10];

void setup(){

size(600,600)

}

void draw(){

background(255,4,255);

for(int i=0; i<Xlist.length;i++){

ellipse(Xlist[i],Ylist[i],15,15);

Xlist[i]=mouseX/i;

}

noStroke();

int X=random(width);

int Y=random(height);

fill(Y,X,X);

ellipse(X,Y, 15, 15);

}
