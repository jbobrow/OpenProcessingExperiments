
int x=0,y=0,i=0;
void setup(){
}
void draw(){


  i++;

  for(int j=0;j<width*height/100;j++){
        fill(random(255),random(255),random(255));
    x=j%(width/10);
    y=j-j%(width/10);
    rect(x*10,y/(width/100),i%10,i%10);
  }
    PImage a = get();
  image (a,pmouseX-mouseX,pmouseY-mouseY,width-(pmouseX-mouseX)*2,height-(pmouseY-mouseY)*2);
}





