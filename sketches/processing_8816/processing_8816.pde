
float luminosite=300;
PFont maTypo;
int[] picked;
PGraphics monPicker;

void setup(){
  colorMode(HSB, TWO_PI, 150,300); // je me mets en HSB, je décide que H va de 0 à 2xpi, que S va de 0 à 150 et B de 0 à 300.
  size(500,500);background(0); 
  maTypo = createFont("arial",10,false);
  textFont(maTypo);rectMode(CENTER);
  noFill();
  picked = new int[2];picked[0]=250;picked[1]=200;
  monPicker =   createGraphics(300,300,P2D);
  redessinePicker();
}

void draw(){
  noFill();
  background(0);
  image(monPicker,100,50);
  if(mousePressed  ){
    if(mouseY>390){
      luminosite =  constrain((mouseX-100),0,300);
    } 
    else { 
      if(dist(mouseX,mouseY,250,200)<150){
        picked[0]=mouseX;
        picked[1]=mouseY;
      }
    }
  redessinePicker();
  }
  for(int a=0;a<300;a++){
    stroke(0,0,a);
    line(a+100,400,a+100,440);
  }
  line(luminosite+100,398,luminosite+100,442);
  color c=get(picked[0],picked[1]);
  fill(0,0,255);
  text("R: "+regledetrois(red(c),TWO_PI,255),400,50);
  text("G: "+regledetrois(green(c),150,255),400,60);
  text("B: "+regledetrois(blue(c),300,255),400,70);
  text("H: "+regledetrois(hue(c),TWO_PI,255),400,80);
  text("S: "+regledetrois(saturation(c),150,255),400,90);
  text("V: "+regledetrois(brightness(c),300,255),400,100);
  rect(picked[0],picked[1],4,4);
  fill(c);
  rect(420,330,40,40);
}

int regledetrois(float val, float scalo, int scald){
  int val2 = (int)((val/scalo)*scald);
  return val2;
}

void redessinePicker(){  
  monPicker.beginDraw();
  monPicker.colorMode(HSB, TWO_PI, 150,300); 
  for(int x=0;x<300;x++){
    for(int y=0;y<300;y++){
      float Saturation =dist(x,y,150,150);
      if(Saturation<150){
        float Teinte = atan2(150-y,150-x)+PI; 
        monPicker.stroke(Teinte, Saturation, luminosite);
        monPicker.point(x,y); 
      }
    } 
  } 
  monPicker.endDraw();
  
}



