
public PImage a,ao,b,bo,c,co,mix2;
public String ext2 = ".png";
public String startname = "s";

public int inputWidth = 480;
public int inputHeight = 640;

void setup(){



  size(720,720,P3D); 

  draw1();
}
PImage merge(PImage a, PImage b, PImage c){
  PImage   mix= new PImage(a.width,a.height);

  mix.blend(a,0,0,a.width,a.height,0,0,a.width,a.height,SCREEN);
  mix.blend(b,0,0,a.width,a.height,0,0,a.width,a.height,SCREEN);
  mix.blend(c,0,0,a.width,a.height,0,0,a.width,a.height,SCREEN); 
  return mix;

}
public boolean firstpass= true;

void mousePressed(){
  image(mix2,(width-mix2.width)/2,(height-mix2.height));
  if (mouseY < my && mouseX > pad && mouseX < pad + mx  && firstpass == true){
    // a.resize(mix2.width,mix2.height);
    image(ao,(width-mix2.width)/2,(height-mix2.height));
    // a.resize((int)mix2.width/3,(height-mix2.height));
    stroke(233,23,23);
    noFill();
    rect(((width-mix2.width)/2)*1-1,0,a.width+1,a.height-2);

  }
  else
  {
    stroke(-1);
    noFill();
    rect(((width-mix2.width)/2)*1-1,0,a.width+1,a.height-2);
  }

  if (mouseY < my && mouseX> pad +mx ){

    image(bo,(width-mix2.width)/2,(height-mix2.height));

    stroke(233,23,23);
    noFill();
    rect(((width-mix2.width)/2)*1-1+mx,0,a.width+1,a.height-2);

  }
  else
  {
    stroke(-1);
    noFill();
    rect(((width-mix2.width)/2)*1-1+mx,0,a.width+1,a.height-2);
  }

  if (mouseY < my && mouseX> pad +(mx*2) ){

    image(co,(width-mix2.width)/2,(height-mix2.height));



    noFill();
    stroke(-1);
    rect(((width-mix2.width)/2)*1-1+mx,0,a.width+1+mx,a.height-2);
    stroke(233,23,23);
    rect(((width-mix2.width)/2)*1-1+mx+mx,0,a.width+1,a.height-2);

  }
  else
  {
    stroke(-1);
    noFill();
    rect(((width-mix2.width)/2)*1-1+mx+mx,0,a.width+1,a.height-2);
  }



}
void draw(){


}
public int my,mx ,pad=0;
void draw1(){
  background(-1);

  a= loadImage(startname+"1"+ext2);
  b= loadImage(startname+"2"+ext2);
  c= loadImage(startname+"3"+ext2);  
  ao= loadImage(startname+"1"+ext2);
  bo= loadImage(startname+"2"+ext2);
  co= loadImage(startname+"3"+ext2); 
  mix2 = new PImage(a.width,a.height);

  mix2 = merge(a,b,c);
  image(mix2,(width-mix2.width)/2,(height-mix2.height));
  a.resize((int)mix2.width/3,(height-mix2.height));
  b.resize((int)mix2.width/3,(height-mix2.height));
  c.resize((int)mix2.width/3,(height-mix2.height));
  my=(height-mix2.height);
  mx=a.width;
  pad= (width-mix2.width)/2;
  image(a,((width-mix2.width)/2)*1,0);
  image(b,((width-mix2.width)/2)+((b.width)*1),0);
  image(c,((width-mix2.width)/2)+((c.width)*2),0);

}
void keyPressed(){
  if (key=='1'){

    startname = "p";
    ext2 =  ".png";
    draw1();
  }

  if (key=='2'){
    startname = "aphase";
    ext2 =  ".jpg";
    draw1();
  }  
  if (key=='3'){
    startname = "phase";
    ext2 =  ".png";
    draw1();
  }
  if (key=='4'){
    startname = "s";
    ext2 =  ".png";
    draw1();
  }
  if (key=='5'){
    startname = "xp";
    ext2 =  ".jpg";
    draw1();
  }
if (!online && key =='s'){
 save("remerge.png"); 
}
}





