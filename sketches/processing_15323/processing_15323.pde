
etourneau[] sturnz;
float limits=300;
float rotation=0,rotationx=0;
float c=0;

void setup(){
  size(500,500,P3D);
  //smooth();
  background(0);stroke(255);
  colorMode(HSB, 360,100,100); 
  int n=800;
  sturnz=new etourneau[n];
  for(int a=0;a<n;a++){ 
    float r=random(2);
    if(r<1){
     sturnz[a]=new etourneau(color(245,99,99));
    } else {
      if(r<2){
    sturnz[a]=new etourneau(color(0,99,99));
      } else {
    sturnz[a]=new etourneau(color(100,99,99));
      }
    }
  }
  //fill(0,10);
}

void draw(){
 // rect(-1,-1,width+2,height+2);
  background(0);
  c+=0.5;
  c%=255;
  stroke(c,255,255);
  rotation-=(mouseX-250)*0.0001;
  rotationx-=(mouseY-250)*0.0001;
  translate(width/2, height/2, 0);
  rotateY(rotation);
  rotateX(rotationx);
  for(int a=0;a<sturnz.length;a++){
    sturnz[a].dessine();
  }
 // box(limits*2,limits*2,limits*2);
}

void mousePressed(){
  save("thumb.png");
}


