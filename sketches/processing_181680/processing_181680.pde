
float centX, centY;
int diam = 10;
//int red, green, blue;
color[] ColorCircle=new color[50];

void setup(){
  size(600,600);
  frameRate(24);
  smooth();
  background(120);
  centX=width/2;
  centY=height/2;
  stroke(0);
  strokeWeight(5);
   for (int i=0;i<50;i++){
    ColorCircle[i]=color(int(random(200,250)),0,0);
    fill(ColorCircle[i]);
    
   };
  
}

void draw(){
  
  circleColor();
  drawCircle();
  drawRect();
  
}

void circleColor(){
  for(int i=48;i>=0;i--){
    ColorCircle[i+1]=ColorCircle[i];
    fill(ColorCircle[i]);
    
  };
  int red=int(random(180,250));
  int green=int(random(0,20));
  int blue=int(random(0,20));
  ColorCircle[0]=color(red,green,blue);

}

void drawCircle(){
  for(int i=0;i<49;i++){
    fill(ColorCircle[i]);
    stroke(ColorCircle[i]);
    ellipse(centX, centY, diam, diam);
    diam+=1;
  }
}

void drawRect(){
  
    for(int i=0;i<49;i++){ 
  if(diam>=800){
    background(120);
      strokeWeight(1);
      stroke(240);
      fill(ColorCircle[i]);
      rect(i*(width/100),int(random(700)),i*(int(random(50))),20,i*(width/100),i*(height/100),i*(width/100),i*(height/100));
    fill(ColorCircle[i]);
      rect(i*(width/100),int(random(500)),i*(int(random(100))),20,i*(width/100),i*(height/100),600,i*(height/100));
      fill(ColorCircle[i]);
      rect(10,int(random(1,700)),int(random(100,200)),20,100,i*(height/100),600,i*(height/100));
    fill(ColorCircle[i]);
      rect(10,int(random(1,700)),int(random(100,200)),20,100,i*(height/100),600,i*(height/100));
      rect(i*(width/100),int(random(700)),i*(int(random(50))),20,i*(width/100),i*(height/100),i*(width/100),i*(height/100));
     fill(ColorCircle[i]);
      rect(i*(width/100),int(random(500)),i*(int(random(100))),20,i*(width/100),i*(height/100),600,i*(height/100));
      fill(ColorCircle[i]);
      rect(10,int(random(1,700)),int(random(100,200)),20,100,i*(height/100),600,i*(height/100));
   fill(ColorCircle[i]);
   rect(10,int(random(1,700)),int(random(100,400)),20,100,i*(height/100),600,i*(height/100));
   fill(ColorCircle[i]);
   rect(10,int(random(1,700)),int(random(100,600)),20,100,i*(height/100),600,i*(height/100));
   fill(ColorCircle[i]);
      rect(100,int(random(1,700)),int(random(400,500)),20,100,i*(height/100),600,i*(height/100));
         fill(ColorCircle[i]);
      rect(i*(width/100),int(random(700)),i*(int(random(50))),20,i*(width/100),i*(height/100),i*(width/100),i*(height/100));
    fill(ColorCircle[i]);
      rect(i*(width/100),int(random(500)),i*(int(random(100))),20,i*(width/100),i*(height/100),600,i*(height/100));
   fill(ColorCircle[i]);
      rect(10,int(random(1,700)),int(random(100,200)),20,100,i*(height/100),600,i*(height/100));
    fill(ColorCircle[i]);
      rect(10,int(random(1,700)),int(random(100,200)),20,100,i*(height/100),600,i*(height/100));
      rect(i*(width/100),int(random(700)),i*(int(random(50))),20,i*(width/100),i*(height/100),i*(width/100),i*(height/100));
     fill(ColorCircle[i]);
      rect(i*(width/100),int(random(500)),i*(int(random(100))),20,i*(width/100),i*(height/100),600,i*(height/100));
      fill(ColorCircle[i]);
      rect(10,int(random(1,700)),int(random(100,200)),20,100,i*(height/100),600,i*(height/100));
   fill(ColorCircle[i]);
      rect(70,int(random(1,700)),int(random(300,600)),20,100,i*(height/100),600,i*(height/100));
      i++;
      
};
    }
}




