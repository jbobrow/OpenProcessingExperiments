
// Omer Ipekci
// April 1st, 2010
// Visual Programming Class
// Shapes and Mouse
// !! Drag over & Click and Drag & Click while over !!
int a=100,c=100,d=100,kx=0;
float k=200,k2=200;
boolean klik, over;


void setup() {
  size(400, 400);
  colorMode(HSB, 100);
  background(0);


}

void draw() {
  klik = false;
  fill(a,70,60);
  rectMode(CENTER);
  rect(100,100,k2,k2);
  rectMode(CORNER);
  fill(c,70,60);
  rect(0,200,200,200);
  fill(d,70,60);
  rect(200,0,200,200);

  if (mousePressed==true){
    klik=true;
  }
  else {
    klik=false;
  }


  //shapes
  //1
  k= constrain((dist(mouseX,mouseY,100,100)*2),0,200);
  if ((k<199)&&(klik==true)){
    a=int(k/2);
    k2=k;
  }
  println(k);
  //2
  if ((mouseX>200)&&(mouseY<200)){
    d=int(norm(mouseX,200,400)*100);
  }
  //3
  if ((mouseX>0)&&(mouseY>200)){
    over=true;
  }
}

void mouseClicked(){
  if (over == true) {
    c=int(random(0,100));
  }
}



