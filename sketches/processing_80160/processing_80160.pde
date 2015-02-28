
void setup(){
  size(300,200);
  noStroke();
}
void draw(){
  background(255);
  int i=0;
  while(i<300){
    fill(i);
    rect(i,0,20,200);
    if(mousePressed){
      if(mouseX<60){
        fill(i);
        rect(i,0,20,200);
        fill(random(i));
        arc(150,100,50,50,radians(0),radians(1));
        text("Cargando 0%",150,180);
      }
      if(mouseX>60&&mouseX<120){
        fill(i,0,0);
        rect(i,0,20,200);
        fill(random(i));
        arc(150,100,50,50,radians(0),radians(90));
        text("Cargando 25%",150,180);
      }
      if(mouseX>120&&mouseX<180){
        fill(i,i,0);
        rect(i,0,20,200);
        fill(random(i));
        arc(150,100,50,50,radians(0),radians(180));
        text("Cargando 50%",150,180);
      }
      if(mouseX>180&&mouseX<240){
        fill(0,i,0);
        rect(i,0,20,200);
        fill(random(i));
        arc(150,100,50,50,radians(0),radians(270));
        text("Cargando 75%",150,180);
      }
      if(mouseX>240&&mouseX<300){
        fill(0,i,i);
        rect(i,0,20,200);
        fill(random(i));
        arc(150,100,50,50,radians(0),radians(360));
        text("Cargando 100%",150,180);
      }
    }
    i=i+20;
  }
}

