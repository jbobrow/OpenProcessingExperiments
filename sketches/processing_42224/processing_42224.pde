
int f=0;
float g=0;

void setup(){
size (560,560);
}



void draw(){
  PImage img=loadImage("48388988753df_hp.jpg");
  PImage img2=loadImage("ritratto (6).jpg");
  PImage img3=loadImage("un-ritratto-in-bianco-e-nero-di-ian-mckellen-con-spiga-di-grano-125081.jpg");
  PImage img4=loadImage("Ritratto.jpg");

  noTint();
  image(img,0,0);
  image(img2,280,0);
  image(img3,0,280);
  image(img4,280,280);

if (mousePressed && mouseX>280 && mouseY<280){
    f=f+10;
    noStroke();
    fill(0,f);   
    rect(280,0,280,280);
  }
  else {
    f=0;
  }
if (mouseX<280 && mouseY<280){
  for(int i=0; i<280; i=i+1){
    color c=img.get(mouseX,i);
    stroke(c);
    line(mouseX,i,width,i);
    }
}
if (mouseX<280 && mouseY>280 && mousePressed){
  g=g+1;
  image(img3,0,280,280+g,280+g);
}else{
  g=g-1;
}
if (mouseX>280 && mouseY>280 && mousePressed){
  filter(GRAY);
  filter(POSTERIZE, 4);
  image(img,0,0);
  image(img2,280,0);
  image(img3,0,280);
}
}

                
                
