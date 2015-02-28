
float j=150*random(1);
float k=random(100,250);
float l=random(100,250);
float i=0;

void setup(){size(700,700,P3D);
translate(250,250,0);
frameRate(50);
smooth();
//noStroke();
};
void draw(){


background(0,0,0);

translate(250,150,-1000);

i+=PI/180;

pushMatrix();
for(int m=0;m<8;m++){
translate(noise(j/2),noise(k/2),10+k);
  rotateY(100+frameCount*0.01);
  rotateZ(20+frameCount*0.03);
  fill(j+sin(i)*100,k+cos(i)*50,l+20*m,80);
  stroke(255,255,0,80);
  strokeWeight(0.1);
sphere(50);
}
for(int m=0;m<8;m++){
translate(-noise(j/2),-noise(k/2),-10-k);
  rotateY(100+frameCount*0.01);
  rotateZ(20+frameCount*0.02);
  fill(j+sin(i)*100,k+cos(i)*50,l+20*m,80);
  stroke(255,255,0,80);
  strokeWeight(0.1);
sphere(50);
}
popMatrix();
for(int m=0;m<8;m++){
translate(-noise(j/2),-noise(k/2),-10-k);
  rotateY(100+frameCount*0.01);
  rotateZ(20+frameCount*0.02);
  fill(j+sin(i)*100,k+cos(i)*50,l+20*m,80);
  stroke(255,255,0,80);
  strokeWeight(0.1);
sphere(50);
}

for(int m=0;m<7;m++){
translate(k,l,noise(10+j));
  rotateZ(100+frameCount*0.01);
  rotateX(20+frameCount*0.03);
  fill(j+sin(i)*100,k+cos(i)*50,l+20*m,80);
  stroke(255,255,0,80);
  strokeWeight(0.1);
sphere(50);
}

};


