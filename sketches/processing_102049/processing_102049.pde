
float x0,y0,x1,y1, d=5,s=0,m=20;
int imageSaved=0,brush=1;
boolean fading=true,dir=true,colorRGB=true,clear=false;

void setup(){
  size(800,800);
  background(0);
  fill(0);
  colorMode(HSB,255);
  x0=0;
  y0=height/2;
  x1=x0;
  y1=y0;
  
}
void draw(){
  if(fading){stroke(255);strokeWeight(1);fill(0);rect(2,2,18,18);fill(255);rect(5,5,12,12);}
  else{stroke(255);strokeWeight(1);fill(0);rect(2,2,18,18);fill(0);rect(5,5,12,12);}
  
  if(clear){fill(0);rect(0,0,width,height);clear=false;}
  
}


void mouseDragged(){  
  float h=0,s=0,b=0;
  if(colorRGB){
    h = map(mouseX, 0, width, 0, 255);
    s = map(mouseY, 0, width, 0, 255);
    b = dist(mouseX,mouseY,width/2,height/2);
  }
  else{  
    h=map(abs(width/2-mouseX),0,width,0,255);
    s=map(height-mouseY,0,height,30,255);
    b=dist(mouseX,mouseY,width*.5,height*1.3);
  }
  
  float speed=dist(pmouseX,pmouseY,mouseX,mouseY);
  float lineWidth = map(speed, 0, 10, 40, 1);
  lineWidth = constrain(lineWidth, 1, 20);
  
  if(fading){
    noStroke();
    float alpha=map(speed,0,20,0,3);
    fill(0, alpha);
    rect(0, 0, width, height);
  }
  
  smooth();
  switch(brush){
    case 1:
      brush1(h,s,b,pmouseX,pmouseY,mouseX,mouseY,lineWidth);
      break;
    case 2:
      brush2(h,s,b,pmouseX,pmouseY,mouseX,mouseY,lineWidth,m);
      break;
    case 3:
      m=200/sqrt(mouseX+mouseY);
      brush3(h,s,b,pmouseX,pmouseY,mouseX,mouseY,lineWidth,m);
      break;
    case 4:  
      if(m>100)m=99;
      if(dir)m*=.95;
      else m/=0.95; 
      if(m>100 || m<1)dir=!dir;       
      brush4(h,s,b,pmouseX,pmouseY,mouseX,mouseY,lineWidth,m);
      break;
    case 5:      
      brush5(h,s,b,pmouseX,pmouseY,mouseX,mouseY,lineWidth,m);
      break;
    case 6:      
      brush6(h,s,b,pmouseX,pmouseY,mouseX,mouseY,lineWidth,m);
      break;
    case 100:
      break;
  }

}

void keyPressed(){
  //if(key=='1'){}
  switch(key){
    case '1':
      brush=1;
      break;
    case '2':
      brush=2;
      break;
    case '3':
      brush=3;
      break;
    case '4':
      brush=4;
      break;
    case '5':
      brush=5;
      break;
    case '6':
      brush=6;
      break;
    case 'f':
      fading=!fading; 
      break;
    case 'm':
      colorRGB=!colorRGB; 
//      if(colorRGB)colorMode(RGB,255);
//      else colorMode(HSB,255);
      break;
    case 'c':
      clear=true; 
      break;
  }
}

void mousePressed(){
  m=random(0,255);//print(m+", ");
  if(mouseButton==RIGHT){
    imageSaved++;
    File f=new File("pic"+imageSaved+".png");
    selectOutput("Save image to","saveFile",f);
  }
  else if(mouseButton==LEFT & mouseX<20 & mouseY<20){
    fading=!fading; 
    if(fading){stroke(255);strokeWeight(1);fill(0);rect(2,2,18,18);fill(255);rect(5,5,12,12);}
    else{stroke(255);strokeWeight(1);fill(0);rect(2,2,18,18);fill(0);rect(5,5,12,12);}
  }
}

void saveFile(File f){
  save(f.getAbsolutePath());
}

void brush1(float h,float s,float b,int pmouseX,int pmouseY,int mouseX,int mouseY,float lineWidth){
  stroke(h+random(-10,10), s, b);
  strokeWeight(lineWidth/2);
  line(pmouseX, pmouseY,mouseX, mouseY);
  line(width-pmouseX,pmouseY,width-mouseX,mouseY);
}

void brush2(float h,float s,float b,int pmouseX,int pmouseY,int mouseX,int mouseY,float lineWidth,float m){
  //h=map(h+m/2-255,m/2-255,m/2,0,255);
  stroke(h, s, b);
  strokeWeight(lineWidth/2+2);
  line(pmouseX, pmouseY,mouseX, mouseY);
  //line(width-pmouseX,pmouseY,width-mouseX,mouseY);
  for(int i=0;i<5;i++){
    stroke(map(h+random(-100,100),-100,355,0,255), s, b*1.5);
    strokeWeight(2);
    float l=lineWidth/2+2;
    line(mouseX,mouseY,mouseX+random(-l,l),mouseY+random(-l,l)); 
  }  
}

void brush3(float h,float s,float b,int pmouseX,int pmouseY,int mouseX,int mouseY,float lineWidth,float m){
  stroke(h, s, b);
  strokeWeight(1);  
  m=m+random(-5,5);
  ellipse(mouseX, mouseY,m, m);
  ellipse(mouseX-m, mouseY-m,m/2, m/2);
  ellipse(mouseX+m, mouseY-m,m/2, m/2);
  ellipse(mouseX-m, mouseY+m,m/2, m/2);
  ellipse(mouseX+m, mouseY+m,m/2, m/2);
}

void brush4(float h,float s,float b,int pmouseX,int pmouseY,int mouseX,int mouseY,float lineWidth,float m){
  stroke(h, s, b);
  strokeWeight(1);  
  //m=m-5;
  ellipse(mouseX, mouseY,m, m);
//  ellipse(mouseX-m, mouseY-m,m/2, m/2);
//  ellipse(mouseX+m, mouseY-m,m/2, m/2);
//  ellipse(mouseX-m, mouseY+m,m/2, m/2);
//  ellipse(mouseX+m, mouseY+m,m/2, m/2);
}



void brush5(float h,float s,float b,int pmouseX,int pmouseY,int mouseX,int mouseY,float lineWidth,float m){
  stroke(h+random(-10,10), s, b);
  strokeWeight(lineWidth/2);
  line(pmouseX, pmouseY,mouseX, mouseY);
}

void brush6(float h,float s,float b,int pmouseX,int pmouseY,int mouseX,int mouseY,float lineWidth,float m){
  stroke(h+random(-10,10), s, b);
  strokeWeight(lineWidth/2);
  line(pmouseX, pmouseY,mouseX, mouseY);
  line(width-pmouseX,pmouseY,width-mouseX,mouseY);
  line(width-pmouseX,height-pmouseY,width-mouseX,height-mouseY);
  line(pmouseX,height-pmouseY,mouseX,height-mouseY);
}

